import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/app_router.dart';

void main() {
  runApp(RicAndMortyApp(appRouter: AppRouter()));
}

class RicAndMortyApp extends StatelessWidget {
  final AppRouter appRouter;
  const RicAndMortyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,

    );
  }
}
