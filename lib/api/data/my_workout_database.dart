import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'my_workout_database.g.dart';

class MyWorkoutTable extends Table {
  IntColumn get workoutId => integer().autoIncrement()();

  TextColumn get workoutName => text()();

  TextColumn get exercisesIdList => text().map(const IntListConverter()).nullable()();
}

class IntListConverter extends TypeConverter<List<int>, String> {
  const IntListConverter();

  @override
  List<int> fromSql(String fromDb) {
    if (fromDb.isEmpty) {
      return [];
    }
    return fromDb.split(',').map(int.parse).toList();
  }

  @override
  String toSql(List<int> value) {
    if (value.isEmpty) {
      return '';
    }
    return value.join(',');
  }
}

@DriftDatabase(tables: [MyWorkoutTable])
class AppMyWorkoutDatabase extends _$AppMyWorkoutDatabase {
  AppMyWorkoutDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db1.sqlite12'));

    return NativeDatabase.createInBackground(file);
  });
}
