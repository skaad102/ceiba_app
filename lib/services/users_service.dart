import 'package:ceiba_app/app/app.locator.dart';
import 'package:ceiba_app/app/models/address.dart';
import 'package:ceiba_app/app/models/company.dart';
import 'package:ceiba_app/app/models/geo.dart';
import 'package:ceiba_app/app/models/user.dart';
import 'package:ceiba_app/services/backend_api_service.dart';
import 'package:ceiba_app/services/local_data_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const userPath = 'users';

class UsersService with ListenableServiceMixin {
  final BackendApiService _backendApiService = locator<BackendApiService>();
  final LocalDataService _localDataService = locator<LocalDataService>();

  final List<UserDTO> _users = [];

  List<UserDTO> get users => _users;

  bool _initializedAdapter = false;

  Future<void> fetchUsers() async {
    try {
      final response = await _backendApiService.get(userPath) as List<dynamic>;
      _users.clear();
      for (var user in response) {
        final userDTO = UserDTO.fromJson(user);
        _users.add(userDTO);
        await saveUsersLocal(userDTO.id.toString(), userDTO);
      }
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching users: $e');
    }
  }

  Future<void> init() async {
    await initAdapter();
    final localUser = await _localDataService.getAllFromBox<UserDTO>(userPath);
    if (localUser.isNotEmpty) {
      _users.clear();
      _users.addAll(localUser);
    } else {
      await fetchUsers();
    }
  }

  Future<void> initAdapter() async {
    if (_initializedAdapter) return;
    _localDataService.registerAdapterBox(UserDTOAdapter());
    _localDataService.registerAdapterBox(AddressDTOAdapter());
    _localDataService.registerAdapterBox(CompanyDTOAdapter());
    _localDataService.registerAdapterBox(GeoDTOAdapter());
    _initializedAdapter = true;
  }

  Future<void> saveUsersLocal(String id, UserDTO user) async {
    await _localDataService.saveToBox<UserDTO>(userPath, id, user);
  }
}
