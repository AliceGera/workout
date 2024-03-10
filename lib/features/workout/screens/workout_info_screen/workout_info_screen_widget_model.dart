import 'package:workout/features/app/di/app_scope.dart';
import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:workout/features/workout/screens/workout_info_screen/workout_info_screen.dart';
import 'package:workout/features/workout/screens/workout_info_screen/workout_info_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

WorkoutInfoScreenWidgetModel workoutInfoScreenWmFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final model = WorkoutInfoScreenModel(
    appScope.exerciseService,
  );

  return WorkoutInfoScreenWidgetModel(
    model,
    appScope.router,
  );
}

class WorkoutInfoScreenWidgetModel extends WidgetModel<WorkoutInfoScreen, WorkoutInfoScreenModel> implements IWorkoutInfoScreenWidgetModel {
  final AppRouter _appRouter;

  WorkoutInfoScreenWidgetModel(
    super._model,
    this._appRouter,
  );

  final _exerciseState = ValueNotifier<List<ExerciseData>>([]);
  final _workoutNameState = ValueNotifier<String>('');

  void Function()? _updateWorkout;

  @override
  void initWidgetModel() async {
    final args = _appRouter.current.args is WorkoutInfoRouterArgs ? _appRouter.current.args! as WorkoutInfoRouterArgs : null;
    if (args != null) {
      final selectedExercises = await model.getSelectedExercises(args!.myWorkout.exercisesIdList);
      _exerciseState.value = selectedExercises;
      _updateWorkout = args.loadAgain;
      _workoutNameState.value=args.myWorkout.workoutName;
    }

    super.initWidgetModel();
  }

  @override
  Future<void> refreshWorkout(MyWorkoutData myWorkout) async {
    model
      ..workoutName = myWorkout.workoutName
      ..exercisesIdList = myWorkout.exercisesIdList
      ..workoutId = myWorkout.workoutId;
    final selectedExercises = await model.getSelectedExercises(model.workout.exercisesIdList);
    _exerciseState.value = selectedExercises;
    _workoutNameState.value= myWorkout.workoutName;
    _updateWorkout?.call();
  }

  @override
  void openEditWorkoutScreen(MyWorkoutData myWorkout, List<ExerciseData> exercises) {
    _appRouter.push(
      EditWorkoutRouter(
        myWorkout: myWorkout,
        exercises: exercises,
        refreshWorkout: refreshWorkout,
      ),
    );
  }

  @override
  void closeScreen() {
    _appRouter.pop();
  }

  @override
  ValueNotifier<List<ExerciseData>> get exerciseState => _exerciseState;

  @override
  ValueNotifier<String> get workoutNameState => _workoutNameState;
}

abstract class IWorkoutInfoScreenWidgetModel implements IWidgetModel {
  void openEditWorkoutScreen(MyWorkoutData myWorkout, List<ExerciseData> exercises);

  ValueNotifier<List<ExerciseData>> get exerciseState;

  ValueNotifier<String> get workoutNameState;

  void closeScreen();
}
