import 'package:workout/features/app/di/app_scope.dart';
import 'package:workout/features/navigation/domain/entity/app_route_paths.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:workout/features/splash/screen/splash_screen.dart';
import 'package:workout/features/splash/screen/splash_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

SplashScreenWidgetModel splashWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final model = SplashScreenModel();
  final sharedPreferences = appDependencies.sharedPreferences;
  return SplashScreenWidgetModel(
    model,
    appDependencies.router,
    sharedPreferences,
  );
}

class SplashScreenWidgetModel extends WidgetModel<SplashScreen, SplashScreenModel> with TickerProviderWidgetModelMixin implements ISplashWidgetModel {
  final AppRouter _appRouter;
  final SharedPreferences _prefs;

  SplashScreenWidgetModel(
    super._model,
    this._appRouter,
    this._prefs,
  );

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    Future<void>.delayed(const Duration(seconds: 2)).whenComplete(() async {
      await _navigate();
    });
    //_navigate();

  }

  Future<void> _navigate() async {
    final isOnboardingFinish = _prefs.getBool('onboardingFinished') ?? false;
    if (!isOnboardingFinish) {
      await _appRouter.replaceNamed(AppRoutePaths.onboardingPath);
    } else {
      await _appRouter.replaceNamed(AppRoutePaths.tempPath);
    }
  }
}

abstract class ISplashWidgetModel implements IWidgetModel {}
