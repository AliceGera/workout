import 'package:workout/features/app/di/app_scope.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:workout/features/common/domain/data/records/record_data.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:workout/features/schedule/screens/add_record_screen/add_record_screen.dart';
import 'package:workout/features/schedule/screens/add_record_screen/add_record_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_state/union_state.dart';

AddRecordScreenWidgetModel addRecordScreenWmFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final model = AddRecordScreenModel(
    appScope.recordsService,
    appScope.myWorkoutsService,
    appScope.exerciseService,
  );

  return AddRecordScreenWidgetModel(
    model,
    appScope.router,
  );
}

class AddRecordScreenWidgetModel extends WidgetModel<AddRecordScreen, AddRecordScreenModel> implements IAddRecordScreenWidgetModel {
  final AppRouter router;

  AddRecordScreenWidgetModel(
    super._model,
    this.router,
  );

  final _selectedIndexState = ValueNotifier<int?>(null);
  final _workoutsState = UnionStateNotifier<List<MyWorkoutData>>([]);

  final _recordState = ValueNotifier<RecordData>(RecordData.init());

  @override
  void initWidgetModel() {
    getRecords();
    super.initWidgetModel();
  }

  @override
  void addDate(DateTime? date) {
    model.recordDate = date;
    _recordState.value = model.record;
  }

  @override
  void addTime(DateTime? date) {
    model.recordTime = date;
    recordState.value = model.record;
  }

  Future<void> getRecords() async {
    _workoutsState.loading();
    try {
      final workouts = await model.getWorkouts();
      _workoutsState.content(workouts);
    } on Exception catch (e) {
      _workoutsState.failure(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void closeScreen() {
    router.pop();
  }

  @override
  Future<void> saveRecordRepetition(String recordRepetition) async {
    model.recordRepetition = recordRepetition;
    _recordState.value = model.record;
  }

  @override
  Future<void> addRecord() async {
    await model.addRecord();
    await router.pop();
  }

  @override
  ValueNotifier<RecordData> get recordState => _recordState;

  @override
  void tapOnCheckBoxExercise(int index) {
    _selectedIndexState.value = index;
  }

  @override
  void selectExercise(bool? isSelected) {
    if (isSelected == true) {
      final selectedWorkOut = model.workoutsList[_selectedIndexState.value!];
      model.recordWorkoutId = selectedWorkOut.workoutId;
      model.recordWorkoutName = selectedWorkOut.workoutName;
      _recordState.value = model.record;
    } else {
      _selectedIndexState.value = null;
    }
  }

  @override
  UnionStateNotifier<List<MyWorkoutData>> get workoutsState => _workoutsState;

  @override
  ValueNotifier<int?> get selectedIndexState => _selectedIndexState;
}

abstract interface class IAddRecordScreenWidgetModel implements IWidgetModel {

  ValueNotifier<RecordData> get recordState;

  void closeScreen();

  void addDate(DateTime? date);

  void saveRecordRepetition(String recordModel);

  Future<void> addRecord();

  void addTime(DateTime? date);

  void tapOnCheckBoxExercise(int index);

  UnionStateNotifier<List<MyWorkoutData>> get workoutsState;

  ValueNotifier<int?> get selectedIndexState;

  void selectExercise(bool? isSelected);
}
