import 'package:workout/features/app/di/app_scope.dart';
import 'package:workout/features/common/domain/data/parameters/parameters_data.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'parameters_screen.dart';
import 'parameters_screen_model.dart';

ParametersScreenWidgetModel parametersScreenWmFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final model = ParametersScreenModel(
    appScope.parametersService,
  );
  return ParametersScreenWidgetModel(
    model,
    appScope.router,
    appScope as AppScope,
  );
}

class ParametersScreenWidgetModel extends WidgetModel<ParametersScreen, ParametersScreenModel> implements IParametersScreenWidgetModel {
  ParametersScreenWidgetModel(
    super._model,
    this.router,
      this._appScope
  );
  final AppScope _appScope;
  final AppRouter router;
  final _parametersState = ValueNotifier<ParametersData>(ParametersData.init());

  @override
  void openStartMeasurementsScreen() {
    router.push(
      StartMeasurementsRouter(
        loadAgain: loadAgain,
      ),
    );
  }

  @override
  void openMeasurementLogScreen() {
    router.push(
      MeasurementLogRouter(
          ),
    );
  }

  @override
  void initWidgetModel() {
    _appScope.parametersRebuilder = loadAgain;
    _getParameters();
    super.initWidgetModel();
  }

  Future<void> _getParameters() async {
    final parameters = await model.getParameters();
    _parametersState.value = parameters ?? ParametersData.init();
  }

  @override
  Future<void> loadAgain() async {
    await _getParameters();
  }

  @override
  ValueNotifier<ParametersData> get parametersState => _parametersState;
}

abstract interface class IParametersScreenWidgetModel implements IWidgetModel {
  ValueNotifier<ParametersData> get parametersState;

  void loadAgain();

  void openStartMeasurementsScreen();

  void openMeasurementLogScreen();
}
