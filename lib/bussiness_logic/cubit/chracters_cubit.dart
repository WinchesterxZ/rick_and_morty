import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/models/chracters_model.dart';
import 'package:rick_and_morty/data/repository/chracters_repository.dart';

part 'chracters_state.dart';

class ChractersCubit extends Cubit<ChractersState> {
  final ChractersRepository chractersRepository;
  List<ChractersModel> characters = [];
  bool firstTime = true;

  ChractersCubit(this.chractersRepository) : super(ChractersInitial());





  Future<void> getAllCharacters() async {

    emit(ChractersLoading());
    try {
      final fetchedCharacters = await chractersRepository.getAllChracters();
      log('Fetched ${fetchedCharacters.length} characters');
      if (fetchedCharacters.isNotEmpty) {
        characters = fetchedCharacters;
        emit(CharactersLoaded(chracters: characters));
        firstTime = false;
      } else {
        emit(ChractersNoConnection()); // nodata
      }
    } catch (e) {
      emit(ChractersNoConnection());
    }
  }
}
