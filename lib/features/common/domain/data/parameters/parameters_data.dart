class ParametersData {
  final int id;
  final int height;
  final double weight;
  final double muscles;
  final double percentage;
  final int chestCircumference;
  final int waistCircumference;
  final int hipCircumference;
  final int neckCircumference;
  final int bicepsCircumference;
  final int forearmCircumference;
  final int thighCircumference;
  final int calfCircumference;
  final DateTime? parametersDate;

  ParametersData({
    required this.id,
    required this.height,
    required this.weight,
    required this.muscles,
    required this.percentage,
    required this.chestCircumference,
    required this.waistCircumference,
    required this.hipCircumference,
    required this.neckCircumference,
    required this.bicepsCircumference,
    required this.forearmCircumference,
    required this.thighCircumference,
    required this.calfCircumference,
    this.parametersDate,
  });

  static ParametersData init() {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    return ParametersData(
      id: 0,
      height: 0,
      weight: 0,
      muscles: 0,
      percentage: 15,
      chestCircumference: 0,
      waistCircumference: 0,
      hipCircumference: 0,
      neckCircumference: 0,
      bicepsCircumference: 0,
      forearmCircumference: 0,
      thighCircumference: 0,
      calfCircumference: 0,
      parametersDate: date,
    );
  }

  ParametersData copyWith({
    int? id,
    int? height,
    double? weight,
    double? muscles,
    double? percentage,
    int? chestCircumference,
    int? waistCircumference,
    int? hipCircumference,
    int? neckCircumference,
    int? bicepsCircumference,
    int? forearmCircumference,
    int? thighCircumference,
    int? calfCircumference,
    DateTime? parametersDate,
  }) {
    return ParametersData(
      id: id ?? this.id,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      muscles: muscles ?? this.muscles,
      percentage: percentage ?? this.percentage,
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
}
