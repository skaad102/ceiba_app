class GeoDTO {
  String lat;
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
