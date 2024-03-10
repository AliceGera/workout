import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'exercise_database.g.dart';

class ExerciseTable extends Table {
  IntColumn get exerciseId => integer().autoIncrement()();
  TextColumn get exerciseName => text()();
  TextColumn get workingWeight => text()();
  TextColumn get repetitionsNumber => text()();
  TextColumn get comment => text()();
  BoolColumn get exerciseLike => boolean()();
}

@DriftDatabase(tables: [ExerciseTable])
class AppExerciseDatabase extends _$AppExerciseDatabase {
  AppExerciseDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite1'));

    return NativeDatabase.createInBackground(file);
  });
}
