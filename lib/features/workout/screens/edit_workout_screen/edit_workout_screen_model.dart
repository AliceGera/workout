import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:workout/features/common/service/exercise_service.dart';
import 'package:workout/features/common/service/my_workouts_service.dart';
import 'package:elementary/elementary.dart';

class EditWorkoutScreenModel extends ElementaryModel {
  EditWorkoutScreenModel(
    this._myWorkoutsService,
    this._exercisesService,
  ) : super();

  final MyWorkoutsService _myWorkoutsService;
  final ExerciseService _exercisesService;

  MyWorkoutData _workout = MyWorkoutData.init();
  List<ExerciseData> selectedExerciseDataList = [];

  MyWorkoutData get workout => _workout;

  set workoutName(String data) {
    _workout = _workout.copyWith(workoutName: data);
  }

  set exercisesIdList(List<int> data) {
    _workout = _workout.copyWith(exercisesIdList: data);
  }

  set workoutId(int data) {
    _workout = _workout.copyWith(workoutId: data);
  }

  Future<void> editWorkout() async {
    exercisesIdList = selectedExerciseDataList.map((e) => e.exerciseId).toList();
    await _myWorkoutsService.editMyWorkout(_workout);
  }
  Future<void> deleteWorkout(MyWorkoutData workoutData) async {
    await _myWorkoutsService.deleteMyWorkout(workoutData);
  }

  Future<List<ExerciseData>> getExercises() async {
    final exercises = await _exercisesService.getExercises();
    return exercises;
  }
}
