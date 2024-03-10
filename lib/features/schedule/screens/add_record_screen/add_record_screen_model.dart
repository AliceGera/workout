import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:workout/features/common/domain/data/records/record_data.dart';
import 'package:workout/features/common/service/exercise_service.dart';
import 'package:workout/features/common/service/my_workouts_service.dart';
import 'package:workout/features/common/service/records_service.dart';
import 'package:elementary/elementary.dart';

class AddRecordScreenModel extends ElementaryModel {
  AddRecordScreenModel(
    this._recordsService,
    this._myWorkoutsService,
    this._exercisesService,
  ) : super();
  final RecordsService _recordsService;

  final MyWorkoutsService _myWorkoutsService;
  final ExerciseService _exercisesService;
  final MyWorkoutData _workout = MyWorkoutData.init();

  List<MyWorkoutData> workoutsList = [];

  MyWorkoutData get workout => _workout;
  RecordData _record = RecordData.init();

  RecordData get record => _record;

  set recordWorkoutId(int data) {
    _record = _record.copyWith(recordWorkoutId: data);
  }

  set recordDate(DateTime? date) {
    _record = _record.copyWith(recordDate: date);
  }

  set recordWorkoutName(String? date) {
    _record = _record.copyWith(recordWorkoutName: date);
  }

  set recordTime(DateTime? date) {
    _record = _record.copyWith(recordTime: date);
  }

  set recordRepetition(String data) {
    _record = _record.copyWith(recordRepetition: data);
  }

  Future<void> addRecord() async {
    _record = _record.copyWith(
      recordDate: DateTime(
        _record.recordDate!.year,
        _record.recordDate!.month,
        _record.recordDate!.day,
      ),
    );
    await _recordsService.addRecord(_record);
  }

  /* set workoutName(String data) {
    _workout = _workout.copyWith(workoutName: data);
  }

  set exercisesIdList(List<int> data) {
    _workout = _workout.copyWith(exercisesIdList: data);
  }

  set objectTypeId(int data) {
    _workout = _workout.copyWith(workoutId: data);
  }*/

  /*Future<void> addWorkout() async {
    exercisesIdList = selectedExerciseDataList.map((e) => e.exerciseId).toList();
    await _myWorkoutsService.addMyWorkout(_workout);
  }*/
  Future<List<ExerciseData>> getExercises() async {
    final exercises = await _exercisesService.getExercises();
    return exercises;
  }

  Future<List<MyWorkoutData>> getWorkouts() async {
    final workouts = await _myWorkoutsService.getMyWorkouts();
    workoutsList = workouts;
    return workouts;
  }
}
