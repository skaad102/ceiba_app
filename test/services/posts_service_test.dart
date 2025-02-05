import 'package:ceiba_app/services/posts_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ceiba_app/app/app.locator.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  late PostsService postsService;
  late MockBackendApiService mockBackendApiService;

  setUp(() {
    mockBackendApiService = getAndRegisterBackendApiService();
    postsService = PostsService();
  });
  group('PostsServiceTest -', () {
    tearDown(() => locator.reset());

    test('When fetchPosts is called, should call backendApiService.get',
        () async {
      // Arrange
      when(mockBackendApiService
              .get(postPath, queryParameters: {'userId': '1'}))
          .thenAnswer((_) async => [
                {
                  "userId": 1,
                  "id": 1,
                  "title":
                      "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
                  "body":
                      "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestias ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
                },
              ]);
      // Act
      await postsService.fetchPostsByUserId('1');
      // Assert
      verify(mockBackendApiService
          .get(postPath, queryParameters: {'userId': '1'})).called(1);
    });
  });
}
