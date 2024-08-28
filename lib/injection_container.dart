import 'package:fur/core/pet/presentation/pets_injection.dart';
import 'package:fur/shared/platform/network_info.dart';
import 'package:fur/src/authentication/authentication_injection.dart' as authentication;
import 'package:fur/src/onboarding/onboarding_injection.dart' as onboarding;
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // Features
  // initHome();
  initPets();
  onboarding.init();
  authentication.init();
}
