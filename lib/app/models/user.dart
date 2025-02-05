import 'package:ceiba_app/app/models/address.dart';
import 'package:ceiba_app/app/models/company.dart';

class UserDTO {
  int id;
  String name;
  String username;
  String email;
  AddressDTO address;
  String phone;
  String website;
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
