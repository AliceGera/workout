import 'package:workout/features/app/di/app_scope.dart';
import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:workout/features/workout/screens/edit_exercise_screen/edit_exercise_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'edit_exercise_screen.dart';

EditExerciseScreenWidgetModel editExerciseScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final appScope = context.read<IAppScope>();
  final model = EditExerciseScreenModel(
    appScope.exerciseService,
  );
  final router = appDependencies.router;
  return EditExerciseScreenWidgetModel(model, router);
}

class EditExerciseScreenWidgetModel extends WidgetModel<EditExerciseScreen, EditExerciseScreenModel> implements IEditExerciseScreenWidgetModel {
  final AppRouter router;

  EditExerciseScreenWidgetModel(
    super._model,
    this.router,
  );

  final _exercisesState = ValueNotifier<ExerciseData>(ExerciseData.init());

  final TextEditingController _exerciseNameController = TextEditingController();
  final TextEditingController _workingWeightController = TextEditingController();
  final TextEditingController _repetitionsNumberController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  @override
  void initWidgetModel() {
    final args = router.current.args is EditExerciseRouterArgs ? router.current.args! as EditExerciseRouterArgs : null;

    _exerciseNameController.addListener(() {
      model.exerciseName = _exerciseNameController.text;
      _exercisesState.value = model.exercise;
      _exercisesState.notifyListeners();
    });
    _workingWeightController.addListener(() {
      model.workingWeight = _workingWeightController.text;
      _exercisesState.value = model.exercise;
      _exercisesState.notifyListeners();
    });
    _repetitionsNumberController.addListener(() {
      model.repetitionsNumber = _repetitionsNumberController.text;
      _exercisesState.value = model.exercise;
      _exercisesState.notifyListeners();
    });
    _commentController.addListener(() {
      model.comment = _commentController.text;
      _exercisesState.value = model.exercise;
      _exercisesState.notifyListeners();
    });
    if (args != null) {
      _exerciseNameController.text = args.exercise.exerciseName;
      _workingWeightController.text = args.exercise.workingWeight;
      _repetitionsNumberController.text = args.exercise.repetitionsNumber;
      _commentController.text = args.exercise.comment;
      model.exerciseId = args.exercise.exerciseId;

      _exercisesState.value = model.exercise;
      _exercisesState.notifyListeners();
    }
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
    router.pop();
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

  @override
  Future<void> editExercise() async {
    await model.editExercise();
    final args = router.current.args is EditExerciseRouterArgs ? router.current.args! as EditExerciseRouterArgs : null;
    args?.refreshExercise?.call(model.exercise);
    await router.pop();
  }

  @override
  Future<void> deleteExercise(ExerciseData exercise) async {
    await model.deleteExercise(exercise);
    final args = router.current.args is EditExerciseRouterArgs ? router.current.args! as EditExerciseRouterArgs : null;
    args?.refreshExercise?.call(model.exercise);
    await router.pop();
    await router.pop();
  }
}

abstract class IEditExerciseScreenWidgetModel implements IWidgetModel {
  Future<void> editExercise();

  void deleteExercise(ExerciseData exercise);

  void closeScreen();

  ValueNotifier<ExerciseData> get exercisesState;

  TextEditingController get exerciseNameController;

  TextEditingController get workingWeightController;

  TextEditingController get repetitionsNumberController;

  TextEditingController get commentController;
}
