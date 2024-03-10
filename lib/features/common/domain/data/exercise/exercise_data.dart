class ExerciseData {
  final int exerciseId;
  final String exerciseName;
  final String workingWeight;
  final String repetitionsNumber;
  final String comment;
  final bool exerciseLike;

  ExerciseData({
    required this.exerciseId,
    required this.exerciseName,
    required this.workingWeight,
    required this.repetitionsNumber,
    required this.comment,
    required this.exerciseLike,
  });

  static ExerciseData init() => ExerciseData(
        exerciseId: 0,
        exerciseName: '',
        workingWeight: '',
        repetitionsNumber: '',
        comment: '',
      exerciseLike:false,
      );

  ExerciseData copyWith({
    int? exerciseId,
    String? exerciseName,
    String? workingWeight,
    String? repetitionsNumber,
    String? comment,
    bool? exerciseLike,
  }) {
    return ExerciseData(
      exerciseId: exerciseId ?? this.exerciseId,
      exerciseName: exerciseName ?? this.exerciseName,
      workingWeight: workingWeight ?? this.workingWeight,
      repetitionsNumber: repetitionsNumber ?? this.repetitionsNumber,
      comment: comment ?? this.comment,
      exerciseLike: exerciseLike ?? this.exerciseLike,
    );
  }
}
