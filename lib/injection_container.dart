import 'package:fur/core/animals/animal_injection.dart';
import 'package:fur/shared/platform/network_info.dart';
import 'package:fur/src/authentication/authentication_injection.dart';
import 'package:fur/src/onboarding/onboarding_injection.dart';
import 'package:fur/src/profile/profile_injection.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // Features
  initAuthentication();
  initProfile();
  initOnboarding();
  initAnimals();
}
