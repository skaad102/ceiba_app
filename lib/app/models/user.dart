import 'package:ceiba_app/app/models/address.dart';
import 'package:ceiba_app/app/models/company.dart';
import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 1)
class UserDTO {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String username;
  @HiveField(3)
  String email;
  @HiveField(4)
  AddressDTO address;
  @HiveField(5)
  String phone;
  @HiveField(6)
  String website;
  @HiveField(7)
  CompanyDTO company;

  UserDTO({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: AddressDTO.fromJson(json['address']),
      phone: json['phone'],
      website: json['website'],
      company: CompanyDTO.fromJson(json['company']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address.toJson(),
      'phone': phone,
      'website': website,
      'company': company.toJson(),
    };
  }
}
