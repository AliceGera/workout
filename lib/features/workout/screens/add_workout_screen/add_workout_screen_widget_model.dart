import 'package:workout/features/app/di/app_scope.dart';
import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_state/union_state.dart';
import 'add_workout_screen.dart';
import 'add_workout_screen_model.dart';

AddWorkoutScreenWidgetModel addWorkoutScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final appScope = context.read<IAppScope>();
  final model = AddWorkoutScreenModel(
    appScope.myWorkoutsService,
    appScope.exerciseService,
  );
  final router = appDependencies.router;
  return AddWorkoutScreenWidgetModel(model, router);
}

class AddWorkoutScreenWidgetModel extends WidgetModel<AddWorkoutScreen, AddWorkoutScreenModel> implements IAddWorkoutScreenWidgetModel {
  final AppRouter _router;

  AddWorkoutScreenWidgetModel(
    super._model,
    this._router,
  );
  void Function()? _updateWorkout;
  final _myWorkoutState = ValueNotifier<MyWorkoutData>(MyWorkoutData.init());
  final _selectedExerciseListState = ValueNotifier<List<ExerciseData>>([]);
  final _exercisesState = UnionStateNotifier<List<ExerciseData>>([]);
  final TextEditingController _workoutNameController = TextEditingController();

  @override
  void initWidgetModel() {
    final args = _router.current.args is AddWorkoutRouterArgs ? _router.current.args! as AddWorkoutRouterArgs : null;
    if (args != null) {
      _updateWorkout = args.loadAgain;
    }
    _workoutNameController.addListener(() {
      model.workoutName = _workoutNameController.text;
      _myWorkoutState.value=model.workout;
    });
    getWorkouts();
    super.initWidgetModel();
  }

  Future<void> getWorkouts() async {
    _exercisesState.loading();
    try {
      final exercises = await model.getExercises();
      _exercisesState.content(exercises);
    } on Exception catch (e) {
      _exercisesState.failure(e);
    }
  }

  @override
  void dispose() {
    _workoutNameController.dispose();
    super.dispose();
  }

  @override
  void closeScreen() {
    _router.pop();
  }

  @override
  Future<void> addWorkout() async {
    await model.addWorkout();
    _updateWorkout?.call();
    await _router.pop();
  }

  @override
  void tapOnCheckBoxExercise(ExerciseData exercise, bool checkBoxState) {
    if (checkBoxState) {
      model.selectedExerciseDataList.add(exercise);
    } else {
      model.selectedExerciseDataList.remove(exercise);
    }
  }
  @override
  void removeExercise(ExerciseData exercise){
    model.selectedExerciseDataList.remove(exercise);
    _selectedExerciseListState.value = model.selectedExerciseDataList;
    _selectedExerciseListState.notifyListeners();
  }
  @override
  void saveOrClearSelectedExerciseList(bool isSaved) {
    if (!isSaved) {
      model.selectedExerciseDataList.clear();
    }
    _selectedExerciseListState.value = model.selectedExerciseDataList;
    _selectedExerciseListState.notifyListeners();
  }

  @override
  TextEditingController get workoutNameController => _workoutNameController;

  @override
  UnionStateNotifier<List<ExerciseData>> get exercisesState => _exercisesState;

  @override
  ValueNotifier<MyWorkoutData> get myWorkoutState => _myWorkoutState;

  @override
  ValueNotifier<List<ExerciseData>> get selectedExerciseListState => _selectedExerciseListState;
}

abstract class IAddWorkoutScreenWidgetModel implements IWidgetModel {
  Future<void> addWorkout();

  void tapOnCheckBoxExercise(ExerciseData exercise, bool checkBoxState);

  void closeScreen();

  void removeExercise(ExerciseData exercise);

  UnionStateNotifier<List<ExerciseData>> get exercisesState;

  ValueNotifier<List<ExerciseData>> get selectedExerciseListState;

  ValueNotifier<MyWorkoutData> get myWorkoutState;

  TextEditingController get workoutNameController;

  void saveOrClearSelectedExerciseList(bool isSaved);
}
