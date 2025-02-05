class CompanyDTO {
  String name;
  String catchPhrase;
  String bs;

  CompanyDTO({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory CompanyDTO.fromJson(Map<String, dynamic> json) {
    return CompanyDTO(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }
}
