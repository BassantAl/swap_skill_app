import 'package:swap_skill/core/services/local_storage_services.dart';
import 'package:swap_skill/features/onboarding/data/repos/onboarding_repo.dart';

class OnboardingRepoImpl implements OnboardingRepo {
  OnboardingRepoImpl({required this.localStorageServices});
  final LocalStorageServices localStorageServices;
  @override
  Future<void> markOnboardingAsSeen() async {
    await localStorageServices.saveData(key: 'hasSeenOnboarding', value: true);
  }
}
