// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_database.dart';

// ignore_for_file: type=lint
class $RecordTableTable extends RecordTable
    with TableInfo<$RecordTableTable, RecordTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecordTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _recordWorkoutIdMeta =
      const VerificationMeta('recordWorkoutId');
  @override
  late final GeneratedColumn<int> recordWorkoutId = GeneratedColumn<int>(
      'record_workout_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _recordRepetitionMeta =
      const VerificationMeta('recordRepetition');
  @override
  late final GeneratedColumn<String> recordRepetition = GeneratedColumn<String>(
      'record_repetition', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recordWorkoutNameMeta =
      const VerificationMeta('recordWorkoutName');
  @override
  late final GeneratedColumn<String> recordWorkoutName =
      GeneratedColumn<String>('record_workout_name', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recordDateMeta =
      const VerificationMeta('recordDate');
  @override
  late final GeneratedColumn<DateTime> recordDate = GeneratedColumn<DateTime>(
      'record_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _recordTimeMeta =
      const VerificationMeta('recordTime');
  @override
  late final GeneratedColumn<DateTime> recordTime = GeneratedColumn<DateTime>(
      'record_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        recordWorkoutId,
        recordRepetition,
        recordWorkoutName,
        recordDate,
        recordTime
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'record_table';
  @override
  VerificationContext validateIntegrity(Insertable<RecordTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('record_workout_id')) {
      context.handle(
          _recordWorkoutIdMeta,
          recordWorkoutId.isAcceptableOrUnknown(
              data['record_workout_id']!, _recordWorkoutIdMeta));
    } else if (isInserting) {
      context.missing(_recordWorkoutIdMeta);
    }
    if (data.containsKey('record_repetition')) {
      context.handle(
          _recordRepetitionMeta,
          recordRepetition.isAcceptableOrUnknown(
              data['record_repetition']!, _recordRepetitionMeta));
    } else if (isInserting) {
      context.missing(_recordRepetitionMeta);
    }
    if (data.containsKey('record_workout_name')) {
      context.handle(
          _recordWorkoutNameMeta,
          recordWorkoutName.isAcceptableOrUnknown(
              data['record_workout_name']!, _recordWorkoutNameMeta));
    } else if (isInserting) {
      context.missing(_recordWorkoutNameMeta);
    }
    if (data.containsKey('record_date')) {
      context.handle(
          _recordDateMeta,
          recordDate.isAcceptableOrUnknown(
              data['record_date']!, _recordDateMeta));
    } else if (isInserting) {
      context.missing(_recordDateMeta);
    }
    if (data.containsKey('record_time')) {
      context.handle(
          _recordTimeMeta,
          recordTime.isAcceptableOrUnknown(
              data['record_time']!, _recordTimeMeta));
    } else if (isInserting) {
      context.missing(_recordTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecordTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecordTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      recordWorkoutId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}record_workout_id'])!,
      recordRepetition: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}record_repetition'])!,
      recordWorkoutName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}record_workout_name'])!,
      recordDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}record_date'])!,
      recordTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}record_time'])!,
    );
  }

  @override
  $RecordTableTable createAlias(String alias) {
    return $RecordTableTable(attachedDatabase, alias);
  }
}

