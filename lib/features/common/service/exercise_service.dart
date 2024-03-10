import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/domain/repository/exercise_repository.dart';

class ExerciseService {
  final ExerciseRepository _exercisesRepository;

  ExerciseService(this._exercisesRepository);

  Future<List<ExerciseData>> getExercises() async {
    return _exercisesRepository.getExercises();
  }

  Future<List<ExerciseData>> getSelectedExercises(List<int> selectedExercises) async {
    return _exercisesRepository.getSelectedExercises(selectedExercises);
  }

  Future<void> addExercise(ExerciseData data) async {
    await _exercisesRepository.addExercise(data);
  }

  Future<void> editExercise(ExerciseData data) async {
    await _exercisesRepository.editExercise(data);
  }
  Future<void> deleteExercise(ExerciseData data) async {
    await _exercisesRepository.deleteExercise(data);
  }
  Future<void> deleteExercises() async {
    await _exercisesRepository.deleteExercises();
  }

}
