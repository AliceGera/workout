import 'package:workout/api/data/exercise_database.dart';
import 'package:workout/api/data/my_workout_database.dart';
import 'package:workout/api/data/parameters_database.dart';
import 'package:workout/api/data/record_database.dart';
import 'package:workout/api/service/exercise_api.dart';
import 'package:workout/api/service/my_workout_api.dart';
import 'package:workout/api/service/parameters_api.dart';
import 'package:workout/api/service/records_api.dart';
import 'package:workout/features/common/domain/repository/exercise_repository.dart';
import 'package:workout/features/common/domain/repository/objects_repository.dart';
import 'package:workout/features/common/domain/repository/parameters_repository.dart';
import 'package:workout/features/common/domain/repository/records_repository.dart';
import 'package:workout/features/common/service/exercise_service.dart';
import 'package:workout/features/common/service/my_workouts_service.dart';
import 'package:workout/features/common/service/object_types_and_objects_service.dart';
import 'package:workout/features/common/service/parameters_service.dart';
import 'package:workout/features/common/service/records_service.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppScope implements IAppScope {
  late final AppRouter _router;
  late final ParametersApi _parametersApi;
  late final ParametersService _parametersService;
  late final ParametersRepository _parametersRepository;
  late final RecordsService _recordsService;
  late final RecordsRepository _recordsRepository;
  late final RecordsApi _recordsApi;
  late final MyWorkoutApi _myWorkoutApi;
  late final MyWorkoutsService _myWorkoutsService;
  late final MyWorkoutRepository _myWorkoutRepository;
  late final MyWorkoutsAndExercisesService _myWorkoutsAndExercisesService;
  late final ExerciseApi _exerciseApi;
  late final ExerciseService _exerciseService;
  late final ExerciseRepository _exerciseRepository;
  late final SharedPreferences _sharedPreferences;
  @override
  late VoidCallback applicationRebuilder;

  @override
  VoidCallback trainingScheduleRebuilder = () {};
  @override
  VoidCallback myWorkoutsAndExercisesRebuilder = () {};
  @override
  VoidCallback parametersRebuilder = () {};

  @override
  ParametersService get parametersService => _parametersService;

  @override
  RecordsService get recordsService => _recordsService;

  @override
  MyWorkoutsService get myWorkoutsService => _myWorkoutsService;

  @override
  ExerciseService get exerciseService => _exerciseService;

  @override
  MyWorkoutsAndExercisesService get myWorkoutsAndExercisesService => _myWorkoutsAndExercisesService;

  @override
  AppRouter get router => _router;

  @override
  SharedPreferences get sharedPreferences => _sharedPreferences;

  AppScope(this._sharedPreferences) {
    _router = AppRouter.instance();
    _parametersApi = ParametersApi(AppParametersDatabase());
    _parametersService = _initParametersService();
    _recordsApi = RecordsApi(AppRecordDatabase());
    _recordsService = _initRecordsService();
    _myWorkoutApi = MyWorkoutApi(AppMyWorkoutDatabase());
    _myWorkoutsService = _initMyWorkoutsService();
    _exerciseApi = ExerciseApi(AppExerciseDatabase());
    _exerciseService = _initExerciseService();
    _myWorkoutsAndExercisesService = _initMyWorkoutsAndExercisesService();
  }

  ParametersService _initParametersService() {
    _parametersRepository = ParametersRepository(_parametersApi);
    return ParametersService(_parametersRepository);
  }

  RecordsService _initRecordsService() {
    _recordsRepository = RecordsRepository(_recordsApi);
    return RecordsService(_recordsRepository);
  }

  MyWorkoutsService _initMyWorkoutsService() {
    _myWorkoutRepository = MyWorkoutRepository(_myWorkoutApi);
    return MyWorkoutsService(_myWorkoutRepository);
  }

  ExerciseService _initExerciseService() {
    _exerciseRepository = ExerciseRepository(_exerciseApi);
    return ExerciseService(_exerciseRepository);
  }

  MyWorkoutsAndExercisesService _initMyWorkoutsAndExercisesService() {
    return MyWorkoutsAndExercisesService(_myWorkoutRepository, _exerciseRepository);
  }
}

abstract class IAppScope {
  VoidCallback get applicationRebuilder;

  AppRouter get router;

  ParametersService get parametersService;

  RecordsService get recordsService;

  MyWorkoutsService get myWorkoutsService;

  ExerciseService get exerciseService;

  MyWorkoutsAndExercisesService get myWorkoutsAndExercisesService;

  SharedPreferences get sharedPreferences;

  VoidCallback get trainingScheduleRebuilder;
  VoidCallback get myWorkoutsAndExercisesRebuilder;
  VoidCallback get parametersRebuilder;

}
