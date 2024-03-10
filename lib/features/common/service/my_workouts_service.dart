import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:workout/features/common/domain/repository/objects_repository.dart';

class MyWorkoutsService {
  final MyWorkoutRepository _myWorkoutsRepository;

  MyWorkoutsService(this._myWorkoutsRepository);

  Future<List<MyWorkoutData>> getMyWorkouts() async {
    return _myWorkoutsRepository.getMyWorkouts();
  }

  Future<void> addMyWorkout(MyWorkoutData data) async {
    await _myWorkoutsRepository.addMyWorkout(data);
  }

  Future<void> deleteMyWorkout(MyWorkoutData data) async {
    await _myWorkoutsRepository.deleteMyWorkout(data);
  }

  Future<void> deleteMyWorkouts() async {
    await _myWorkoutsRepository.deleteMyWorkouts();
  }

  Future<void> editMyWorkout(MyWorkoutData data) async {
    await _myWorkoutsRepository.editMyWorkout(data);
  }
}
