import 'package:workout/api/data/record_database.dart';
import 'package:workout/features/common/domain/data/records/record_data.dart';

class RecordsApi {
  RecordsApi(this.appDatabase);

  final AppRecordDatabase appDatabase;

  Future<List<RecordTableData>> getRecords() async {
    return appDatabase.select(appDatabase.recordTable).get();
  }

  Future<void> addRecord(RecordData data) async {
    await appDatabase.into(appDatabase.recordTable).insert(
          RecordTableCompanion.insert(
            recordDate: data.recordDate!,
            recordTime: data.recordTime!,
            recordRepetition: data.recordRepetition,
            recordWorkoutId: data.recordWorkoutId,
            recordWorkoutName: data.recordWorkoutName,
          ),
        );
  }

  Future<void> editRecord(RecordData data) async {
    final resultTable = appDatabase.update(appDatabase.recordTable)..where((t) => t.id.equals(data.id));
    await resultTable.write(
      RecordTableCompanion.insert(
        recordDate: data.recordDate!,
        recordTime: data.recordTime!,
        recordRepetition: data.recordRepetition,
        recordWorkoutId: data.recordWorkoutId,
        recordWorkoutName: data.recordWorkoutName,
      ),
    );
  }

  Future<void> deleteRecord(RecordData data) async {
    final resultTable = appDatabase.delete(appDatabase.recordTable)..where((t) => t.id.equals(data.id));
    await resultTable.go();
  }

  Future<void> deleteRecords() async {
    final resultTable = appDatabase.delete(appDatabase.recordTable);
    await resultTable.go();
  }
}
