import 'package:workout/features/app/di/app_scope.dart';
import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:workout/features/workout/screens/exercise_screen/exercise_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'exercise_screen_model.dart';

ExerciseScreenWidgetModel exerciseScreenWmFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final model = ExerciseScreenModel(
      );

  return ExerciseScreenWidgetModel(
    model,
    appScope.router,
  );
}

class ExerciseScreenWidgetModel extends WidgetModel<ExerciseScreen, ExerciseScreenModel> implements IExerciseScreenWidgetModel {
  final AppRouter _appRouter;

  ExerciseScreenWidgetModel(
    super._model,
    this._appRouter,
  );

  final _exerciseState = ValueNotifier<ExerciseData>(ExerciseData.init());
  void Function()? _updateExercise;

  @override
  void initWidgetModel() {
    final args = _appRouter.current.args is ExerciseRouterArgs ? _appRouter.current.args! as ExerciseRouterArgs : null;

    if (args != null) {
      model
        ..exerciseId = args.exercise.exerciseId
        ..exerciseName = args.exercise.exerciseName
        ..workingWeight = args.exercise.workingWeight
        ..repetitionsNumber = args.exercise.repetitionsNumber
        ..comment = args.exercise.comment;
      _exerciseState.value = model.exercise;
      _updateExercise = args.loadAgain;
    }
    super.initWidgetModel();
  }

  @override
  Future<void> refreshExercise(ExerciseData exercise) async {
    model
      ..exerciseName = exercise.exerciseName
      ..exerciseId = exercise.exerciseId
      ..comment = exercise.comment
      ..workingWeight = exercise.workingWeight
      ..repetitionsNumber = exercise.repetitionsNumber;
    _exerciseState.value = model.exercise;
    _updateExercise?.call();
  }

  @override
  void openEditExerciseScreen(ExerciseData exercise) {
    _appRouter.push(
      EditExerciseRouter(
        exercise: exercise,
        refreshExercise: refreshExercise,
      ),
    );
  }

  @override
  void closeScreen() {
    _appRouter.pop();
  }

  @override
  ValueNotifier<ExerciseData> get exerciseState => _exerciseState;
}

abstract class IExerciseScreenWidgetModel implements IWidgetModel {
  void closeScreen();

  void openEditExerciseScreen(ExerciseData exercise);

  ValueNotifier<ExerciseData> get exerciseState;
}
