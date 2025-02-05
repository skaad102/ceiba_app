import 'package:ceiba_app/app/models/geo.dart';

class AddressDTO {
  String street;
  String suite;
  String city;
  String zipcode;
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
