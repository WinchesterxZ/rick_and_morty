import 'package:rick_and_morty/data/models/sub_models/location_model.dart';
import 'package:rick_and_morty/data/models/sub_models/origin_model.dart';

class ChractersModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final Origin origin;
  final Location location;
  final String image;
  
  ChractersModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
  });
  factory ChractersModel.fromJson(Map<String, dynamic> json) {
    return ChractersModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      origin: Origin.fromJson(json['origin']),
      location: Location.fromJson(json['location']),
      image: json['image'],
    );
  }
}
