import 'package:ceiba_app/app/models/user.dart';
import 'package:ceiba_app/ui/common/app_colors.dart';
import 'package:ceiba_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'card_user_model.dart';

class CardUser extends StackedView<CardUserModel> {
  final UserDTO user;
  const CardUser({required this.user, super.key});

  @override
  Widget builder(
    BuildContext context,
    CardUserModel viewModel,
    Widget? child,
  ) {
    return Container(
      height: 138,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: kcVeryLightGrey,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kcPrimaryColor),
              ),
              Row(
                children: [
                  const Icon(Icons.phone, color: kcPrimaryColor),
                  horizontalSpaceTiny,
                  Text(user.phone),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.email, color: kcPrimaryColor),
                  horizontalSpaceTiny,
                  Text(user.email),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {}, child: const Text("VER PUBLICACIONES")),
          )
        ],
      ),
    );
  }

  @override
  CardUserModel viewModelBuilder(
    BuildContext context,
  ) =>
      CardUserModel();
}
