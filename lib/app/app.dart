import 'package:ceiba_app/ui/views/home/home_view.dart';
import 'package:ceiba_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ceiba_app/ui/dialogs/info/info_dialog.dart';
import 'package:ceiba_app/ui/bottom_sheets/info/info_sheet.dart';
import 'package:ceiba_app/services/backend_api_service.dart';
import 'package:ceiba_app/services/users_service.dart';
import 'package:ceiba_app/services/local_data_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BackendApiService),
    LazySingleton(classType: UsersService),
    LazySingleton(classType: LocalDataService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: InfoSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoDialog),
// @stacked-dialog
  ],
)
class App {}
