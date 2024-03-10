// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameters_database.dart';

// ignore_for_file: type=lint
class $ParametersTableTable extends ParametersTable
    with TableInfo<$ParametersTableTable, ParametersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParametersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
      'height', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _percentageMeta =
      const VerificationMeta('percentage');
  @override
  late final GeneratedColumn<double> percentage = GeneratedColumn<double>(
      'percentage', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _musclesMeta =
      const VerificationMeta('muscles');
  @override
  late final GeneratedColumn<double> muscles = GeneratedColumn<double>(
      'muscles', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _chestCircumferenceMeta =
      const VerificationMeta('chestCircumference');
  @override
  late final GeneratedColumn<int> chestCircumference = GeneratedColumn<int>(
      'chest_circumference', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _waistCircumferenceMeta =
      const VerificationMeta('waistCircumference');
  @override
  late final GeneratedColumn<int> waistCircumference = GeneratedColumn<int>(
      'waist_circumference', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _hipCircumferenceMeta =
      const VerificationMeta('hipCircumference');
  @override
  late final GeneratedColumn<int> hipCircumference = GeneratedColumn<int>(
      'hip_circumference', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _neckCircumferenceMeta =
      const VerificationMeta('neckCircumference');
  @override
  late final GeneratedColumn<int> neckCircumference = GeneratedColumn<int>(
      'neck_circumference', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _bicepsCircumferenceMeta =
      const VerificationMeta('bicepsCircumference');
  @override
  late final GeneratedColumn<int> bicepsCircumference = GeneratedColumn<int>(
      'biceps_circumference', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _forearmCircumferenceMeta =
      const VerificationMeta('forearmCircumference');
  @override
  late final GeneratedColumn<int> forearmCircumference = GeneratedColumn<int>(
      'forearm_circumference', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _thighCircumferenceMeta =
      const VerificationMeta('thighCircumference');
  @override
  late final GeneratedColumn<int> thighCircumference = GeneratedColumn<int>(
      'thigh_circumference', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _calfCircumferenceMeta =
      const VerificationMeta('calfCircumference');
  @override
  late final GeneratedColumn<int> calfCircumference = GeneratedColumn<int>(
      'calf_circumference', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _parametersDateMeta =
      const VerificationMeta('parametersDate');
  @override
  late final GeneratedColumn<DateTime> parametersDate =
      GeneratedColumn<DateTime>('parameters_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        height,
        weight,
        percentage,
        muscles,
        chestCircumference,
        waistCircumference,
        hipCircumference,
        neckCircumference,
        bicepsCircumference,
        forearmCircumference,
        thighCircumference,
        calfCircumference,
        parametersDate
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parameters_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ParametersTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('percentage')) {
      context.handle(
          _percentageMeta,
          percentage.isAcceptableOrUnknown(
              data['percentage']!, _percentageMeta));
    } else if (isInserting) {
      context.missing(_percentageMeta);
    }
    if (data.containsKey('muscles')) {
      context.handle(_musclesMeta,
          muscles.isAcceptableOrUnknown(data['muscles']!, _musclesMeta));
    } else if (isInserting) {
      context.missing(_musclesMeta);
    }
    if (data.containsKey('chest_circumference')) {
      context.handle(
          _chestCircumferenceMeta,
          chestCircumference.isAcceptableOrUnknown(
              data['chest_circumference']!, _chestCircumferenceMeta));
    } else if (isInserting) {
      context.missing(_chestCircumferenceMeta);
    }
    if (data.containsKey('waist_circumference')) {
      context.handle(
          _waistCircumferenceMeta,
          waistCircumference.isAcceptableOrUnknown(
              data['waist_circumference']!, _waistCircumferenceMeta));
    } else if (isInserting) {
      context.missing(_waistCircumferenceMeta);
    }
    if (data.containsKey('hip_circumference')) {
      context.handle(
          _hipCircumferenceMeta,
          hipCircumference.isAcceptableOrUnknown(
              data['hip_circumference']!, _hipCircumferenceMeta));
    } else if (isInserting) {
      context.missing(_hipCircumferenceMeta);
    }
    if (data.containsKey('neck_circumference')) {
      context.handle(
          _neckCircumferenceMeta,
          neckCircumference.isAcceptableOrUnknown(
              data['neck_circumference']!, _neckCircumferenceMeta));
    } else if (isInserting) {
      context.missing(_neckCircumferenceMeta);
    }
    if (data.containsKey('biceps_circumference')) {
      context.handle(
          _bicepsCircumferenceMeta,
          bicepsCircumference.isAcceptableOrUnknown(
              data['biceps_circumference']!, _bicepsCircumferenceMeta));
    } else if (isInserting) {
      context.missing(_bicepsCircumferenceMeta);
    }
    if (data.containsKey('forearm_circumference')) {
      context.handle(
          _forearmCircumferenceMeta,
          forearmCircumference.isAcceptableOrUnknown(
              data['forearm_circumference']!, _forearmCircumferenceMeta));
    } else if (isInserting) {
      context.missing(_forearmCircumferenceMeta);
    }
    if (data.containsKey('thigh_circumference')) {
      context.handle(
          _thighCircumferenceMeta,
          thighCircumference.isAcceptableOrUnknown(
              data['thigh_circumference']!, _thighCircumferenceMeta));
    } else if (isInserting) {
      context.missing(_thighCircumferenceMeta);
    }
    if (data.containsKey('calf_circumference')) {
      context.handle(
          _calfCircumferenceMeta,
          calfCircumference.isAcceptableOrUnknown(
              data['calf_circumference']!, _calfCircumferenceMeta));
    } else if (isInserting) {
      context.missing(_calfCircumferenceMeta);
    }
    if (data.containsKey('parameters_date')) {
      context.handle(
          _parametersDateMeta,
          parametersDate.isAcceptableOrUnknown(
              data['parameters_date']!, _parametersDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ParametersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ParametersTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}height'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      percentage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}percentage'])!,
      muscles: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}muscles'])!,
      chestCircumference: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}chest_circumference'])!,
      waistCircumference: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}waist_circumference'])!,
      hipCircumference: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hip_circumference'])!,
      neckCircumference: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}neck_circumference'])!,
      bicepsCircumference: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}biceps_circumference'])!,
      forearmCircumference: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}forearm_circumference'])!,
      thighCircumference: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}thigh_circumference'])!,
      calfCircumference: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}calf_circumference'])!,
      parametersDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}parameters_date']),
    );
  }

  @override
  $ParametersTableTable createAlias(String alias) {
    return $ParametersTableTable(attachedDatabase, alias);
  }
}

