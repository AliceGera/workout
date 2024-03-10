import 'package:workout/api/service/my_workout_api.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:workout/features/common/domain/repository/mappers/my_workouts_mapper.dart';

class MyWorkoutRepository {
  final MyWorkoutApi _apiClient;

  MyWorkoutRepository(this._apiClient);

  Future<List<MyWorkoutData>> getMyWorkouts() async {
    final some = await _apiClient.getMyWorkouts();
    return mapDatabaseToMyWorkouts(some);
  }

  Future<void> addMyWorkout(MyWorkoutData data) async {
    await _apiClient.addMyWorkout(data);
  }

  Future<void> deleteMyWorkout(MyWorkoutData data) async {
    await _apiClient.deleteMyWorkout(data);
  }

  Future<void> deleteMyWorkouts() async {
    await _apiClient.deleteMyWorkouts();
  }

  Future<void> editMyWorkout(MyWorkoutData data) async {
    await _apiClient.editMyWorkout(data);
  }

}
