import 'package:workout/assets/constants/app_constants.dart';
import 'package:workout/features/app/di/app_scope.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:workout/features/settings/screens/settings_screen/settings_screen.dart';
import 'package:workout/features/settings/screens/settings_screen/settings_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

SettingsScreenWidgetModel settingsScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final appScope = context.read<IAppScope>();
  final model = SettingsScreenModel(
    appScope.exerciseService,
    appScope.parametersService,
    appScope.myWorkoutsService,
    appScope.recordsService,
  );
  final router = appDependencies.router;
  return SettingsScreenWidgetModel(
    model,
    router,
  );
}

class SettingsScreenWidgetModel extends WidgetModel<SettingsScreen, SettingsScreenModel> implements ISettingsScreenWidgetModel {
  final AppRouter router;

  SettingsScreenWidgetModel(
    super._model,
    this.router,
  );

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void closeScreen() {
    router.pop();
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

  @override
  Future<void> onTapAppReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  @override
  Future<void> cleanDataBase() async {
    await model.deleteExercises();
    await model.deleteMyWorkouts();
    await model.deleteParameters();
    await model.deleteRecords();
    context.read<IAppScope>().parametersRebuilder.call();
    context.read<IAppScope>().trainingScheduleRebuilder.call();
    context.read<IAppScope>().myWorkoutsAndExercisesRebuilder.call();
  }
}

abstract class ISettingsScreenWidgetModel implements IWidgetModel {
  void closeScreen();

  void userAgreementOnTap();

  void privacyPolicyOnTap();

  void onTapAppReview();

  void cleanDataBase();
}
