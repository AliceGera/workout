import 'package:workout/features/app/di/app_scope.dart';
import 'package:workout/features/common/domain/data/parameters/parameters_data.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:workout/features/parameters/screens/start_measurements_screen/start_measurements_screen.dart';
import 'package:workout/features/parameters/screens/start_measurements_screen/start_measurements_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

StartMeasurementsScreenWidgetModel startMeasurementsScreenWmFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final model = StartMeasurementsScreenModel(
    appScope.parametersService,
  );

  return StartMeasurementsScreenWidgetModel(
    model,
    appScope.router,
  );
}

class StartMeasurementsScreenWidgetModel extends WidgetModel<StartMeasurementsScreen, StartMeasurementsScreenModel>
    implements IStartMeasurementsScreenWidgetModel {
  final AppRouter _router;

  StartMeasurementsScreenWidgetModel(
    super._model,
    this._router,
  );

  final _parametersState = ValueNotifier<ParametersData?>(null);


  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _getCurrentDateParameters();
  }

  Future<void> _getCurrentDateParameters() async {
    await model.getCurrentDateParameters();
    _parametersState.value = model.parameters;
  }

  @override
  void closeScreen() {
    _router.pop();
  }

  @override
  void setHeight(int height) {
    model.parameters = model.parameters.copyWith(height: height);
    _parametersState.value = model.parameters;
  }

  @override
  void setWeight(double weight) {
    model.parameters = model.parameters.copyWith(weight: weight);
    _parametersState.value = model.parameters;
  }

  @override
  void setMuscles(double muscles) {
    model.parameters = model.parameters.copyWith(muscles: muscles);
    _parametersState.value = model.parameters;
  }

  @override
  void setPercentage(double percentage) {
    model.parameters = model.parameters.copyWith(percentage: percentage);
    _parametersState.value = model.parameters;
  }

  @override
  void setChestCircumference(int chestCircumference) {
    model.parameters = model.parameters.copyWith(chestCircumference: chestCircumference);
    _parametersState.value = model.parameters;
  }

  @override
  void setWaistCircumference(int waistCircumference) {
    model.parameters = model.parameters.copyWith(waistCircumference: waistCircumference);
    _parametersState.value = model.parameters;
  }

  @override
  void setHipCircumference(int hipCircumference) {
    model.parameters = model.parameters.copyWith(hipCircumference: hipCircumference);
    _parametersState.value = model.parameters;
  }

  @override
  void setNeckCircumference(int neckCircumference) {
    model.parameters = model.parameters.copyWith(neckCircumference: neckCircumference);
    _parametersState.value = model.parameters;
  }

  @override
  void setBicepsCircumference(int bicepsCircumference) {
    model.parameters = model.parameters.copyWith(bicepsCircumference: bicepsCircumference);
    _parametersState.value = model.parameters;
  }

  @override
  void setForearmCircumference(int forearmCircumference) {
    model.parameters = model.parameters.copyWith(forearmCircumference: forearmCircumference);
    _parametersState.value = model.parameters;
  }

  @override
  void setThighCircumference(int thighCircumference) {
    model.parameters = model.parameters.copyWith(thighCircumference: thighCircumference);
    _parametersState.value = model.parameters;
  }

  @override
  void setCalfCircumference(int calfCircumference) {
    model.parameters = model.parameters.copyWith(calfCircumference: calfCircumference);
    _parametersState.value = model.parameters;
  }

  @override
  Future<void> saveParameters() async {
    await model.saveParameters();
    final args = _router.current.args is StartMeasurementsRouterArgs  ? _router.current.args! as StartMeasurementsRouterArgs : null;
    if (args != null) {
      args.loadAgain.call();
    }
    _router.pop();
  }

  @override
  ValueNotifier<ParametersData?> get parametersState => _parametersState;
}

abstract interface class IStartMeasurementsScreenWidgetModel implements IWidgetModel {
  ValueNotifier<ParametersData?> get parametersState;

  void closeScreen();

  void setHeight(int height);

  void setWeight(double height);

  void setMuscles(double muscles);

  void setPercentage(double percentage);

  void setChestCircumference(int chestCircumference);

  void setWaistCircumference(int waistCircumference);

  void setHipCircumference(int hipCircumference);

  void setNeckCircumference(int neckCircumference);

  void setBicepsCircumference(int bicepsCircumference);

  void setForearmCircumference(int forearmCircumference);

  void setThighCircumference(int thighCircumference);

  void setCalfCircumference(int calfCircumference);

  Future<void> saveParameters();
}
