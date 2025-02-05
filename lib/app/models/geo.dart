import 'package:hive/hive.dart';
part 'geo.g.dart';

@HiveType(typeId: 3)
class GeoDTO {
  @HiveField(0)
  String lat;
  @HiveField(1)
  String lng;

  GeoDTO({
    required this.lat,
    required this.lng,
  });

  factory GeoDTO.fromJson(Map<String, dynamic> json) {
    return GeoDTO(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}
