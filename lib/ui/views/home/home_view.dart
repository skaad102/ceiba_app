import 'package:ceiba_app/ui/widgets/common/text_text_field/text_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ceiba_app/ui/common/app_colors.dart';
import 'package:ceiba_app/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Prueba de ingreso',
          style: TextStyle(color: kcLightGrey),
        ),
        backgroundColor: kcPrimaryColor,
      ),
      body: SafeArea(
        child: Container(
          color: kcLightGrey,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFieldBase(
                  controller: viewModel.controllerSearch,
                  labelText: 'Buscar Usuario',
                ),
                Column(
                  children: [
                    const Text(
                      'Hello, STACKED!',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    verticalSpaceMedium,
                  ],
                ),
                Container(
                  height: 200,
                  color: kcVeryLightGrey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
