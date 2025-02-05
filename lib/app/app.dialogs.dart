// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/info/info_dialog.dart';

enum DialogType {
  info,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.info: (context, request, completer) =>
        InfoDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
