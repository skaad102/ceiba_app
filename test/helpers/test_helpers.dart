import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ceiba_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ceiba_app/services/backend_api_service.dart';
import 'package:ceiba_app/services/users_service.dart';
import 'package:ceiba_app/services/local_data_service.dart';
import 'package:ceiba_app/services/posts_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BackendApiService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<UsersService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LocalDataService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<PostsService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterBackendApiService();
  getAndRegisterUsersService();
  getAndRegisterLocalDataService();
  getAndRegisterPostsService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockBackendApiService getAndRegisterBackendApiService() {
  _removeRegistrationIfExists<BackendApiService>();
  final service = MockBackendApiService();
  locator.registerSingleton<BackendApiService>(service);
  return service;
}

MockUsersService getAndRegisterUsersService() {
  _removeRegistrationIfExists<UsersService>();
  final service = MockUsersService();
  locator.registerSingleton<UsersService>(service);
  return service;
}

MockLocalDataService getAndRegisterLocalDataService() {
  _removeRegistrationIfExists<LocalDataService>();
  final service = MockLocalDataService();
  locator.registerSingleton<LocalDataService>(service);
  return service;
}

MockPostsService getAndRegisterPostsService() {
  _removeRegistrationIfExists<PostsService>();
  final service = MockPostsService();
  locator.registerSingleton<PostsService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
