import 'package:workout/api/data/record_database.dart';
import 'package:workout/features/common/domain/data/records/record_data.dart';

List<RecordData> mapDatabaseToRecords(List<RecordTableData> recordsTable) {
  return recordsTable
      .map(
        (e) => RecordData(
          id: e.id,
          recordWorkoutId: e.recordWorkoutId,
          recordRepetition: e.recordRepetition,
          recordDate: e.recordDate,
          recordTime: e.recordTime,
          recordWorkoutName: e.recordWorkoutName,
        ),
      )
      .toList();
}
