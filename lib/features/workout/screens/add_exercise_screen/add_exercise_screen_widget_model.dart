import 'package:workout/features/app/di/app_scope.dart';
import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_exercise_screen.dart';
import 'add_exercise_screen_model.dart';

AddExerciseScreenWidgetModel addExerciseScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final appScope = context.read<IAppScope>();
  final model = AddExerciseScreenModel(
    appScope.exerciseService,
  );
  final router = appDependencies.router;
  return AddExerciseScreenWidgetModel(model, router);
}

class AddExerciseScreenWidgetModel extends WidgetModel<AddExerciseScreen, AddExerciseScreenModel> implements IAddExerciseScreenWidgetModel {
  final AppRouter _router;

  AddExerciseScreenWidgetModel(
    super._model,
    this._router,
  );

  final _exercisesState = ValueNotifier<ExerciseData>(ExerciseData.init());
  final TextEditingController _exerciseNameController = TextEditingController();
  final TextEditingController _workingWeightController = TextEditingController();
  final TextEditingController _repetitionsNumberController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  void Function()? _updateExercises;

  @override
  void initWidgetModel() {
    final args = _router.current.args is AddExerciseRouterArgs ? _router.current.args! as AddExerciseRouterArgs : null;
    if (args != null) {
      _updateExercises = args.loadAgain;
    }
    _exerciseNameController.addListener(() {
      model.exerciseName = _exerciseNameController.text;
      _exercisesState.value = model.exercise;
    });
    _workingWeightController.addListener(() {
      model.workingWeight = _workingWeightController.text;
      _exercisesState.value = model.exercise;
    });
    _repetitionsNumberController.addListener(() {
      model.repetitionsNumber = _repetitionsNumberController.text;
      _exercisesState.value = model.exercise;
    });
    _commentController.addListener(() {
      model.comment = _commentController.text;
      _exercisesState.value = model.exercise;
    });
    super.initWidgetModel();
  }

  @override
  void dispose() {
    _exerciseNameController.dispose();
    _workingWeightController.dispose();
    _repetitionsNumberController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  void closeScreen() {
    _router.pop();
  }

  @override
  Future<void> addExercise() async {
    _updateExercises?.call();
    await model.addExercise();
    await _router.pop();
  }

  @override
  TextEditingController get exerciseNameController => _exerciseNameController;

  @override
  TextEditingController get workingWeightController => _workingWeightController;

  @override
  TextEditingController get repetitionsNumberController => _repetitionsNumberController;

  @override
  TextEditingController get commentController => _commentController;

  @override
  ValueNotifier<ExerciseData> get exercisesState => _exercisesState;
}

abstract class IAddExerciseScreenWidgetModel implements IWidgetModel {
  Future<void> addExercise();

  void closeScreen();

  ValueNotifier<ExerciseData> get exercisesState;

  TextEditingController get exerciseNameController;

  TextEditingController get workingWeightController;

  TextEditingController get repetitionsNumberController;

  TextEditingController get commentController;
}
