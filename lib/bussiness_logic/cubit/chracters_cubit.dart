
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/models/chracters_model.dart';
import 'package:rick_and_morty/data/repository/chracters_repository.dart';

part 'chracters_state.dart';

class ChractersCubit extends Cubit<ChractersState> {
  final ChractersRepository chractersRepository;
  List<ChractersModel> characters = [];
  ChractersCubit(this.chractersRepository) : super(ChractersInitial());

  Future<List<ChractersModel>> getAllCharacters() async {
    await chractersRepository.getAllChracters().then((characters) {
      log('${characters.length}');
      emit(CharactersLoaded(chracters: characters));
      this.characters = characters;
    });
    return characters;
  }
}
