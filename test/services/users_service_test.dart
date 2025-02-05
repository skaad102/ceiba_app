import 'dart:math';

import 'package:ceiba_app/services/users_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ceiba_app/app/app.locator.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  late UsersService usersService;
  late MockBackendApiService mockBackendApiService;
  late MockLocalDataService mockLocalDataService;
  setUp(() {
    mockBackendApiService = getAndRegisterBackendApiService();
    mockLocalDataService = getAndRegisterLocalDataService();
    usersService = UsersService();
  });
  tearDown(() => locator.reset());

  group('UsersServiceTest -', () {
    test('When fetchUsers is called, should call backendApiService.get',
        () async {
      // Arrange
      when(mockBackendApiService.get(userPath)).thenAnswer((_) async => [
            {
              "id": 1,
              "name": "Leanne Graham",
              "username": "Bret",
              "email": "Sincere@april.biz",
              "address": {
                "street": "Kulas Light",
                "suite": "Apt. 556",
                "city": "Gwenborough",
                "zipcode": "92998-3874",
                "geo": {"lat": "-37.3159", "lng": "81.1496"}
              },
              "phone": "1-770-736-8031 x56442",
              "website": "hildegard.org",
              "company": {
                "name": "Romaguera-Crona",
                "catchPhrase": "Multi-layered client-server neural-net",
                "bs": "harness real-time e-markets"
              }
            },
          ]);
      // Act
      await usersService.fetchUsers();
      // Assert
      expect(verify(mockBackendApiService.get(userPath)).callCount, 1);
    });
  });
}
