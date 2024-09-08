import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bussiness_logic/cubit/chracters_cubit.dart';
import 'package:rick_and_morty/core/util/app_strings.dart';
import 'package:rick_and_morty/data/datasource/chracters_web_service.dart';
import 'package:rick_and_morty/data/repository/chracters_repository.dart';
import 'package:rick_and_morty/presentation/views/chracters_details_screen.dart';
import 'package:rick_and_morty/presentation/views/chracters_view.dart';

class AppRouter {
  late ChractersRepository chractersRepository;
  late ChractersCubit chractersCubit;

  AppRouter() {
    chractersRepository =
        ChractersRepository(chractersWebService: ChractersWebService());
    chractersCubit = ChractersCubit(chractersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.chractersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => chractersCubit,
                  child: ChractersView(),
                ));
      case AppStrings.chractersDetailsScreen:
        return MaterialPageRoute(builder: (_) => ChractersDetailsScreen());
    }
  }
}
