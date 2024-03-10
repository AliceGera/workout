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
    return records
        .map(
          (el) => el.copyWith(
            recordWorkoutName: workouts.firstWhereOrNull((e) => e.workoutId == el.recordWorkoutId)?.workoutName,
          ),
        )
        .toList();
  }

  Future<void> deleteRecord(RecordData data) async {
    await _recordsService.deleteRecord(data);
  }
}
