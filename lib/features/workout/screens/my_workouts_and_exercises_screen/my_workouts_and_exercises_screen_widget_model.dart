import 'package:workout/features/app/di/app_scope.dart';
import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:workout/features/common/domain/data/my_workouts_and_exercises/my_workouts_and_exercises_data.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:workout/features/workout/screens/my_workouts_and_exercises_screen/my_workouts_and_exercises_screen.dart';
import 'package:workout/features/workout/screens/my_workouts_and_exercises_screen/my_workouts_and_exercises_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_state/union_state.dart';

MyWorkoutsAndExercisesScreenWidgetModel myWorkoutsAndExercisesScreenWmFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final model = MyWorkoutsAndExercisesScreenModel(
    appScope.myWorkoutsAndExercisesService,
  );

  return MyWorkoutsAndExercisesScreenWidgetModel(
    model,
    appScope.router,
    appScope as AppScope,
  );
}

class MyWorkoutsAndExercisesScreenWidgetModel extends WidgetModel<MyWorkoutsAndExercisesScreen, MyWorkoutsAndExercisesScreenModel>
    implements IMyWorkoutsAndExercisesScreenWidgetModel {
  final AppRouter _router;
  final AppScope _appScope;

  MyWorkoutsAndExercisesScreenWidgetModel(super._model, this._router, this._appScope);

  final _exercisesWithObjectsState = UnionStateNotifier<MyWorkoutsAndExercisesData>(MyWorkoutsAndExercisesData.init());

  @override
  void initWidgetModel() {
    getExercisesWithObjects();
    _appScope.myWorkoutsAndExercisesRebuilder = loadAgain;
    super.initWidgetModel();
  }

  Future<void> getExercisesWithObjects() async {
    _exercisesWithObjectsState.loading();
    try {
      final workoutsAndExercises = await model.getMyWorkoutsAndExercises();
      _exercisesWithObjectsState.content(workoutsAndExercises);
    } on Exception catch (e) {
      _exercisesWithObjectsState.failure(e);
    }
  }

  @override
  void loadAgain() {
    getExercisesWithObjects();
  }

  @override
  void openMyWorkoutsScreen() {
    _router.push(
      MyWorkoutsRouter(
        loadAgain: () {
          context.read<IAppScope>().trainingScheduleRebuilder.call();
          loadAgain.call();
        },
      ),
    );
  }

  @override
  void openExercisesScreen() {
    _router.push(
      ExercisesRouter(
        loadAgain: loadAgain,
      ),
    );
  }

  @override
  void openAddExerciseScreen() {
    _router.push(
      AddExerciseRouter(
        loadAgain: loadAgain,
      ),
    );
  }

  @override
  void openAddWorkoutScreen() {
    _router.push(
      AddWorkoutRouter(
        loadAgain: loadAgain,
      ),
    );
  }

  @override
  void openWorkoutInfoScreen(MyWorkoutData myWorkout) {
    _router.push(
      WorkoutInfoRouter(
        loadAgain: () {
          context.read<IAppScope>().trainingScheduleRebuilder.call();
          loadAgain.call();
        },
        myWorkout: myWorkout,
      ),
    );
  }

  @override
  void openExerciseScreen(ExerciseData exercise) {
    _router.push(
      ExerciseRouter(
        exercise: exercise,
        loadAgain: () {
          loadAgain.call();
        },
      ),
    );
  }

  @override
  UnionStateNotifier<MyWorkoutsAndExercisesData> get exercisesWithObjectsState => _exercisesWithObjectsState;
}

abstract class IMyWorkoutsAndExercisesScreenWidgetModel implements IWidgetModel {
  void openAddExerciseScreen();

  void openExercisesScreen();

  void openMyWorkoutsScreen();

  void openAddWorkoutScreen();

  void loadAgain();

  void openWorkoutInfoScreen(MyWorkoutData myWorkout);

  void openExerciseScreen(ExerciseData exercise);

  UnionStateNotifier<MyWorkoutsAndExercisesData> get exercisesWithObjectsState;
}
