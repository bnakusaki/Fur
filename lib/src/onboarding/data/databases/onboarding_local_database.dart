import 'package:shared_preferences/shared_preferences.dart';

abstract class OnboardingLocalDatabase {
  Future<bool> setOnboardingCompleted();
  Future<bool> isOnboardingCompleted();
}

class OnboardingLocalDatabaseImpl implements OnboardingLocalDatabase {
  @override
  Future<bool> setOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setBool('isOnboardingCompleted', true);
  }

  @override
  Future<bool> isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isOnboardingCompleted') ?? false;
  }
}
