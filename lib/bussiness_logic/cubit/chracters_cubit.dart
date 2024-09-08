import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/models/chracters_model.dart';
import 'package:rick_and_morty/data/repository/chracters_repository.dart';

part 'chracters_state.dart';

class ChractersCubit extends Cubit<ChractersState> {
  final ChractersRepository chractersRepository;
  late List<ChractersModel> characters;
  ChractersCubit(this.chractersRepository) : super(ChractersInitial());

  List<ChractersModel> getAllCharacters() {
    chractersRepository.getAllChracters().then((characters) {
      this.characters = characters;
      emit(CharactersLoaded(chracters: characters));
    });
    return characters;
  }
}
