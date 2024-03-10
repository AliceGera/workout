import 'package:auto_route/auto_route.dart';
import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:workout/features/faq/screens/faq_screen/faq_screen.dart';
import 'package:workout/features/faq/screens/faq_screen/faq_widget_model.dart';
import 'package:workout/features/navigation/domain/entity/add_exercise/add_exercise.dart';
import 'package:workout/features/navigation/domain/entity/add_workout/add_workout.dart';
import 'package:workout/features/navigation/domain/entity/edit_workout/edit_workout.dart';
import 'package:workout/features/navigation/domain/entity/exercise/exercise_routes.dart';
import 'package:workout/features/navigation/domain/entity/exercises/exercises_routes.dart';
import 'package:workout/features/navigation/domain/entity/measurement_log/measurement_log.dart';
import 'package:workout/features/navigation/domain/entity/my_workouts/my_workouts.dart';
import 'package:workout/features/navigation/domain/entity/workout_info/workout_info.dart';
import 'package:workout/features/navigation/domain/entity/start_measurements/start_measurements.dart';
import 'package:workout/features/navigation/domain/entity/add_record/add_record.dart';
import 'package:workout/features/navigation/domain/entity/edit_exercise/edit_exercise.dart';

import 'package:workout/features/navigation/domain/entity/onboarding/onboarding_routes.dart';
import 'package:workout/features/navigation/domain/entity/splash/splash_routes.dart';
import 'package:workout/features/navigation/domain/entity/temp/temp_routes.dart';
import 'package:workout/features/onboarding_screen/onboarding_screen.dart';
import 'package:workout/features/onboarding_screen/onboarding_screen_widget_model.dart';
import 'package:workout/features/schedule/screens/add_record_screen/add_record_screen.dart';
import 'package:workout/features/schedule/screens/add_record_screen/add_record_screen_widget_model.dart';
import 'package:workout/features/workout/screens/edit_exercise_screen/edit_exercise_screen_widget_model.dart';
import 'package:workout/features/workout/screens/my_workouts_and_exercises_screen/my_workouts_and_exercises_screen_export.dart';
import 'package:workout/features/workout/screens/add_exercise_screen/add_exercise_screen_export.dart';
import 'package:workout/features/workout/screens/my_workouts_screen/my_workouts_screen_export.dart';
import 'package:workout/features/workout/screens/edit_exercise_screen/edit_exercise_screen_export.dart';
import 'package:workout/features/schedule/screens/schedule_screen/schedule_screen_export.dart';
import 'package:workout/features/workout/screens/exercises_screen/exercises_screen_export.dart';
import 'package:workout/features/workout/screens/exercise_screen/exercise_screen_export.dart';
import 'package:workout/features/workout/screens/edit_workout_screen/edit_workout_screen_export.dart';
import 'package:workout/features/splash/screen/splash_screen.dart';
import 'package:workout/features/splash/screen/splash_screen_widget_model.dart';
import 'package:workout/features/temp/screens/temp_screen/temp_screen_export.dart';
import 'package:workout/features/settings/screens/settings_screen/settings_screen_export.dart';
import 'package:workout/features/parameters/screens/start_measurements_screen/start_measurements_screen_export.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:workout/features/parameters/screens/measurement_log_screen/measurement_log_screen_export.dart';
import 'package:workout/features/parameters/screens/parameters_screen/parameters_screen.dart';
import 'package:workout/features/parameters/screens/parameters_screen/parameters_screen_widget_model.dart';
import 'package:workout/features/workout/screens/add_workout_screen/add_workout_screen.dart';
import 'package:workout/features/workout/screens/add_workout_screen/add_workout_screen_widget_model.dart';
import 'package:workout/features/workout/screens/workout_info_screen/workout_info_screen.dart';
import 'package:workout/features/workout/screens/workout_info_screen/workout_info_screen_widget_model.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'ScreenWidget|Screen,Route',
)
class AppRouter extends _$AppRouter {
  static final AppRouter _router = AppRouter._();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        tempRoutes,
        startMeasurementsRoutes,
        addExerciseRoutes,
        editExerciseRoutes,
        addRecordRoutes,
        onboardingRoutes,
        splashRoutes,
        exercisesRoutes,
        exerciseRoutes,
        myWorkoutsRoutes,
        addWorkoutRoutes,
        editWorkoutRoutes,
        workoutInfoRoutes,
        measurementLogRoutes,
      ];

  AppRouter._();

  factory AppRouter.instance() => _router;
}
