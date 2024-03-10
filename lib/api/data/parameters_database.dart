import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'parameters_database.g.dart';

class ParametersTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get height => integer()();

  RealColumn get weight => real()();

  RealColumn get percentage => real()();

  RealColumn get muscles => real()();

  IntColumn get chestCircumference => integer()();

  IntColumn get waistCircumference => integer()();

  IntColumn get hipCircumference => integer()();

  IntColumn get neckCircumference => integer()();

  IntColumn get bicepsCircumference => integer()();

  IntColumn get forearmCircumference => integer()();

  IntColumn get thighCircumference => integer()();

  IntColumn get calfCircumference => integer()();

  DateTimeColumn get parametersDate => dateTime().nullable()();
}

@DriftDatabase(tables: [ParametersTable])
class AppParametersDatabase extends _$AppParametersDatabase {
  AppParametersDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db1.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
