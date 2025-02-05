import 'package:ceiba_app/app/models/geo.dart';
import 'package:hive/hive.dart';
part 'address.g.dart';
@HiveType(typeId: 2)
class AddressDTO {
  @HiveField(0)
  String street;
  @HiveField(1)
  String suite;
  @HiveField(2)
  String city;
  @HiveField(3)
  String zipcode;
  @HiveField(4)
  GeoDTO geo;

  AddressDTO({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory AddressDTO.fromJson(Map<String, dynamic> json) {
    return AddressDTO(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: GeoDTO.fromJson(json['geo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo.toJson(),
    };
  }
}
