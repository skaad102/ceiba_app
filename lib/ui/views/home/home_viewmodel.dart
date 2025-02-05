import 'package:ceiba_app/app/app.locator.dart';
import 'package:ceiba_app/app/models/user.dart';
import 'package:ceiba_app/services/users_service.dart';
import 'package:ceiba_app/ui/views/home/home_view.form.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends FormViewModel with $HomeView {
  final UsersService _usersService = locator<UsersService>();

  List<UserDTO> get users => _usersService.users;

  List<UserDTO> usersFiltered = [];

  bool serarchUsers = false;

  void onSearchTap(String value) {
    if (value.isEmpty) {
      serarchUsers = false;
      usersFiltered = users;
      notifyListeners();
      return;
    }
    serarchUsers = true;
    usersFiltered = users
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
