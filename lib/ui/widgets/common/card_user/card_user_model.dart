import 'package:ceiba_app/app/app.router.dart';
import 'package:ceiba_app/app/models/user.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CardUserModel extends BaseViewModel {
  final NavigationService _navigationService = NavigationService();

  void navigateToUserDetail(UserDTO user) {
    _navigationService.navigateToUserPostView(user: user);
  }
}
