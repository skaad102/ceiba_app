import 'package:ceiba_app/app/app.locator.dart';
import 'package:ceiba_app/app/models/post.dart';
import 'package:ceiba_app/services/backend_api_service.dart';
import 'package:flutter/material.dart';

const postPath = 'posts';

class PostsService {
  final BackendApiService _backendApiService = locator<BackendApiService>();

  Future<List<PostDTO>> fetchPostsByUserId(String userId) async {
    try {
      final response = await _backendApiService.get(postPath,
          queryParameters: {'userId': userId}) as List<dynamic>;
      final List<PostDTO> posts = [];
      for (var post in response) {
        final postDTO = PostDTO.fromJson(post);
        posts.add(postDTO);
      }
      return posts;
    } catch (e) {
      debugPrintStack(label: 'Error fetching posts: $e');
      return [];
    }
  }
}
