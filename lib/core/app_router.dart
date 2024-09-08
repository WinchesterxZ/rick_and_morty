import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/util/app_strings.dart';
import 'package:rick_and_morty/presentation/views/chracters_details_screen.dart';
import 'package:rick_and_morty/presentation/views/chracters_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.chractersScreen:
        return MaterialPageRoute(builder: (_) => ChractersView());
      case AppStrings.chractersDetailsScreen:
        return MaterialPageRoute(builder: (_) => ChractersDetailsScreen());
    }
  }
}
