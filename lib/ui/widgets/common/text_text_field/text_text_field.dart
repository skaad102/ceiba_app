import 'package:ceiba_app/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'text_text_field_model.dart';

class TextFieldBase extends StackedView<TextTextFieldModel> {
  final TextEditingController controller;
  final String labelText;
  const TextFieldBase(
      {required this.controller, required this.labelText, super.key});

  @override
  Widget builder(
    BuildContext context,
    TextTextFieldModel viewModel,
    Widget? child,
  ) {
    return SizedBox(
      height: 48,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: kcPrimaryColor,
              style: BorderStyle.solid,
            ),
          ),
          labelText: labelText,
        ),
      ),
    );
  }

  @override
  TextTextFieldModel viewModelBuilder(
    BuildContext context,
  ) =>
      TextTextFieldModel();
}
