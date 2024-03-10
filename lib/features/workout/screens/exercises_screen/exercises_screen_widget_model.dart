import 'package:workout/features/app/di/app_scope.dart';
import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:workout/features/workout/screens/exercises_screen/exercises_screen.dart';
import 'package:workout/features/workout/screens/exercises_screen/exercises_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_state/union_state.dart';

ExercisesScreenWidgetModel exercisesScreenWmFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final model = ExercisesScreenModel(
    appScope.exerciseService,
  );

  return ExercisesScreenWidgetModel(
    model,
    appScope.router,
  );
}

class ExercisesScreenWidgetModel extends WidgetModel<ExercisesScreen, ExercisesScreenModel> implements IExercisesScreenWidgetModel {
  final AppRouter _router;

  ExercisesScreenWidgetModel(
    super._model,
    this._router,
  );

  final _exercisesState = UnionStateNotifier<List<ExerciseData>>([]);
  void Function()? _updateExercises;

  @override
  void initWidgetModel() {
    final args = _router.current.args is ExercisesRouterArgs ? _router.current.args! as ExercisesRouterArgs : null;
    if (args != null) {
      _updateExercises = args.loadAgain;
    }
    getExercises();
    super.initWidgetModel();
  }

  Future<void> getExercises() async {
    _exercisesState.loading();
    try {
      final exercises = await model.getExercises();
      _exercisesState.content(exercises);
    } on Exception catch (e) {
      _exercisesState.failure(e);
    }
  }

  @override
  void loadAgain() {
    getExercises();
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
  void closeScreen() {
    _router.pop();
  }

  @override
  void openExerciseScreen(ExerciseData exercise) {
    _router.push(
      ExerciseRouter(
        exercise: exercise,
        loadAgain: () {
          _updateExercises?.call();
          loadAgain.call();
        },
      ),
    );
  }

  @override
  Future<void> saveLike(int exerciseIndex) async {
    model.setExerciseLike(exerciseIndex);
    await model.editExercise(exerciseIndex);
    _updateExercises?.call();
    _exercisesState.content(model.exerciseList);
    _exercisesState.notifyListeners();
  }

  @override
  UnionStateNotifier<List<ExerciseData>> get exercisesState => _exercisesState;
}

abstract class IExercisesScreenWidgetModel implements IWidgetModel {
  void openAddExerciseScreen();

  void loadAgain();

  void openExerciseScreen(ExerciseData exercise);

  void saveLike(int exerciseIndex);

  UnionStateNotifier<List<ExerciseData>> get exercisesState;

  void closeScreen();
}
