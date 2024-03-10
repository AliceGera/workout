import 'package:auto_route/auto_route.dart';
import 'package:workout/features/app/di/app_scope.dart';
import 'package:workout/features/navigation/domain/entity/app_route_paths.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:workout/features/temp/screens/temp_screen/temp_screen_export.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout/assets/res/svg_icons.dart';

TempScreenWidgetModel initScreenWidgetModelFactory(
  BuildContext context,
) {
  context.read<IAppScope>();
  final model = TempScreenModel();
  return TempScreenWidgetModel(model);
}

class TempScreenWidgetModel extends WidgetModel<TempScreen, ITempScreenModel> implements IDebugWidgetModel {
  final _defaultNavBarItems = [
    BottomNavigationBarItem(
      label: '',
      icon: SvgPicture.asset(SvgIcons.parameters),
      activeIcon: SvgPicture.asset(SvgIcons.parametersActive),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: SvgPicture.asset(SvgIcons.workout),
      activeIcon: SvgPicture.asset(SvgIcons.workoutActive),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: SvgPicture.asset(SvgIcons.schedule),
      activeIcon: SvgPicture.asset(SvgIcons.scheduleActive),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: SvgPicture.asset(SvgIcons.faq),
      activeIcon: SvgPicture.asset(SvgIcons.faqActive),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: SvgPicture.asset(SvgIcons.settings),
      activeIcon: SvgPicture.asset(SvgIcons.settingsActive),
    ),
  ];

  @override
  List<PageRouteInfo> get routes => _routes;

  @override
  List<BottomNavigationBarItem> get navigationBarItems => _navigationBarItems;

  List<PageRouteInfo> get _routes {
    final defaultRoutes = <PageRouteInfo>[ParametersRouter(), MyWorkoutsAndExercisesRouter(), ScheduleRouter(), FaqRouter(), SettingsRouter()];

    return defaultRoutes;
  }

  List<BottomNavigationBarItem> get _navigationBarItems {
    final navBarItems = [..._defaultNavBarItems];

    return navBarItems;
  }

  TempScreenWidgetModel(super._model);

  @override
  String appBarTitle(RouteData topRoute) => _appBarTitle(topRoute);

  String _appBarTitle(RouteData topRoute) {
    switch (topRoute.path) {
      case AppRoutePaths.parametersPath:
        return 'in service';
      case AppRoutePaths.myWorkoutsAndExercisesPath:
        return 'serviceWarehouse';
      case AppRoutePaths.schedulePath:
        return 'service Record';
      case AppRoutePaths.faqPath:
        return 'services';
      case AppRoutePaths.settingsPath:
        return 'settings';
      default:
        return '';
    }
  }
}

abstract class IDebugWidgetModel implements IWidgetModel {
  List<PageRouteInfo<dynamic>> get routes;

  List<BottomNavigationBarItem> get navigationBarItems;

  String appBarTitle(RouteData topRoute);
}
