import 'package:ceiba_app/services/local_data_service.dart';
import 'package:ceiba_app/services/users_service.dart';
import 'package:stacked/stacked.dart';
import 'package:ceiba_app/app/app.locator.dart';
import 'package:ceiba_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final UsersService _usersService = locator<UsersService>();
  final LocalDataService _localDataService = locator<LocalDataService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await _localDataService.init();
    await _usersService.init();
    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _navigationService.replaceWithHomeView();
  }
}
