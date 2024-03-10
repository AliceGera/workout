import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:workout/features/common/domain/data/my_workouts_and_exercises/my_workouts_and_exercises_data.dart';

MyWorkoutsAndExercisesData mapDatabaseToMyWorkoutsAndExercises(
  List<MyWorkoutData> myWorkoutS,
  List<ExerciseData> exercises,
) {

  return MyWorkoutsAndExercisesData(
    myWorkouts: myWorkoutS,
    exercises: exercises,
  );
}
