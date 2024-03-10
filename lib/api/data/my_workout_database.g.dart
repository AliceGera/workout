// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_workout_database.dart';

// ignore_for_file: type=lint
class $MyWorkoutTableTable extends MyWorkoutTable
    with TableInfo<$MyWorkoutTableTable, MyWorkoutTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MyWorkoutTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _workoutIdMeta =
      const VerificationMeta('workoutId');
  @override
  late final GeneratedColumn<int> workoutId = GeneratedColumn<int>(
      'workout_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _workoutNameMeta =
      const VerificationMeta('workoutName');
  @override
  late final GeneratedColumn<String> workoutName = GeneratedColumn<String>(
      'workout_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exercisesIdListMeta =
      const VerificationMeta('exercisesIdList');
  @override
  late final GeneratedColumnWithTypeConverter<List<int>?, String>
      exercisesIdList = GeneratedColumn<String>(
              'exercises_id_list', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<int>?>(
              $MyWorkoutTableTable.$converterexercisesIdListn);
  @override
  List<GeneratedColumn> get $columns =>
      [workoutId, workoutName, exercisesIdList];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'my_workout_table';
  @override
  VerificationContext validateIntegrity(Insertable<MyWorkoutTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('workout_id')) {
      context.handle(_workoutIdMeta,
          workoutId.isAcceptableOrUnknown(data['workout_id']!, _workoutIdMeta));
    }
    if (data.containsKey('workout_name')) {
      context.handle(
          _workoutNameMeta,
          workoutName.isAcceptableOrUnknown(
              data['workout_name']!, _workoutNameMeta));
    } else if (isInserting) {
      context.missing(_workoutNameMeta);
    }
    context.handle(_exercisesIdListMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {workoutId};
  @override
  MyWorkoutTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MyWorkoutTableData(
      workoutId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}workout_id'])!,
      workoutName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}workout_name'])!,
      exercisesIdList: $MyWorkoutTableTable.$converterexercisesIdListn.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}exercises_id_list'])),
    );
  }

  @override
  $MyWorkoutTableTable createAlias(String alias) {
    return $MyWorkoutTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<int>, String> $converterexercisesIdList =
      const IntListConverter();
  static TypeConverter<List<int>?, String?> $converterexercisesIdListn =
      NullAwareTypeConverter.wrap($converterexercisesIdList);
}

class MyWorkoutTableData extends DataClass
    implements Insertable<MyWorkoutTableData> {
  final int workoutId;
  final String workoutName;
  final List<int>? exercisesIdList;
  const MyWorkoutTableData(
      {required this.workoutId,
      required this.workoutName,
      this.exercisesIdList});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['workout_id'] = Variable<int>(workoutId);
    map['workout_name'] = Variable<String>(workoutName);
    if (!nullToAbsent || exercisesIdList != null) {
      map['exercises_id_list'] = Variable<String>($MyWorkoutTableTable
          .$converterexercisesIdListn
          .toSql(exercisesIdList));
    }
    return map;
  }

  MyWorkoutTableCompanion toCompanion(bool nullToAbsent) {
    return MyWorkoutTableCompanion(
      workoutId: Value(workoutId),
      workoutName: Value(workoutName),
      exercisesIdList: exercisesIdList == null && nullToAbsent
          ? const Value.absent()
          : Value(exercisesIdList),
    );
  }

  factory MyWorkoutTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MyWorkoutTableData(
      workoutId: serializer.fromJson<int>(json['workoutId']),
      workoutName: serializer.fromJson<String>(json['workoutName']),
      exercisesIdList: serializer.fromJson<List<int>?>(json['exercisesIdList']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'workoutId': serializer.toJson<int>(workoutId),
      'workoutName': serializer.toJson<String>(workoutName),
      'exercisesIdList': serializer.toJson<List<int>?>(exercisesIdList),
    };
  }

  MyWorkoutTableData copyWith(
          {int? workoutId,
          String? workoutName,
          Value<List<int>?> exercisesIdList = const Value.absent()}) =>
      MyWorkoutTableData(
        workoutId: workoutId ?? this.workoutId,
        workoutName: workoutName ?? this.workoutName,
        exercisesIdList: exercisesIdList.present
            ? exercisesIdList.value
            : this.exercisesIdList,
      );
  @override
  String toString() {
    return (StringBuffer('MyWorkoutTableData(')
          ..write('workoutId: $workoutId, ')
          ..write('workoutName: $workoutName, ')
          ..write('exercisesIdList: $exercisesIdList')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(workoutId, workoutName, exercisesIdList);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyWorkoutTableData &&
          other.workoutId == this.workoutId &&
          other.workoutName == this.workoutName &&
          other.exercisesIdList == this.exercisesIdList);
}

class MyWorkoutTableCompanion extends UpdateCompanion<MyWorkoutTableData> {
  final Value<int> workoutId;
  final Value<String> workoutName;
  final Value<List<int>?> exercisesIdList;
  const MyWorkoutTableCompanion({
    this.workoutId = const Value.absent(),
    this.workoutName = const Value.absent(),
    this.exercisesIdList = const Value.absent(),
  });
  MyWorkoutTableCompanion.insert({
    this.workoutId = const Value.absent(),
    required String workoutName,
    this.exercisesIdList = const Value.absent(),
  }) : workoutName = Value(workoutName);
  static Insertable<MyWorkoutTableData> custom({
    Expression<int>? workoutId,
    Expression<String>? workoutName,
    Expression<String>? exercisesIdList,
  }) {
    return RawValuesInsertable({
      if (workoutId != null) 'workout_id': workoutId,
      if (workoutName != null) 'workout_name': workoutName,
      if (exercisesIdList != null) 'exercises_id_list': exercisesIdList,
    });
  }

  MyWorkoutTableCompanion copyWith(
      {Value<int>? workoutId,
      Value<String>? workoutName,
      Value<List<int>?>? exercisesIdList}) {
    return MyWorkoutTableCompanion(
      workoutId: workoutId ?? this.workoutId,
      workoutName: workoutName ?? this.workoutName,
      exercisesIdList: exercisesIdList ?? this.exercisesIdList,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (workoutId.present) {
      map['workout_id'] = Variable<int>(workoutId.value);
    }
    if (workoutName.present) {
      map['workout_name'] = Variable<String>(workoutName.value);
    }
    if (exercisesIdList.present) {
      map['exercises_id_list'] = Variable<String>($MyWorkoutTableTable
          .$converterexercisesIdListn
          .toSql(exercisesIdList.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyWorkoutTableCompanion(')
          ..write('workoutId: $workoutId, ')
          ..write('workoutName: $workoutName, ')
          ..write('exercisesIdList: $exercisesIdList')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppMyWorkoutDatabase extends GeneratedDatabase {
  _$AppMyWorkoutDatabase(QueryExecutor e) : super(e);
  late final $MyWorkoutTableTable myWorkoutTable = $MyWorkoutTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [myWorkoutTable];
}
