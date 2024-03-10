import 'package:workout/features/common/domain/data/parameters/parameters_data.dart';
import 'package:workout/features/common/service/parameters_service.dart';
import 'package:elementary/elementary.dart';

class ParametersScreenModel extends ElementaryModel {
  ParametersScreenModel(this._parametersService) : super();
  final ParametersService _parametersService;

  Future<ParametersData?> getParameters() async {
    final parameters = await _parametersService.getParameters();
    return parameters.lastOrNull;
  }
}
