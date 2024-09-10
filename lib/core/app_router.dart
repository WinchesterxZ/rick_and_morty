import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bussiness_logic/cubit/chracters_cubit.dart';
import 'package:rick_and_morty/core/util/app_strings.dart';
import 'package:rick_and_morty/data/datasource/chracters_web_service.dart';
import 'package:rick_and_morty/data/models/chracters_model.dart';
import 'package:rick_and_morty/data/repository/chracters_repository.dart';
import 'package:rick_and_morty/presentation/characters_details_screen/chracters_details_screen.dart';
import 'package:rick_and_morty/presentation/characters_screen/screens/chracters_screen.dart';

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
                  child: const CharactersScreen(),
                ));
      case AppStrings.chractersDetailsScreen:
        final character = settings.arguments as ChractersModel;
        return MaterialPageRoute(builder: (_) => ChractersDetailsScreen(chractersModel: character,));
    }
    return null;
  }
}
