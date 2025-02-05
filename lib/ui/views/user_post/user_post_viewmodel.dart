import 'package:ceiba_app/app/models/post.dart';
import 'package:ceiba_app/app/models/user.dart';
import 'package:ceiba_app/services/posts_service.dart';
import 'package:stacked/stacked.dart';

class UserPostViewModel extends FutureViewModel {
  final UserDTO user;
  UserPostViewModel({required this.user});
  final PostsService _postsService = PostsService();

  List<PostDTO> posts = [];
  @override
  Future<void> futureToRun() async {
    setBusy(true);
    posts = await _postsService.fetchPostsByUserId(user.id.toString());
    setBusy(false);
  }
}
