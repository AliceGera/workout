import 'package:workout/assets/constants/app_constants.dart';
import 'package:workout/features/app/di/app_scope.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:workout/features/onboarding_screen/onboarding_screen.dart';
import 'package:workout/features/onboarding_screen/onboarding_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

OnboardingScreenWidgetModel onboardingScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final router = appDependencies.router;
  final model = OnboardingScreenModel();
  final sharedPreferences = appDependencies.sharedPreferences;
  return OnboardingScreenWidgetModel(
    model,
    sharedPreferences,
    router,
  );
}

class OnboardingScreenWidgetModel extends WidgetModel<OnboardingScreen, OnboardingScreenModel> implements IOnboardingScreenWidgetModel {
  final SharedPreferences sharedPreferences;
  final AppRouter router;

  OnboardingScreenWidgetModel(
    super._model,
    this.sharedPreferences,
    this.router,
  );

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  void openTemp() {
    router.replace(TempRouter());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Future<void> finishOnboarding() async {
    await sharedPreferences.setBool('onboardingFinished', true);
  }

  @override
  Future<void> userAgreementOnTap() async {
    if (await canLaunchUrl(Uri.parse(AppConstants.userAgreement))) {
      await launchUrl(Uri.parse(AppConstants.userAgreement));
    } else {
      throw 'Could not launch ${AppConstants.userAgreement}';
    }
  }

  @override
  Future<void> privacyPolicyOnTap() async {
    if (await canLaunchUrl(Uri.parse(AppConstants.urlPrivacyPolicy))) {
      await launchUrl(Uri.parse(AppConstants.urlPrivacyPolicy));
    } else {
      throw 'Could not launch ${AppConstants.urlPrivacyPolicy}';
    }
  }
}

abstract class IOnboardingScreenWidgetModel implements IWidgetModel {
  Future<void> finishOnboarding();

  void openTemp();

  void userAgreementOnTap();

  void privacyPolicyOnTap();
}
