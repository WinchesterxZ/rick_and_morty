import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bussiness_logic/cubit/chracters_cubit.dart';
import 'package:rick_and_morty/data/models/chracters_model.dart';
import 'package:rick_and_morty/presentation/characters_screen/widgets/chracter_item.dart';
import 'package:rick_and_morty/presentation/characters_screen/widgets/search_textfield.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final _searchTextController = TextEditingController();
  late List<ChractersModel> searchedCharacters;
  bool _isSearching = false;
  Widget _buildSearchTextField(List<ChractersModel> allCharacters) {
    return buildSearchTextField(allCharacters, _searchTextController,
        onBackPressed: () {
      setState(() {
        _searchTextController.clear();
        _isSearching = false;
      });
    }, onClearPressed: () {
      setState(() {
        _searchTextController.clear();
      });
    }, onValueChanged: (searchedCharacter) {
      setState(() {
        addSearchedItemToList(searchedCharacter, allCharacters);
      });
    });
  }

  void addSearchedItemToList(
      String searchedCharacter, List<ChractersModel> allCharacters) {
    searchedCharacters = allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChractersCubit>(context).getAllCharacters();
  }

  Widget buildBlockWidget(ChractersState state) {
    if (state is CharactersLoaded) {
      log('state loaded');
      return buildLoadedList(state.chracters);
    } else {
      return showProgressIndicator();
    }
  }

  Widget buildLoadedList(List<ChractersModel> allCharacters) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      physics: const ClampingScrollPhysics(),
      itemCount: _searchTextController.text.isEmpty
          ? allCharacters.length
          : searchedCharacters.length,
      itemBuilder: (context, index) {
        ChractersModel character = _searchTextController.text.isEmpty
            ? allCharacters[index]
            : searchedCharacters[index];
        return ChracterItem(
          character: character,
        );
      },
    );
  }

  Widget showProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChractersCubit, ChractersState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: const Color(0xffE0E0E0),
            appBar: AppBar(
              backgroundColor: Color(0xff262626),
              title: _isSearching
                  ? _buildSearchTextField(
                      (state is CharactersLoaded) ? state.chracters : [])
                  : const Text(
                      'Characters',
                      style: TextStyle(color: Colors.white),
                    ),
              actions: !_isSearching
                  ? [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _isSearching = true;
                            });
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ))
                    ]
                  : null,
            ),
            body: buildBlockWidget(state));
      },
    );
  }
}
