import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:workout/features/common/service/exercise_service.dart';
import 'package:elementary/elementary.dart';

class WorkoutInfoScreenModel extends ElementaryModel {
  WorkoutInfoScreenModel(
    this._exercisesService,
  ) : super();

  final ExerciseService _exercisesService;
  MyWorkoutData _workout = MyWorkoutData.init();
  List<ExerciseData> selectedExerciseDataList = [];

  MyWorkoutData get workout => _workout;

  Future<List<ExerciseData>> getSelectedExercises(List<int> selectedExercises) async {
    return _exercisesService.getSelectedExercises(selectedExercises);
  }

  set workoutName(String data) {
    _workout = _workout.copyWith(workoutName: data);
  }

  set exercisesIdList(List<int> data) {
    _workout = _workout.copyWith(exercisesIdList: data);
  }

  set workoutId(int data) {
    _workout = _workout.copyWith(workoutId: data);
  }
}
