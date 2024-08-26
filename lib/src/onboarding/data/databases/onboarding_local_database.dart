import 'package:fur/src/onboarding/domain/entities/onboarding_status.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnboardingLocalDatabase {
  /// Retrieves the user's onboarding status.
  Future<OnboardingStatus> getOnboardingStatus();

  /// Sets the user's onboarding status.
  Future<void> setOnboardingStatus(OnboardingStatus status);
}

class OnboardingLocalDatabaseImpl implements OnboardingLocalDatabase {
  final _onboardingStatusKey = 'onboarding_status';

  @override
  Future<OnboardingStatus> getOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final status = prefs.getString(_onboardingStatusKey);

    return switch (status) {
      'notStarted' => OnboardingStatus.notStarted,
      // 'inProgress' => OnboardingStatus.inProgress,
      'completed' => OnboardingStatus.completed,
      _ => OnboardingStatus.notStarted,
    };
  }

  @override
  Future<void> setOnboardingStatus(OnboardingStatus status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_onboardingStatusKey, status.name.toString());
  }
}
