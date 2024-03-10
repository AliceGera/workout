import 'package:workout/api/data/exercise_database.dart';
import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';

class ExerciseApi {
  ExerciseApi(this.appDatabase);

  final AppExerciseDatabase appDatabase;

  Future<List<ExerciseTableData>> getExercises() async {
    return appDatabase.select(appDatabase.exerciseTable).get();
  }

  Future<void> addExercise(ExerciseData data) async {
    await appDatabase.into(appDatabase.exerciseTable).insert(
          ExerciseTableCompanion.insert(
            exerciseName: data.exerciseName,
            workingWeight: data.workingWeight,
            repetitionsNumber: data.repetitionsNumber,
            comment: data.comment,
            exerciseLike: data.exerciseLike,
          ),
        );
  }

  Future<void> editExercise(ExerciseData data) async {
    final resultTable = appDatabase.update(appDatabase.exerciseTable)..where((t) => t.exerciseId.equals(data.exerciseId));
    await resultTable.write(
      ExerciseTableCompanion.insert(
        exerciseName: data.exerciseName,
        workingWeight: data.workingWeight,
        repetitionsNumber: data.repetitionsNumber,
        comment: data.comment,
        exerciseLike: data.exerciseLike,
      ),
    );
  }

  Future<void> deleteExercise(ExerciseData data) async {
    final resultTable = appDatabase.delete(appDatabase.exerciseTable)..where((t) => t.exerciseId.equals(data.exerciseId));
    await resultTable.go();
  }
  Future<void> deleteExercises() async {
    final resultTable = appDatabase.delete(appDatabase.exerciseTable);
    await resultTable.go();
  }

}
