import 'package:ceiba_app/app/app.locator.dart';
import 'package:ceiba_app/app/models/user.dart';
import 'package:ceiba_app/services/backend_api_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const userPath = 'users';

class UsersService with ListenableServiceMixin {
  final BackendApiService _backendApiService = locator<BackendApiService>();

  final List<UserDTO> _users = [];

  List<UserDTO> get users => _users;

  Future<void> fetchUsers() async {
    try {
      final response = await _backendApiService.get(userPath) as List<dynamic>;
      _users.clear();
      for (var user in response) {
        _users.add(UserDTO.fromJson(user));
      }
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching users: $e');
    }
  }
}
