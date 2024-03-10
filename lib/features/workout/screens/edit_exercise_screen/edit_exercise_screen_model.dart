import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/service/exercise_service.dart';
import 'package:elementary/elementary.dart';

class EditExerciseScreenModel extends ElementaryModel {
  EditExerciseScreenModel(
    this._exercisesService,
  ) : super();

  final ExerciseService _exercisesService;

  ExerciseData _exercise = ExerciseData.init();

  ExerciseData get exercise => _exercise;

  set exerciseName(String data) {
    _exercise = _exercise.copyWith(exerciseName: data);
  }

  set exerciseId(int data) {
    _exercise = _exercise.copyWith(exerciseId: data);
  }

  set workingWeight(String data) {
    _exercise = _exercise.copyWith(workingWeight: data);
  }

  set repetitionsNumber(String data) {
    _exercise = _exercise.copyWith(repetitionsNumber: data);
  }

  set comment(String data) {
    _exercise = _exercise.copyWith(comment: data);
  }

  Future<void> deleteExercise(ExerciseData exerciseData) async {
    await _exercisesService.deleteExercise(exerciseData);
  }

  Future<void> editExercise() async {
    await _exercisesService.editExercise(_exercise);
  }
}
