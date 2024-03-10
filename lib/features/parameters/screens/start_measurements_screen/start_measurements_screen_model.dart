import 'package:workout/features/common/domain/data/parameters/parameters_data.dart';
import 'package:workout/features/common/service/parameters_service.dart';
import 'package:collection/collection.dart';
import 'package:elementary/elementary.dart';
import 'package:weekly_date_picker/datetime_apis.dart';

class StartMeasurementsScreenModel extends ElementaryModel {
  StartMeasurementsScreenModel(this._parametersService) : super();
  final ParametersService _parametersService;

  ParametersData parameters = ParametersData.init();
  bool _isParametersExist = false;

  Future<void> saveParameters() async {
    if (_isParametersExist) {
      await _parametersService.editParameters(parameters);
    } else {
      await _parametersService.addParameters(parameters);
    }
  }

  Future<void> getCurrentDateParameters() async {
    final listParameters = await _parametersService.getParameters();
    final todayParameters = listParameters.firstWhereOrNull((e) => e.parametersDate?.isSameDateAs(parameters.parametersDate!) == true);
    if (todayParameters != null) {
      parameters = todayParameters;
      _isParametersExist = true;
    }
  }
}
