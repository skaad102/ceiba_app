import 'package:ceiba_app/ui/widgets/common/card_user/card_user.dart';
import 'package:ceiba_app/ui/widgets/common/text_text_field/text_text_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ceiba_app/ui/common/app_colors.dart';
import 'package:ceiba_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked_annotations.dart';

import 'home_view.form.dart';
import 'home_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'searchUser'),
])
class HomeView extends StackedView<HomeViewModel> with $HomeView {
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFieldBase(
                controller: viewModel.controllerSearch,
                labelText: 'Buscar Usuario',
              ),
              verticalSpaceMedium,
              Expanded(
                child: SizedBox(
                  height: 500,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(bottom: 24),
                    shrinkWrap: true,
                    itemCount: viewModel.users.length,
                    itemBuilder: (context, index) {
                      return CardUser(user: viewModel.users[index]);
                    },
                    separatorBuilder: (_, __) => verticalSpaceMedium,
                  ),
                ),
              ),
            ],
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
