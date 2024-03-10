class RecordData {
  final int id;
  final int recordWorkoutId;
  final String recordRepetition;
  final String recordWorkoutName;
  final DateTime? recordDate;
  final DateTime? recordTime;

  RecordData({
    required this.id,
    required this.recordWorkoutId,
    required this.recordRepetition,
    required this.recordWorkoutName,
    this.recordDate,
    this.recordTime,
  });

  static RecordData init() => RecordData(
        id: 0,
        recordWorkoutId: 0,
        recordRepetition: '',
        recordWorkoutName: '',
      );

  RecordData copyWith({
    int? id,
    int? recordWorkoutId,
    String? recordRepetition,
    String? recordWorkoutName,
    DateTime? recordDate,
    DateTime? recordTime,
  }) {
    return RecordData(
      id: id ?? this.id,
      recordWorkoutId: recordWorkoutId ?? this.recordWorkoutId,
      recordRepetition: recordRepetition ?? this.recordRepetition,
      recordWorkoutName: recordWorkoutName ?? this.recordWorkoutName,
      recordDate: recordDate ?? this.recordDate,
      recordTime: recordTime ?? this.recordTime,
    );
  }
}
