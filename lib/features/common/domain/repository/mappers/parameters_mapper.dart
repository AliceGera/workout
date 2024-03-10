import 'package:workout/api/data/parameters_database.dart';
import 'package:workout/features/common/domain/data/parameters/parameters_data.dart';

List<ParametersData> mapDatabaseToParameters(List<ParametersTableData> parametersTable) {
  return parametersTable
      .map(
        (e) =>
        ParametersData(
          id: e.id,
          height: e.height,
          parametersDate: e.parametersDate,
          weight: e.weight,
          muscles: e.muscles,
          percentage: e.percentage,
          chestCircumference: e.chestCircumference,
          waistCircumference: e.waistCircumference,
          hipCircumference: e.hipCircumference,
          neckCircumference: e.neckCircumference,
          bicepsCircumference: e.bicepsCircumference,
          forearmCircumference: e.forearmCircumference,
          thighCircumference: e.thighCircumference,
          calfCircumference: e.calfCircumference,
        ),
  )
      .toList();
}