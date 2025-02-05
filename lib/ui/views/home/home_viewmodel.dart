import 'package:ceiba_app/app/app.locator.dart';
import 'package:ceiba_app/app/models/user.dart';
import 'package:ceiba_app/services/users_service.dart';
import 'package:ceiba_app/ui/views/home/home_view.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends FormViewModel with $HomeView {
  final UsersService _usersService = locator<UsersService>();
  final TextEditingController controllerSearch = TextEditingController();

  List<UserDTO> get users => _usersService.users;
}
