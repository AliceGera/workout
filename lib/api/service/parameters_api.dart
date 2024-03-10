import 'package:workout/api/data/parameters_database.dart';
import 'package:workout/features/common/domain/data/parameters/parameters_data.dart';
import 'package:drift/drift.dart';

class ParametersApi {
  ParametersApi(this.appDatabase);

  final AppParametersDatabase appDatabase;

  Future<List<ParametersTableData>> getParameters() async {
    return appDatabase.select(appDatabase.parametersTable).get();
  }

  Future<void> addParameters(ParametersData data) async {
    await appDatabase.into(appDatabase.parametersTable).insert(
          ParametersTableCompanion.insert(
            height: data.height,
            parametersDate: Value(data.parametersDate),
            weight: data.weight,
            muscles: data.muscles,
            percentage: data.percentage,
            chestCircumference: data.chestCircumference,
            waistCircumference: data.waistCircumference,
            hipCircumference: data.hipCircumference,
            neckCircumference: data.neckCircumference,
            bicepsCircumference: data.bicepsCircumference,
            forearmCircumference: data.forearmCircumference,
            thighCircumference: data.thighCircumference,
            calfCircumference: data.calfCircumference,
          ),
        );
  }

  Future<void> editParameters(ParametersData data) async {
    final resultTable = appDatabase.update(appDatabase.parametersTable)..where((t) => t.id.equals(data.id));
    await resultTable.write(
      ParametersTableCompanion.insert(
        height: data.height,
        parametersDate: Value(data.parametersDate),
        weight: data.weight,
        muscles: data.muscles,
        percentage: data.percentage,
        chestCircumference: data.chestCircumference,
        waistCircumference: data.waistCircumference,
        hipCircumference: data.hipCircumference,
        neckCircumference: data.neckCircumference,
        bicepsCircumference: data.bicepsCircumference,
        forearmCircumference: data.forearmCircumference,
        thighCircumference: data.thighCircumference,
        calfCircumference: data.calfCircumference,
      ),
    );
  }

  Future<void> deleteParameters(ParametersData data) async {
    final resultTable = appDatabase.delete(appDatabase.parametersTable)..where((t) => t.id.equals(data.id));
    await resultTable.go();
  }
  Future<void> deleteAllParameters() async {
    final resultTable = appDatabase.delete(appDatabase.parametersTable);
    await resultTable.go();
  }

}
