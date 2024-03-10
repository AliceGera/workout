import 'package:workout/api/data/exercise_database.dart';
import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';

List<ExerciseData> mapDatabaseToExercise(List<ExerciseTableData> objectTypeTable) {
  return objectTypeTable
      .map(
        (e) => ExerciseData(
          exerciseId: e.exerciseId,
          exerciseName: e.exerciseName,
          workingWeight: e.workingWeight,
          repetitionsNumber: e.repetitionsNumber,
          comment: e.comment,
          exerciseLike: e.exerciseLike,
        ),
      )
      .toList();
}
