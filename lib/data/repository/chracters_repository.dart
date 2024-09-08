import 'package:rick_and_morty/data/datasource/chracters_web_service.dart';
import 'package:rick_and_morty/data/models/chracters_model.dart';

class ChractersRepository {
  final ChractersWebService chractersWebService;

  ChractersRepository({required this.chractersWebService});

  Future<List<ChractersModel>> getAllChracters() async {
    final characters = await chractersWebService.getAllChracters();
    return characters
        .map((character) => ChractersModel.fromJson(character))
        .toList();
  }
}
