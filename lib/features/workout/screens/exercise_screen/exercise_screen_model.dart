import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:elementary/elementary.dart';

class ExerciseScreenModel extends ElementaryModel {
  ExerciseScreenModel() : super();

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
}
