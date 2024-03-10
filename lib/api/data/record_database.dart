import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'record_database.g.dart';

class RecordTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get recordWorkoutId => integer()();
  TextColumn get recordRepetition => text()();
  TextColumn get recordWorkoutName=> text()();
  DateTimeColumn get recordDate => dateTime()();
  DateTimeColumn get recordTime => dateTime()();
}

@DriftDatabase(tables: [RecordTable])
class AppRecordDatabase extends _$AppRecordDatabase {
  AppRecordDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db134.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
