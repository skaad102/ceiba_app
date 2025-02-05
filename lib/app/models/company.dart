import 'package:hive/hive.dart';
part 'company.g.dart';

@HiveType(typeId: 4)
class CompanyDTO {
  @HiveField(0)
  String name;
  @HiveField(1)
  String catchPhrase;
  @HiveField(2)
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
