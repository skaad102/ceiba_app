import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'card_user_model.dart';

class CardUser extends StackedView<CardUserModel> {
  const CardUser({super.key});

  @override
  Widget builder(
    BuildContext context,
    CardUserModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  CardUserModel viewModelBuilder(
    BuildContext context,
  ) =>
      CardUserModel();
}
