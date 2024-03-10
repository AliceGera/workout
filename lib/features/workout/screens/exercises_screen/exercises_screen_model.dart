import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/service/exercise_service.dart';
import 'package:elementary/elementary.dart';

class ExercisesScreenModel extends ElementaryModel {
  ExercisesScreenModel(this._exercisesService) : super();

  final ExerciseService _exercisesService;
  List<ExerciseData> exerciseList = [];

  void setExerciseLike(int selectedIndex) {
    exerciseList[selectedIndex] = exerciseList[selectedIndex].copyWith(
      exerciseLike: !exerciseList[selectedIndex].exerciseLike,
    );
  }

  Future<List<ExerciseData>> getExercises() async {
    final exercises = await _exercisesService.getExercises();
    exerciseList = exercises;
    return exercises;
  }

  Future<void> editExercise(int selectedIndex) async {
    await _exercisesService.editExercise(exerciseList[selectedIndex]);
  }
}