class ParametersTableData extends DataClass
    implements Insertable<ParametersTableData> {
  final int id;
  final int height;
  final double weight;
  final double percentage;
  final double muscles;
  final int chestCircumference;
  final int waistCircumference;
  final int hipCircumference;
  final int neckCircumference;
  final int bicepsCircumference;
  final int forearmCircumference;
  final int thighCircumference;
  final int calfCircumference;
  final DateTime? parametersDate;
  const ParametersTableData(
      {required this.id,
      required this.height,
      required this.weight,
      required this.percentage,
      required this.muscles,
      required this.chestCircumference,
      required this.waistCircumference,
      required this.hipCircumference,
      required this.neckCircumference,
      required this.bicepsCircumference,
      required this.forearmCircumference,
      required this.thighCircumference,
      required this.calfCircumference,
      this.parametersDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['height'] = Variable<int>(height);
    map['weight'] = Variable<double>(weight);
    map['percentage'] = Variable<double>(percentage);
    map['muscles'] = Variable<double>(muscles);
    map['chest_circumference'] = Variable<int>(chestCircumference);
    map['waist_circumference'] = Variable<int>(waistCircumference);
    map['hip_circumference'] = Variable<int>(hipCircumference);
    map['neck_circumference'] = Variable<int>(neckCircumference);
    map['biceps_circumference'] = Variable<int>(bicepsCircumference);
    map['forearm_circumference'] = Variable<int>(forearmCircumference);
    map['thigh_circumference'] = Variable<int>(thighCircumference);
    map['calf_circumference'] = Variable<int>(calfCircumference);
    if (!nullToAbsent || parametersDate != null) {
      map['parameters_date'] = Variable<DateTime>(parametersDate);
    }
    return map;
  }

  ParametersTableCompanion toCompanion(bool nullToAbsent) {
    return ParametersTableCompanion(
      id: Value(id),
      height: Value(height),
      weight: Value(weight),
      percentage: Value(percentage),
      muscles: Value(muscles),
      chestCircumference: Value(chestCircumference),
      waistCircumference: Value(waistCircumference),
      hipCircumference: Value(hipCircumference),
      neckCircumference: Value(neckCircumference),
      bicepsCircumference: Value(bicepsCircumference),
      forearmCircumference: Value(forearmCircumference),
      thighCircumference: Value(thighCircumference),
      calfCircumference: Value(calfCircumference),
      parametersDate: parametersDate == null && nullToAbsent
          ? const Value.absent()
          : Value(parametersDate),
    );
  }

  factory ParametersTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ParametersTableData(
      id: serializer.fromJson<int>(json['id']),
      height: serializer.fromJson<int>(json['height']),
      weight: serializer.fromJson<double>(json['weight']),
      percentage: serializer.fromJson<double>(json['percentage']),
      muscles: serializer.fromJson<double>(json['muscles']),
      chestCircumference: serializer.fromJson<int>(json['chestCircumference']),
      waistCircumference: serializer.fromJson<int>(json['waistCircumference']),
      hipCircumference: serializer.fromJson<int>(json['hipCircumference']),
      neckCircumference: serializer.fromJson<int>(json['neckCircumference']),
      bicepsCircumference:
          serializer.fromJson<int>(json['bicepsCircumference']),
      forearmCircumference:
          serializer.fromJson<int>(json['forearmCircumference']),
      thighCircumference: serializer.fromJson<int>(json['thighCircumference']),
      calfCircumference: serializer.fromJson<int>(json['calfCircumference']),
      parametersDate: serializer.fromJson<DateTime?>(json['parametersDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'height': serializer.toJson<int>(height),
      'weight': serializer.toJson<double>(weight),
      'percentage': serializer.toJson<double>(percentage),
      'muscles': serializer.toJson<double>(muscles),
      'chestCircumference': serializer.toJson<int>(chestCircumference),
      'waistCircumference': serializer.toJson<int>(waistCircumference),
      'hipCircumference': serializer.toJson<int>(hipCircumference),
      'neckCircumference': serializer.toJson<int>(neckCircumference),
      'bicepsCircumference': serializer.toJson<int>(bicepsCircumference),
      'forearmCircumference': serializer.toJson<int>(forearmCircumference),
      'thighCircumference': serializer.toJson<int>(thighCircumference),
      'calfCircumference': serializer.toJson<int>(calfCircumference),
      'parametersDate': serializer.toJson<DateTime?>(parametersDate),
    };
  }

  ParametersTableData copyWith(
          {int? id,
          int? height,
          double? weight,
          double? percentage,
          double? muscles,
          int? chestCircumference,
          int? waistCircumference,
          int? hipCircumference,
          int? neckCircumference,
          int? bicepsCircumference,
          int? forearmCircumference,
          int? thighCircumference,
          int? calfCircumference,
          Value<DateTime?> parametersDate = const Value.absent()}) =>
      ParametersTableData(
        id: id ?? this.id,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        percentage: percentage ?? this.percentage,
        muscles: muscles ?? this.muscles,
        chestCircumference: chestCircumference ?? this.chestCircumference,
        waistCircumference: waistCircumference ?? this.waistCircumference,
        hipCircumference: hipCircumference ?? this.hipCircumference,
        neckCircumference: neckCircumference ?? this.neckCircumference,
        bicepsCircumference: bicepsCircumference ?? this.bicepsCircumference,
        forearmCircumference: forearmCircumference ?? this.forearmCircumference,
        thighCircumference: thighCircumference ?? this.thighCircumference,
        calfCircumference: calfCircumference ?? this.calfCircumference,
        parametersDate:
            parametersDate.present ? parametersDate.value : this.parametersDate,
      );
  @override
  String toString() {
    return (StringBuffer('ParametersTableData(')
          ..write('id: $id, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('percentage: $percentage, ')
          ..write('muscles: $muscles, ')
          ..write('chestCircumference: $chestCircumference, ')
          ..write('waistCircumference: $waistCircumference, ')
          ..write('hipCircumference: $hipCircumference, ')
          ..write('neckCircumference: $neckCircumference, ')
          ..write('bicepsCircumference: $bicepsCircumference, ')
          ..write('forearmCircumference: $forearmCircumference, ')
          ..write('thighCircumference: $thighCircumference, ')
          ..write('calfCircumference: $calfCircumference, ')
          ..write('parametersDate: $parametersDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      height,
      weight,
      percentage,
      muscles,
      chestCircumference,
      waistCircumference,
      hipCircumference,
      neckCircumference,
      bicepsCircumference,
      forearmCircumference,
      thighCircumference,
      calfCircumference,
      parametersDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParametersTableData &&
          other.id == this.id &&
          other.height == this.height &&
          other.weight == this.weight &&
          other.percentage == this.percentage &&
          other.muscles == this.muscles &&
          other.chestCircumference == this.chestCircumference &&
          other.waistCircumference == this.waistCircumference &&
          other.hipCircumference == this.hipCircumference &&
          other.neckCircumference == this.neckCircumference &&
          other.bicepsCircumference == this.bicepsCircumference &&
          other.forearmCircumference == this.forearmCircumference &&
          other.thighCircumference == this.thighCircumference &&
          other.calfCircumference == this.calfCircumference &&
          other.parametersDate == this.parametersDate);
}

class ParametersTableCompanion extends UpdateCompanion<ParametersTableData> {
  final Value<int> id;
  final Value<int> height;
  final Value<double> weight;
  final Value<double> percentage;
  final Value<double> muscles;
  final Value<int> chestCircumference;
  final Value<int> waistCircumference;
  final Value<int> hipCircumference;
  final Value<int> neckCircumference;
  final Value<int> bicepsCircumference;
  final Value<int> forearmCircumference;
  final Value<int> thighCircumference;
  final Value<int> calfCircumference;
  final Value<DateTime?> parametersDate;
  const ParametersTableCompanion({
    this.id = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.percentage = const Value.absent(),
    this.muscles = const Value.absent(),
    this.chestCircumference = const Value.absent(),
    this.waistCircumference = const Value.absent(),
    this.hipCircumference = const Value.absent(),
    this.neckCircumference = const Value.absent(),
    this.bicepsCircumference = const Value.absent(),
    this.forearmCircumference = const Value.absent(),
    this.thighCircumference = const Value.absent(),
    this.calfCircumference = const Value.absent(),
    this.parametersDate = const Value.absent(),
  });
  ParametersTableCompanion.insert({
    this.id = const Value.absent(),
    required int height,
    required double weight,
    required double percentage,
    required double muscles,
    required int chestCircumference,
    required int waistCircumference,
    required int hipCircumference,
    required int neckCircumference,
    required int bicepsCircumference,
    required int forearmCircumference,
    required int thighCircumference,
    required int calfCircumference,
    this.parametersDate = const Value.absent(),
  })  : height = Value(height),
        weight = Value(weight),
        percentage = Value(percentage),
        muscles = Value(muscles),
        chestCircumference = Value(chestCircumference),
        waistCircumference = Value(waistCircumference),
        hipCircumference = Value(hipCircumference),
        neckCircumference = Value(neckCircumference),
        bicepsCircumference = Value(bicepsCircumference),
        forearmCircumference = Value(forearmCircumference),
        thighCircumference = Value(thighCircumference),
        calfCircumference = Value(calfCircumference);
  static Insertable<ParametersTableData> custom({
    Expression<int>? id,
    Expression<int>? height,
    Expression<double>? weight,
    Expression<double>? percentage,
    Expression<double>? muscles,
    Expression<int>? chestCircumference,
    Expression<int>? waistCircumference,
    Expression<int>? hipCircumference,
    Expression<int>? neckCircumference,
    Expression<int>? bicepsCircumference,
    Expression<int>? forearmCircumference,
    Expression<int>? thighCircumference,
    Expression<int>? calfCircumference,
    Expression<DateTime>? parametersDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
      if (percentage != null) 'percentage': percentage,
      if (muscles != null) 'muscles': muscles,
      if (chestCircumference != null) 'chest_circumference': chestCircumference,
      if (waistCircumference != null) 'waist_circumference': waistCircumference,
      if (hipCircumference != null) 'hip_circumference': hipCircumference,
      if (neckCircumference != null) 'neck_circumference': neckCircumference,
      if (bicepsCircumference != null)
        'biceps_circumference': bicepsCircumference,
      if (forearmCircumference != null)
        'forearm_circumference': forearmCircumference,
      if (thighCircumference != null) 'thigh_circumference': thighCircumference,
      if (calfCircumference != null) 'calf_circumference': calfCircumference,
      if (parametersDate != null) 'parameters_date': parametersDate,
    });
  }

  ParametersTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? height,
      Value<double>? weight,
      Value<double>? percentage,
      Value<double>? muscles,
      Value<int>? chestCircumference,
      Value<int>? waistCircumference,
      Value<int>? hipCircumference,
      Value<int>? neckCircumference,
      Value<int>? bicepsCircumference,
      Value<int>? forearmCircumference,
      Value<int>? thighCircumference,
      Value<int>? calfCircumference,
      Value<DateTime?>? parametersDate}) {
    return ParametersTableCompanion(
      id: id ?? this.id,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      percentage: percentage ?? this.percentage,
      muscles: muscles ?? this.muscles,
      chestCircumference: chestCircumference ?? this.chestCircumference,
      waistCircumference: waistCircumference ?? this.waistCircumference,
      hipCircumference: hipCircumference ?? this.hipCircumference,
      neckCircumference: neckCircumference ?? this.neckCircumference,
      bicepsCircumference: bicepsCircumference ?? this.bicepsCircumference,
      forearmCircumference: forearmCircumference ?? this.forearmCircumference,
      thighCircumference: thighCircumference ?? this.thighCircumference,
      calfCircumference: calfCircumference ?? this.calfCircumference,
      parametersDate: parametersDate ?? this.parametersDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (percentage.present) {
      map['percentage'] = Variable<double>(percentage.value);
    }
    if (muscles.present) {
      map['muscles'] = Variable<double>(muscles.value);
    }
    if (chestCircumference.present) {
      map['chest_circumference'] = Variable<int>(chestCircumference.value);
    }
    if (waistCircumference.present) {
      map['waist_circumference'] = Variable<int>(waistCircumference.value);
    }
    if (hipCircumference.present) {
      map['hip_circumference'] = Variable<int>(hipCircumference.value);
    }
    if (neckCircumference.present) {
      map['neck_circumference'] = Variable<int>(neckCircumference.value);
    }
    if (bicepsCircumference.present) {
      map['biceps_circumference'] = Variable<int>(bicepsCircumference.value);
    }
    if (forearmCircumference.present) {
      map['forearm_circumference'] = Variable<int>(forearmCircumference.value);
    }
    if (thighCircumference.present) {
      map['thigh_circumference'] = Variable<int>(thighCircumference.value);
    }
    if (calfCircumference.present) {
      map['calf_circumference'] = Variable<int>(calfCircumference.value);
    }
    if (parametersDate.present) {
      map['parameters_date'] = Variable<DateTime>(parametersDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParametersTableCompanion(')
          ..write('id: $id, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('percentage: $percentage, ')
          ..write('muscles: $muscles, ')
          ..write('chestCircumference: $chestCircumference, ')
          ..write('waistCircumference: $waistCircumference, ')
          ..write('hipCircumference: $hipCircumference, ')
          ..write('neckCircumference: $neckCircumference, ')
          ..write('bicepsCircumference: $bicepsCircumference, ')
          ..write('forearmCircumference: $forearmCircumference, ')
          ..write('thighCircumference: $thighCircumference, ')
          ..write('calfCircumference: $calfCircumference, ')
          ..write('parametersDate: $parametersDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppParametersDatabase extends GeneratedDatabase {
  _$AppParametersDatabase(QueryExecutor e) : super(e);
  late final $ParametersTableTable parametersTable =
      $ParametersTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [parametersTable];
}
