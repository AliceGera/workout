class MyWorkoutData {
  final int workoutId;
  final String workoutName;
  final List<int> exercisesIdList;

  MyWorkoutData({
    required this.workoutId,
    required this.workoutName,
    required this.exercisesIdList,
  });

  static MyWorkoutData init() => MyWorkoutData(
        workoutId: 0,
        workoutName: '',
        exercisesIdList: [],
      );

  MyWorkoutData copyWith({
    int? workoutId,
    String? workoutName,
    List<int>? exercisesIdList,
  }) {
    return MyWorkoutData(
      workoutId: workoutId ?? this.workoutId,
      workoutName: workoutName ?? this.workoutName,
      exercisesIdList: exercisesIdList ?? this.exercisesIdList,
    );
  }
}
