import 'package:ceiba_app/app/models/user.dart';
import 'package:ceiba_app/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'user_post_viewmodel.dart';

class UserPostView extends StackedView<UserPostViewModel> {
  final UserDTO user;
  const UserPostView({required this.user, Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UserPostViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kcLightGrey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Posts de ${user.name}',
          style: const TextStyle(color: kcLightGrey),
        ),
        backgroundColor: kcPrimaryColor,
      ),
      backgroundColor: kcLightGrey,
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : viewModel.posts.isEmpty
              ? const Center(
                  child: Text('No hay posts'),
                )
              : ListView.builder(
                  itemCount: viewModel.posts.length,
                  itemBuilder: (context, index) {
                    final post = viewModel.posts[index];
                    return Card(
                      child: ListTile(
                        title: Text(
                          post.title,
                          style: const TextStyle(
                              color: kcPrimaryColor,
                              fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(
                          post.body,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    );
                  },
                ),
    );
  }

  @override
  UserPostViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserPostViewModel(
        user: user,
      );
}
