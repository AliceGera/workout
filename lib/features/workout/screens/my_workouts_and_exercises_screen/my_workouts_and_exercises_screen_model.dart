import 'package:workout/features/common/domain/data/my_workouts_and_exercises/my_workouts_and_exercises_data.dart';
import 'package:workout/features/common/service/object_types_and_objects_service.dart';
import 'package:elementary/elementary.dart';

class MyWorkoutsAndExercisesScreenModel extends ElementaryModel {
  MyWorkoutsAndExercisesScreenModel(
    this._myWorkoutsAndExercisesService,
  ) : super();

  final MyWorkoutsAndExercisesService _myWorkoutsAndExercisesService;

  Future<MyWorkoutsAndExercisesData> getMyWorkoutsAndExercises() async {
    final myWorkoutsAndExercises = await _myWorkoutsAndExercisesService.getMyWorkoutsAndExercises();
    return myWorkoutsAndExercises;
  }
}
