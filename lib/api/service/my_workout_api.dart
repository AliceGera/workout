import 'package:workout/api/data/my_workout_database.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:drift/drift.dart';

class MyWorkoutApi {
  MyWorkoutApi(this.appMyWorkoutDatabase);

  final AppMyWorkoutDatabase appMyWorkoutDatabase;

  Future<List<MyWorkoutTableData>> getMyWorkouts() async {
    return appMyWorkoutDatabase.select(appMyWorkoutDatabase.myWorkoutTable).get();
  }

  Future<void> addMyWorkout(MyWorkoutData data) async {
    await appMyWorkoutDatabase.into(appMyWorkoutDatabase.myWorkoutTable).insert(
          MyWorkoutTableCompanion.insert(
            workoutName: data.workoutName,
            exercisesIdList: Value(data.exercisesIdList ?? []),
          ),
        );
  }

  Future<void> editMyWorkout(MyWorkoutData data) async {
    final resultTable = appMyWorkoutDatabase.update(appMyWorkoutDatabase.myWorkoutTable)..where((t) => t.workoutId.equals(data.workoutId));
    await resultTable.write(
      MyWorkoutTableCompanion.insert(
        workoutName: data.workoutName,
        exercisesIdList: Value(data.exercisesIdList ?? []),
      ),
    );
  }

  Future<void> deleteMyWorkout(MyWorkoutData data) async {
    final resultTable = appMyWorkoutDatabase.delete(appMyWorkoutDatabase.myWorkoutTable)..where((t) => t.workoutId.equals(data.workoutId));
    await resultTable.go();
  }

  Future<void> deleteMyWorkouts() async {
    final resultTable = appMyWorkoutDatabase.delete(appMyWorkoutDatabase.myWorkoutTable);
    await resultTable.go();
  }
}
