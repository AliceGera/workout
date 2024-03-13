import 'package:collection/collection.dart';
import 'package:workout/features/common/domain/data/records/record_data.dart';
import 'package:workout/features/common/service/my_workouts_service.dart';
import 'package:workout/features/common/service/records_service.dart';
import 'package:elementary/elementary.dart';

class ScheduleScreenModel extends ElementaryModel {
  ScheduleScreenModel(
    this._recordsService,
    this._myWorkoutsService,
  ) : super();
  final RecordsService _recordsService;
  final MyWorkoutsService _myWorkoutsService;

  DateTime weekDateTime = DateTime.now();
  List<RecordData> records = [];

  Future<List<RecordData>> getRecords() async {
    final records = await _recordsService.getRecords();
    final workouts = await _myWorkoutsService.getMyWorkouts();
    /*return */
    final recs = records
        .map(
          (el) => el.copyWith(
            recordWorkoutName: workouts.firstWhereOrNull((e) => e.workoutId == el.recordWorkoutId)?.workoutName,
          ),
        )
        .toList();
    final List<RecordData> updatedRecords = List.from(recs);
    for (var record in recs) {
      if (record.recordRepetition == 'Раз в неделю') {
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 7)))),

        );
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 14)))),
        );
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 21)))),
        );
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 28)))),
        );
      }
      if (record.recordRepetition == 'Каждые два дня') {
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 2)))),
        );
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 4)))),
        );
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 6)))),
        );
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 8)))),
        );
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 10)))),
        );
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 12)))),
        );
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 14)))),
        );
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 16)))),
        );
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 18)))),
        );
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 20)))),
        );
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 22)))),
        );
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 24)))),
        );
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 26)))),
        );
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 28)))),
        );
      }
      if (record.recordRepetition == 'Раз в дне недели') {
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 14)))),
        );
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 28)))),
        );
      }
      if (record.recordRepetition == 'Раз в месяц') {
        updatedRecords.add(
          record.copyWith(recordDate: (record.recordDate?.add(Duration(days: 30)))),
        );
      }
    }
    return updatedRecords;
  }

  Future<void> deleteRecord(RecordData data) async {
    await _recordsService.deleteRecord(data);
  }
}
