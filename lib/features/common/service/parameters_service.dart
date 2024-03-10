import 'package:workout/features/common/domain/data/parameters/parameters_data.dart';
import 'package:workout/features/common/domain/repository/parameters_repository.dart';

class ParametersService {
  final ParametersRepository _parametersRepository;

  ParametersService(this._parametersRepository);

  Future<List<ParametersData>> getParameters() async {
    return _parametersRepository.getParameters();
  }

  Future<void> addParameters(ParametersData data) async {
    await _parametersRepository.addParameters(data);
  }

  Future<void> deleteParameters(ParametersData data) async {
    await _parametersRepository.deleteParameters(data);
  }
  Future<void> deleteAllParameters() async {
    await _parametersRepository.deleteAllParameters();
  }
  Future<void> editParameters(ParametersData data) async {
    await _parametersRepository.editParameters(data);
  }
}
