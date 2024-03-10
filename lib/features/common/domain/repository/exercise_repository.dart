import 'package:workout/api/service/exercise_api.dart';
import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/domain/repository/mappers/exercise_mapper.dart';

class ExerciseRepository {
  final ExerciseApi _apiClient;

  ExerciseRepository(this._apiClient);

  Future<List<ExerciseData>> getExercises() async {
    final exercises = await _apiClient.getExercises();
    return mapDatabaseToExercise(exercises);
  }

  Future<List<ExerciseData>> getSelectedExercises(List<int> selectedExercises) async {
    final exercises = await _apiClient.getExercises();
    final selectedExercise = exercises.where((e) => selectedExercises.contains(e.exerciseId)).toList();
    return mapDatabaseToExercise(selectedExercise);
  }

  Future<void> addExercise(ExerciseData data) async {
    await _apiClient.addExercise(data);
  }

  Future<void> editExercise(ExerciseData data) async {
    await _apiClient.editExercise(data);
  }

  Future<void> deleteExercise(ExerciseData data) async {
    await _apiClient.deleteExercise(data);
  }
  Future<void> deleteExercises() async {
    await _apiClient.deleteExercises();
  }

}
