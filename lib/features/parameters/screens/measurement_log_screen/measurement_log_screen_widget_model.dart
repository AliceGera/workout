import 'package:workout/features/app/di/app_scope.dart';
import 'package:workout/features/common/domain/data/parameters/parameters_data.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:workout/features/parameters/screens/measurement_log_screen/measurement_log_screen.dart';
import 'package:workout/features/parameters/screens/measurement_log_screen/measurement_log_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_state/union_state.dart';

MeasurementLogScreenWidgetModel measurementLogScreenWmFactory(BuildContext context,) {
  final appScope = context.read<IAppScope>();
  final model = MeasurementLogScreenModel(
    appScope.parametersService,
  );
  return MeasurementLogScreenWidgetModel(
    model,
    appScope.router,
  );
}

class MeasurementLogScreenWidgetModel extends WidgetModel<MeasurementLogScreen, MeasurementLogScreenModel> implements IMeasurementLogScreenWidgetModel {
  MeasurementLogScreenWidgetModel(super._model,
      this.router,);

  final AppRouter router;

  final _parametersState = UnionStateNotifier<List<ParametersData>>([]);
  final _selectedIndexState = ValueNotifier<int>(0);

  @override
  void initWidgetModel() {
    _getParameters();
    super.initWidgetModel();
  }

  Future<void> _getParameters() async {
    _parametersState.loading();
    try {
      final parameters = await model.getParameters();
      _parametersState.content(parameters);
    } on Exception catch (e) {
      _parametersState.failure(e);
    }
  }

  @override
  Future<void> loadAgain() async {
    await _getParameters();
  }

  @override
  void closeScreen() {
    router.pop();
  }

  @override
  void tapOnTitle(int selectedIndex) {
    model.selectedIndex = selectedIndex;
    _selectedIndexState.value = selectedIndex;
  }

  @override
  UnionStateNotifier<List<ParametersData>> get parametersState => _parametersState;

  @override
  ValueNotifier<int> get selectedIndexState => _selectedIndexState;

}

abstract
interface

class IMeasurementLogScreenWidgetModel implements IWidgetModel {
  UnionStateNotifier<List<ParametersData>> get parametersState;

  ValueNotifier<int> get selectedIndexState;

  void loadAgain();

  void tapOnTitle(int selectedIndex);

  void closeScreen();
}
