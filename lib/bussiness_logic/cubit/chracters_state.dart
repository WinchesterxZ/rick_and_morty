part of 'chracters_cubit.dart';

@immutable
sealed class ChractersState {}

final class ChractersInitial extends ChractersState {}

class CharactersLoaded extends ChractersState {
  final List<ChractersModel> chracters;

  CharactersLoaded({required this.chracters});
}
