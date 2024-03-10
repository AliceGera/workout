import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/service/exercise_service.dart';
import 'package:elementary/elementary.dart';

class AddExerciseScreenModel extends ElementaryModel {
  AddExerciseScreenModel(
    this._exercisesService,
  ) : super();

  final ExerciseService _exercisesService;

  ExerciseData _exercise = ExerciseData.init();

  ExerciseData get exercise => _exercise;

  set exerciseName(String data) {
    _exercise = _exercise.copyWith(exerciseName: data);
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

  Future<void> addExercise() async {
    await _exercisesService.addExercise(_exercise);
  }
}
