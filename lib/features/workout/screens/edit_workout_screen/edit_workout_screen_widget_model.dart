import 'package:workout/features/app/di/app_scope.dart';
import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:workout/features/workout/screens/edit_workout_screen/edit_workout_screen.dart';
import 'package:workout/features/workout/screens/edit_workout_screen/edit_workout_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_state/union_state.dart';

EditWorkoutScreenWidgetModel editWorkoutScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final appScope = context.read<IAppScope>();
  final model = EditWorkoutScreenModel(
    appScope.myWorkoutsService,
    appScope.exerciseService,
  );
  final router = appDependencies.router;
  return EditWorkoutScreenWidgetModel(model, router);
}

class EditWorkoutScreenWidgetModel extends WidgetModel<EditWorkoutScreen, EditWorkoutScreenModel> implements IEditWorkoutScreenWidgetModel {
  final AppRouter router;

  EditWorkoutScreenWidgetModel(
    super._model,
    this.router,
  );

  final _myWorkoutState = ValueNotifier<MyWorkoutData>(MyWorkoutData.init());
  final _selectedExerciseListState = ValueNotifier<List<ExerciseData>>([]);
  final _exercisesState = UnionStateNotifier<List<ExerciseData>>([]);
  final TextEditingController _workoutNameController = TextEditingController();

  @override
  void initWidgetModel() {
    _workoutNameController.addListener(() {
      model.workoutName = _workoutNameController.text;
      _myWorkoutState.value = model.workout;
    });

    final args = router.current.args is EditWorkoutRouterArgs ? router.current.args! as EditWorkoutRouterArgs : null;
    if (args != null) {
      _workoutNameController.text = args.myWorkout.workoutName;
      model
        ..exercisesIdList = args.myWorkout.exercisesIdList
        ..workoutId = args.myWorkout.workoutId
        ..selectedExerciseDataList = args.exercises;
      _myWorkoutState.value = model.workout;
      _selectedExerciseListState.value = args.exercises;
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
  void dispose() {
    _workoutNameController.dispose();
    super.dispose();
  }

  @override
  void closeScreen() {
    router.pop();
  }

  @override
  Future<void> editWorkout() async {
    await model.editWorkout();
    final args = router.current.args is EditWorkoutRouterArgs ? router.current.args! as EditWorkoutRouterArgs : null;
    args?.refreshWorkout?.call(model.workout);
    await router.pop();
  }

  @override
  Future<void> deleteWorkout(MyWorkoutData workout) async {
    await model.deleteWorkout(workout);
    final args = router.current.args is EditWorkoutRouterArgs ? router.current.args! as EditWorkoutRouterArgs : null;
    args?.refreshWorkout?.call(model.workout);
    await router.pop();
    await router.pop();
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
  void removeExercise(ExerciseData exercise) {
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

abstract class IEditWorkoutScreenWidgetModel implements IWidgetModel {
  Future<void> editWorkout();

  void tapOnCheckBoxExercise(ExerciseData exercise, bool checkBoxState);

  void closeScreen();

  void removeExercise(ExerciseData exercise);

  UnionStateNotifier<List<ExerciseData>> get exercisesState;

  ValueNotifier<List<ExerciseData>> get selectedExerciseListState;

  ValueNotifier<MyWorkoutData> get myWorkoutState;

  TextEditingController get workoutNameController;

  void saveOrClearSelectedExerciseList(bool isSaved);

  void deleteWorkout(MyWorkoutData workout);
}
