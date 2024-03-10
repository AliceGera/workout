import 'package:elementary/elementary.dart';
import 'package:workout/features/common/service/exercise_service.dart';
import 'package:workout/features/common/service/my_workouts_service.dart';
import 'package:workout/features/common/service/parameters_service.dart';
import 'package:workout/features/common/service/records_service.dart';

class SettingsScreenModel extends ElementaryModel {
  SettingsScreenModel(
    this._exercisesService,
    this._parametersService,
    this._myWorkoutsService,
      this._recordsService,
  );

  final ExerciseService _exercisesService;
  final ParametersService _parametersService;
  final RecordsService _recordsService;
final MyWorkoutsService  _myWorkoutsService;
  Future<void> deleteExercises() async {
    await _exercisesService.deleteExercises();
  }

  Future<void> deleteParameters() async {
    await _parametersService.deleteAllParameters();
  }

  Future<void> deleteMyWorkouts() async {
    await _myWorkoutsService.deleteMyWorkouts();
  }
  Future<void> deleteRecords() async {
    await _recordsService.deleteRecords();
  }
}
