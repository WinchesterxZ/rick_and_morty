import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chracters_state.dart';

class ChractersCubit extends Cubit<ChractersState> {
  ChractersCubit() : super(ChractersInitial());
}
