import 'package:workout/api/service/parameters_api.dart';
import 'package:workout/features/common/domain/data/parameters/parameters_data.dart';
import 'package:workout/features/common/domain/repository/mappers/parameters_mapper.dart';

class ParametersRepository {
  final ParametersApi _apiClient;

  ParametersRepository(this._apiClient);

  Future<List<ParametersData>> getParameters() async {
    final some = await _apiClient.getParameters();
    return mapDatabaseToParameters(some);
  }

  Future<void> addParameters(ParametersData data) async {
    await _apiClient.addParameters(data);
  }

  Future<void> editParameters(ParametersData data) async {
    await _apiClient.editParameters(data);
  }

  Future<void> deleteParameters(ParametersData data) async {
    await _apiClient.deleteParameters(data);
  }
  Future<void> deleteAllParameters() async {
    await _apiClient.deleteAllParameters();
  }

}
