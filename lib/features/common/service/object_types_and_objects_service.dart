import 'package:workout/features/common/domain/data/my_workouts_and_exercises/my_workouts_and_exercises_data.dart';
import 'package:workout/features/common/domain/repository/exercise_repository.dart';
import 'package:workout/features/common/domain/repository/mappers/my_workouts_and_exercises_mapper.dart';
import 'package:workout/features/common/domain/repository/objects_repository.dart';

class MyWorkoutsAndExercisesService {
  final MyWorkoutRepository _myWorkoutRepository;
  final ExerciseRepository _exerciseRepository;

  MyWorkoutsAndExercisesService(
    this._myWorkoutRepository,
    this._exerciseRepository,
  );

  Future<MyWorkoutsAndExercisesData> getMyWorkoutsAndExercises() async {
    final myWorkouts = await _myWorkoutRepository.getMyWorkouts();
    final exercises = await _exerciseRepository.getExercises();
    return mapDatabaseToMyWorkoutsAndExercises(
      myWorkouts,
      exercises,
    );
  }



}
