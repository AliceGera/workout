import 'package:auto_route/auto_route.dart';
import 'package:workout/features/navigation/domain/entity/app_route_paths.dart';
import 'package:workout/features/navigation/service/router.dart';

final editExerciseRoutes = AutoRoute(
  page:EditExerciseRouter.page,
  path: AppRoutePaths.editExercisePath,
);
