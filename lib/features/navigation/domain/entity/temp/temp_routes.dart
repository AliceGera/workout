import 'package:auto_route/auto_route.dart';
import 'package:workout/features/navigation/domain/entity/app_route_paths.dart';
import 'package:workout/features/navigation/domain/entity/faq/faq_routes.dart';
import 'package:workout/features/navigation/domain/entity/my_workouts_and_exercises/my_workouts_and_exercises_routes.dart';
import 'package:workout/features/navigation/domain/entity/parameters/parameters_routes.dart';
import 'package:workout/features/navigation/domain/entity/schedule/schedule_routes.dart';
import 'package:workout/features/navigation/domain/entity/settings/settings_routes.dart';
import 'package:workout/features/navigation/service/router.dart';

final tempRoutes = AutoRoute(
  page: TempRouter.page,
  path: AppRoutePaths.tempPath,
  children: [
    parametersRoutes,
    scheduleRoutes,
    myWorkoutsAndExercisesRoutes,
    faqRoutes,
    settingsRoutes,
  ],
);
