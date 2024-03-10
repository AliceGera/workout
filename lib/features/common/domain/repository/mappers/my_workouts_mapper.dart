import 'package:workout/api/data/my_workout_database.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';


List<MyWorkoutData> mapDatabaseToMyWorkouts(List<MyWorkoutTableData> myWorkoutsTable) {
  return myWorkoutsTable
      .map(
        (e) => MyWorkoutData(
          workoutId: e.workoutId,
          workoutName: e.workoutName,
          exercisesIdList: e.exercisesIdList ?? [],
        ),
      )
      .toList();
}
