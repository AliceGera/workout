import 'package:workout/features/app/di/app_scope.dart';
import 'package:workout/features/common/domain/data/records/record_data.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:workout/features/schedule/screens/schedule_screen/schedule_screen.dart';
import 'package:workout/features/schedule/screens/schedule_screen/schedule_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_state/union_state.dart';

ScheduleScreenWidgetModel scheduleScreenWmFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final model = ScheduleScreenModel(
    appScope.recordsService,
    appScope.myWorkoutsService,
  );
  return ScheduleScreenWidgetModel(
    model,
    appScope.router,
    appScope as AppScope,
  );
}

class ScheduleScreenWidgetModel extends WidgetModel<ScheduleScreen, ScheduleScreenModel> implements IScheduleScreenWidgetModel {
  ScheduleScreenWidgetModel(
    super._model,
    this.router,
    this._appScope,
  );

  final AppRouter router;
  final AppScope _appScope;
  final _scheduleRecordState = UnionStateNotifier<List<RecordData>>([]);

  @override
  void openAddRecordScreen() {
    router.push(
      AddRecordRouter(
        loadAgain: loadAgain,
      ),
    );
  }

  @override
  Future<void> onTapDeleteRecord(RecordData data) async {
    await model.deleteRecord(data);
    await loadAgain();
  }

  @override
  void initWidgetModel() {
    _getRecords();
    _appScope.trainingScheduleRebuilder = loadAgain;
    super.initWidgetModel();
  }

  Future<void> _getRecords() async {
    _scheduleRecordState.loading();
    try {
      final records = await model.getRecords();
      model.records = records;
      _scheduleRecordState.content(records);
    } on Exception catch (e) {
      _scheduleRecordState.failure(e);
    }
  }

  @override
  Future<void> loadAgain() async {
    await _getRecords();
  }

  @override
  UnionStateNotifier<List<RecordData>> get scheduleRecordState => _scheduleRecordState;
}

abstract interface class IScheduleScreenWidgetModel implements IWidgetModel {
  UnionStateNotifier<List<RecordData>> get scheduleRecordState;

  void loadAgain();

  void openAddRecordScreen();

  Future<void> onTapDeleteRecord(RecordData data);
}
