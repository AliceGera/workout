import 'package:workout/api/service/records_api.dart';
import 'package:workout/features/common/domain/data/records/record_data.dart';
import 'package:workout/features/common/domain/repository/mappers/records_mapper.dart';

class RecordsRepository {
  final RecordsApi _apiClient;

  RecordsRepository(this._apiClient);

  Future<List<RecordData>> getRecords() async {
    final some = await _apiClient.getRecords();
    return mapDatabaseToRecords(some);
  }

  Future<void> addRecord(RecordData data) async {
    await _apiClient.addRecord(data);
  }

  Future<void> editRecord(RecordData data) async {
    await _apiClient.editRecord(data);
  }

  Future<void> deleteRecord(RecordData data) async {
    await _apiClient.deleteRecord(data);
  }
  Future<void> deleteRecords() async {
    await _apiClient.deleteRecords();
  }

}
