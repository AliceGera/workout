// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_database.dart';

// ignore_for_file: type=lint
class $ExerciseTableTable extends ExerciseTable
    with TableInfo<$ExerciseTableTable, ExerciseTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _exerciseIdMeta =
      const VerificationMeta('exerciseId');
  @override
  late final GeneratedColumn<int> exerciseId = GeneratedColumn<int>(
      'exercise_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _exerciseNameMeta =
      const VerificationMeta('exerciseName');
  @override
  late final GeneratedColumn<String> exerciseName = GeneratedColumn<String>(
      'exercise_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workingWeightMeta =
      const VerificationMeta('workingWeight');
  @override
  late final GeneratedColumn<String> workingWeight = GeneratedColumn<String>(
      'working_weight', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _repetitionsNumberMeta =
      const VerificationMeta('repetitionsNumber');
  @override
  late final GeneratedColumn<String> repetitionsNumber =
      GeneratedColumn<String>('repetitions_number', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exerciseLikeMeta =
      const VerificationMeta('exerciseLike');
  @override
  late final GeneratedColumn<bool> exerciseLike = GeneratedColumn<bool>(
      'exercise_like', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("exercise_like" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        exerciseId,
        exerciseName,
        workingWeight,
        repetitionsNumber,
        comment,
        exerciseLike
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_table';
  @override
  VerificationContext validateIntegrity(Insertable<ExerciseTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    }
    if (data.containsKey('exercise_name')) {
      context.handle(
          _exerciseNameMeta,
          exerciseName.isAcceptableOrUnknown(
              data['exercise_name']!, _exerciseNameMeta));
    } else if (isInserting) {
      context.missing(_exerciseNameMeta);
    }
    if (data.containsKey('working_weight')) {
      context.handle(
          _workingWeightMeta,
          workingWeight.isAcceptableOrUnknown(
              data['working_weight']!, _workingWeightMeta));
    } else if (isInserting) {
      context.missing(_workingWeightMeta);
    }
    if (data.containsKey('repetitions_number')) {
      context.handle(
          _repetitionsNumberMeta,
          repetitionsNumber.isAcceptableOrUnknown(
              data['repetitions_number']!, _repetitionsNumberMeta));
    } else if (isInserting) {
      context.missing(_repetitionsNumberMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    } else if (isInserting) {
      context.missing(_commentMeta);
    }
    if (data.containsKey('exercise_like')) {
      context.handle(
          _exerciseLikeMeta,
          exerciseLike.isAcceptableOrUnknown(
              data['exercise_like']!, _exerciseLikeMeta));
    } else if (isInserting) {
      context.missing(_exerciseLikeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {exerciseId};
  @override
  ExerciseTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseTableData(
      exerciseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_id'])!,
      exerciseName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_name'])!,
      workingWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}working_weight'])!,
      repetitionsNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}repetitions_number'])!,
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment'])!,
      exerciseLike: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}exercise_like'])!,
    );
  }

  @override
  $ExerciseTableTable createAlias(String alias) {
    return $ExerciseTableTable(attachedDatabase, alias);
  }
}

class ExerciseTableData extends DataClass
    implements Insertable<ExerciseTableData> {
  final int exerciseId;
  final String exerciseName;
  final String workingWeight;
  final String repetitionsNumber;
  final String comment;
  final bool exerciseLike;
  const ExerciseTableData(
      {required this.exerciseId,
      required this.exerciseName,
      required this.workingWeight,
      required this.repetitionsNumber,
      required this.comment,
      required this.exerciseLike});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['exercise_id'] = Variable<int>(exerciseId);
    map['exercise_name'] = Variable<String>(exerciseName);
    map['working_weight'] = Variable<String>(workingWeight);
    map['repetitions_number'] = Variable<String>(repetitionsNumber);
    map['comment'] = Variable<String>(comment);
    map['exercise_like'] = Variable<bool>(exerciseLike);
    return map;
  }

  ExerciseTableCompanion toCompanion(bool nullToAbsent) {
    return ExerciseTableCompanion(
      exerciseId: Value(exerciseId),
      exerciseName: Value(exerciseName),
      workingWeight: Value(workingWeight),
      repetitionsNumber: Value(repetitionsNumber),
      comment: Value(comment),
      exerciseLike: Value(exerciseLike),
    );
  }

  factory ExerciseTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseTableData(
      exerciseId: serializer.fromJson<int>(json['exerciseId']),
      exerciseName: serializer.fromJson<String>(json['exerciseName']),
      workingWeight: serializer.fromJson<String>(json['workingWeight']),
      repetitionsNumber: serializer.fromJson<String>(json['repetitionsNumber']),
      comment: serializer.fromJson<String>(json['comment']),
      exerciseLike: serializer.fromJson<bool>(json['exerciseLike']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'exerciseId': serializer.toJson<int>(exerciseId),
      'exerciseName': serializer.toJson<String>(exerciseName),
      'workingWeight': serializer.toJson<String>(workingWeight),
      'repetitionsNumber': serializer.toJson<String>(repetitionsNumber),
      'comment': serializer.toJson<String>(comment),
      'exerciseLike': serializer.toJson<bool>(exerciseLike),
    };
  }

  ExerciseTableData copyWith(
          {int? exerciseId,
          String? exerciseName,
          String? workingWeight,
          String? repetitionsNumber,
          String? comment,
          bool? exerciseLike}) =>
      ExerciseTableData(
        exerciseId: exerciseId ?? this.exerciseId,
        exerciseName: exerciseName ?? this.exerciseName,
        workingWeight: workingWeight ?? this.workingWeight,
        repetitionsNumber: repetitionsNumber ?? this.repetitionsNumber,
        comment: comment ?? this.comment,
        exerciseLike: exerciseLike ?? this.exerciseLike,
      );
  @override
  String toString() {
    return (StringBuffer('ExerciseTableData(')
          ..write('exerciseId: $exerciseId, ')
          ..write('exerciseName: $exerciseName, ')
          ..write('workingWeight: $workingWeight, ')
          ..write('repetitionsNumber: $repetitionsNumber, ')
          ..write('comment: $comment, ')
          ..write('exerciseLike: $exerciseLike')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(exerciseId, exerciseName, workingWeight,
      repetitionsNumber, comment, exerciseLike);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseTableData &&
          other.exerciseId == this.exerciseId &&
          other.exerciseName == this.exerciseName &&
          other.workingWeight == this.workingWeight &&
          other.repetitionsNumber == this.repetitionsNumber &&
          other.comment == this.comment &&
          other.exerciseLike == this.exerciseLike);
}

class ExerciseTableCompanion extends UpdateCompanion<ExerciseTableData> {
  final Value<int> exerciseId;
  final Value<String> exerciseName;
  final Value<String> workingWeight;
  final Value<String> repetitionsNumber;
  final Value<String> comment;
  final Value<bool> exerciseLike;
  const ExerciseTableCompanion({
    this.exerciseId = const Value.absent(),
    this.exerciseName = const Value.absent(),
    this.workingWeight = const Value.absent(),
    this.repetitionsNumber = const Value.absent(),
    this.comment = const Value.absent(),
    this.exerciseLike = const Value.absent(),
  });
  ExerciseTableCompanion.insert({
    this.exerciseId = const Value.absent(),
    required String exerciseName,
    required String workingWeight,
    required String repetitionsNumber,
    required String comment,
    required bool exerciseLike,
  })  : exerciseName = Value(exerciseName),
        workingWeight = Value(workingWeight),
        repetitionsNumber = Value(repetitionsNumber),
        comment = Value(comment),
        exerciseLike = Value(exerciseLike);
  static Insertable<ExerciseTableData> custom({
    Expression<int>? exerciseId,
    Expression<String>? exerciseName,
    Expression<String>? workingWeight,
    Expression<String>? repetitionsNumber,
    Expression<String>? comment,
    Expression<bool>? exerciseLike,
  }) {
    return RawValuesInsertable({
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (exerciseName != null) 'exercise_name': exerciseName,
      if (workingWeight != null) 'working_weight': workingWeight,
      if (repetitionsNumber != null) 'repetitions_number': repetitionsNumber,
      if (comment != null) 'comment': comment,
      if (exerciseLike != null) 'exercise_like': exerciseLike,
    });
  }

  ExerciseTableCompanion copyWith(
      {Value<int>? exerciseId,
      Value<String>? exerciseName,
      Value<String>? workingWeight,
      Value<String>? repetitionsNumber,
      Value<String>? comment,
      Value<bool>? exerciseLike}) {
    return ExerciseTableCompanion(
      exerciseId: exerciseId ?? this.exerciseId,
      exerciseName: exerciseName ?? this.exerciseName,
      workingWeight: workingWeight ?? this.workingWeight,
      repetitionsNumber: repetitionsNumber ?? this.repetitionsNumber,
      comment: comment ?? this.comment,
      exerciseLike: exerciseLike ?? this.exerciseLike,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (exerciseName.present) {
      map['exercise_name'] = Variable<String>(exerciseName.value);
    }
    if (workingWeight.present) {
      map['working_weight'] = Variable<String>(workingWeight.value);
    }
    if (repetitionsNumber.present) {
      map['repetitions_number'] = Variable<String>(repetitionsNumber.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (exerciseLike.present) {
      map['exercise_like'] = Variable<bool>(exerciseLike.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseTableCompanion(')
          ..write('exerciseId: $exerciseId, ')
          ..write('exerciseName: $exerciseName, ')
          ..write('workingWeight: $workingWeight, ')
          ..write('repetitionsNumber: $repetitionsNumber, ')
          ..write('comment: $comment, ')
          ..write('exerciseLike: $exerciseLike')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppExerciseDatabase extends GeneratedDatabase {
  _$AppExerciseDatabase(QueryExecutor e) : super(e);
  late final $ExerciseTableTable exerciseTable = $ExerciseTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [exerciseTable];
}