class RecordTableData extends DataClass implements Insertable<RecordTableData> {
  final int id;
  final int recordWorkoutId;
  final String recordRepetition;
  final String recordWorkoutName;
  final DateTime recordDate;
  final DateTime recordTime;
  const RecordTableData(
      {required this.id,
      required this.recordWorkoutId,
      required this.recordRepetition,
      required this.recordWorkoutName,
      required this.recordDate,
      required this.recordTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['record_workout_id'] = Variable<int>(recordWorkoutId);
    map['record_repetition'] = Variable<String>(recordRepetition);
    map['record_workout_name'] = Variable<String>(recordWorkoutName);
    map['record_date'] = Variable<DateTime>(recordDate);
    map['record_time'] = Variable<DateTime>(recordTime);
    return map;
  }

  RecordTableCompanion toCompanion(bool nullToAbsent) {
    return RecordTableCompanion(
      id: Value(id),
      recordWorkoutId: Value(recordWorkoutId),
      recordRepetition: Value(recordRepetition),
      recordWorkoutName: Value(recordWorkoutName),
      recordDate: Value(recordDate),
      recordTime: Value(recordTime),
    );
  }

  factory RecordTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecordTableData(
      id: serializer.fromJson<int>(json['id']),
      recordWorkoutId: serializer.fromJson<int>(json['recordWorkoutId']),
      recordRepetition: serializer.fromJson<String>(json['recordRepetition']),
      recordWorkoutName: serializer.fromJson<String>(json['recordWorkoutName']),
      recordDate: serializer.fromJson<DateTime>(json['recordDate']),
      recordTime: serializer.fromJson<DateTime>(json['recordTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recordWorkoutId': serializer.toJson<int>(recordWorkoutId),
      'recordRepetition': serializer.toJson<String>(recordRepetition),
      'recordWorkoutName': serializer.toJson<String>(recordWorkoutName),
      'recordDate': serializer.toJson<DateTime>(recordDate),
      'recordTime': serializer.toJson<DateTime>(recordTime),
    };
  }

  RecordTableData copyWith(
          {int? id,
          int? recordWorkoutId,
          String? recordRepetition,
          String? recordWorkoutName,
          DateTime? recordDate,
          DateTime? recordTime}) =>
      RecordTableData(
        id: id ?? this.id,
        recordWorkoutId: recordWorkoutId ?? this.recordWorkoutId,
        recordRepetition: recordRepetition ?? this.recordRepetition,
        recordWorkoutName: recordWorkoutName ?? this.recordWorkoutName,
        recordDate: recordDate ?? this.recordDate,
        recordTime: recordTime ?? this.recordTime,
      );
  @override
  String toString() {
    return (StringBuffer('RecordTableData(')
          ..write('id: $id, ')
          ..write('recordWorkoutId: $recordWorkoutId, ')
          ..write('recordRepetition: $recordRepetition, ')
          ..write('recordWorkoutName: $recordWorkoutName, ')
          ..write('recordDate: $recordDate, ')
          ..write('recordTime: $recordTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, recordWorkoutId, recordRepetition,
      recordWorkoutName, recordDate, recordTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecordTableData &&
          other.id == this.id &&
          other.recordWorkoutId == this.recordWorkoutId &&
          other.recordRepetition == this.recordRepetition &&
          other.recordWorkoutName == this.recordWorkoutName &&
          other.recordDate == this.recordDate &&
          other.recordTime == this.recordTime);
}

class RecordTableCompanion extends UpdateCompanion<RecordTableData> {
  final Value<int> id;
  final Value<int> recordWorkoutId;
  final Value<String> recordRepetition;
  final Value<String> recordWorkoutName;
  final Value<DateTime> recordDate;
  final Value<DateTime> recordTime;
  const RecordTableCompanion({
    this.id = const Value.absent(),
    this.recordWorkoutId = const Value.absent(),
    this.recordRepetition = const Value.absent(),
    this.recordWorkoutName = const Value.absent(),
    this.recordDate = const Value.absent(),
    this.recordTime = const Value.absent(),
  });
  RecordTableCompanion.insert({
    this.id = const Value.absent(),
    required int recordWorkoutId,
    required String recordRepetition,
    required String recordWorkoutName,
    required DateTime recordDate,
    required DateTime recordTime,
  })  : recordWorkoutId = Value(recordWorkoutId),
        recordRepetition = Value(recordRepetition),
        recordWorkoutName = Value(recordWorkoutName),
        recordDate = Value(recordDate),
        recordTime = Value(recordTime);
  static Insertable<RecordTableData> custom({
    Expression<int>? id,
    Expression<int>? recordWorkoutId,
    Expression<String>? recordRepetition,
    Expression<String>? recordWorkoutName,
    Expression<DateTime>? recordDate,
    Expression<DateTime>? recordTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recordWorkoutId != null) 'record_workout_id': recordWorkoutId,
      if (recordRepetition != null) 'record_repetition': recordRepetition,
      if (recordWorkoutName != null) 'record_workout_name': recordWorkoutName,
      if (recordDate != null) 'record_date': recordDate,
      if (recordTime != null) 'record_time': recordTime,
    });
  }

  RecordTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? recordWorkoutId,
      Value<String>? recordRepetition,
      Value<String>? recordWorkoutName,
      Value<DateTime>? recordDate,
      Value<DateTime>? recordTime}) {
    return RecordTableCompanion(
      id: id ?? this.id,
      recordWorkoutId: recordWorkoutId ?? this.recordWorkoutId,
      recordRepetition: recordRepetition ?? this.recordRepetition,
      recordWorkoutName: recordWorkoutName ?? this.recordWorkoutName,
      recordDate: recordDate ?? this.recordDate,
      recordTime: recordTime ?? this.recordTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recordWorkoutId.present) {
      map['record_workout_id'] = Variable<int>(recordWorkoutId.value);
    }
    if (recordRepetition.present) {
      map['record_repetition'] = Variable<String>(recordRepetition.value);
    }
    if (recordWorkoutName.present) {
      map['record_workout_name'] = Variable<String>(recordWorkoutName.value);
    }
    if (recordDate.present) {
      map['record_date'] = Variable<DateTime>(recordDate.value);
    }
    if (recordTime.present) {
      map['record_time'] = Variable<DateTime>(recordTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordTableCompanion(')
          ..write('id: $id, ')
          ..write('recordWorkoutId: $recordWorkoutId, ')
          ..write('recordRepetition: $recordRepetition, ')
          ..write('recordWorkoutName: $recordWorkoutName, ')
          ..write('recordDate: $recordDate, ')
          ..write('recordTime: $recordTime')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppRecordDatabase extends GeneratedDatabase {
  _$AppRecordDatabase(QueryExecutor e) : super(e);
  late final $RecordTableTable recordTable = $RecordTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [recordTable];
}
