import 'package:workout/features/common/domain/data/parameters/parameters_data.dart';
import 'package:workout/features/common/service/parameters_service.dart';
import 'package:elementary/elementary.dart';

class MeasurementLogScreenModel extends ElementaryModel {
  MeasurementLogScreenModel(this._parametersService) : super();
  final ParametersService _parametersService;
  int selectedIndex = 0;

  Future<List<ParametersData>> getParameters() async {
    final parameters = await _parametersService.getParameters();
    return parameters;
  }
}
