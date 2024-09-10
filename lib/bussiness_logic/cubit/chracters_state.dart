part of 'chracters_cubit.dart';

@immutable
sealed class ChractersState {}

final class ChractersInitial extends ChractersState {}

final class CharactersLoaded extends ChractersState {
  final List<ChractersModel> chracters;
  
  CharactersLoaded({required this.chracters});
}


final class ChractersLoading extends ChractersState {}

final class ChractersNoConnection extends ChractersState {}




