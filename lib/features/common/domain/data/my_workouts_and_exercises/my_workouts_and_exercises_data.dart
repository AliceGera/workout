import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';

class MyWorkoutsAndExercisesData {
  final List<MyWorkoutData> myWorkouts;

  final List<ExerciseData> exercises;

  MyWorkoutsAndExercisesData({
    required this.myWorkouts,
    required this.exercises,
  });

  static MyWorkoutsAndExercisesData init() => MyWorkoutsAndExercisesData(
        myWorkouts: [],
        exercises: [],
      );

  MyWorkoutsAndExercisesData copyWith({
    List<MyWorkoutData>? myWorkouts,
    List<ExerciseData>? exercises,
  }) {
    return MyWorkoutsAndExercisesData(
      myWorkouts: myWorkouts ?? this.myWorkouts,
      exercises: exercises ?? this.exercises,
    );
  }
}
