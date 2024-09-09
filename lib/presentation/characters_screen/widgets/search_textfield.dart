import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/chracters_model.dart';

Widget buildSearchTextField(List<ChractersModel> allCharacters,
    TextEditingController searchTextController,
    {required void Function() onBackPressed,
    required void Function() onClearPressed,
    required void Function(String) onValueChanged}) {
  return TextField(
    controller: searchTextController,
    cursorColor: Colors.black,
    decoration: InputDecoration(
        hintText: 'Find Character ...',
        border: InputBorder.none,
        hintStyle: const TextStyle(fontSize: 15, color: Colors.white),
        prefixIcon: IconButton(
            onPressed: onBackPressed,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        suffixIcon: IconButton(
            onPressed: onClearPressed,
            icon: const Icon(
              Icons.clear,
              color: Colors.white,
            ))),
    style: const TextStyle(color: Colors.white, fontSize: 18),
    onChanged: onValueChanged,
  );
}
