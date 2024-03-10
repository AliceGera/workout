import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:workout/features/common/service/my_workouts_service.dart';
import 'package:elementary/elementary.dart';

class MyWorkoutsScreenModel extends ElementaryModel {
  MyWorkoutsScreenModel(this._myWorkoutsService) : super();
  final MyWorkoutsService _myWorkoutsService;

  Future<List<MyWorkoutData>> getMyWorkouts() async {
    final exercises = await _myWorkoutsService.getMyWorkouts();
    return exercises;
  }
}
