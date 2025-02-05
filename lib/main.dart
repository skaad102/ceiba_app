import 'package:ceiba_app/ui/common/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:ceiba_app/app/app.bottomsheets.dart';
import 'package:ceiba_app/app/app.dialogs.dart';
import 'package:ceiba_app/app/app.locator.dart';
import 'package:ceiba_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeApp.themeData,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
