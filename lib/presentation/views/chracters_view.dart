import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/widgets/chracter_item.dart';

class ChractersView extends StatelessWidget {
  const ChractersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ChracterItem();
        },
      ),
    );
  }
}
