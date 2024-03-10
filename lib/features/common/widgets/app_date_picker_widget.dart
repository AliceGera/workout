import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/res/svg_icons.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final _datePickerConfig = CalendarDatePicker2WithActionButtonsConfig(

  customModePickerIcon: const SizedBox(),
  calendarType: CalendarDatePicker2Type.single,
  weekdayLabels: ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'],
  firstDayOfWeek: 1,
  weekdayLabelTextStyle: AppTextStyle.regular10.value.copyWith(color: AppColors.darkGray),
  lastMonthIcon: SvgPicture.asset(SvgIcons.leftArrow),
  nextMonthIcon: SvgPicture.asset(SvgIcons.rightArrow),
  controlsTextStyle: AppTextStyle.medium18.value.copyWith(
    color: AppColors.black,
  ),
  dayTextStyle: AppTextStyle.medium14.value.copyWith(color: Colors.black),
  selectedDayTextStyle: AppTextStyle.medium14.value.copyWith(color: AppColors.black),
  selectedDayHighlightColor: AppColors.blue,
  yearTextStyle: AppTextStyle.semiBold16.value.copyWith(color: Colors.black),
  selectedYearTextStyle: const TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  ),
  cancelButton: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: AppColors.blue,
        width: 1,
      ),
      color: AppColors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Text(
        'Закрыть',
        style: AppTextStyle.medium13.value.copyWith(color: AppColors.black),
      ),
    ),
  ),
  centerAlignModePicker: true,
  okButton: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: AppColors.blue,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Text(
        'Выбрать',
        style: AppTextStyle.medium13.value.copyWith(color: AppColors.black),
      ),
    ),
  ),
  closeDialogOnCancelTapped: true,
  openedFromDialog: true,
  gapBetweenCalendarAndButtons: 0,
);

List<DateTime?> _singleDatePickerValueWithDefaultValue = [DateTime.now()];

Future<List<DateTime?>?> showAppDatePicker(BuildContext context) async {
  return showCalendarDatePicker2Dialog(

    context: context,
    config: _datePickerConfig,
    dialogSize: const Size(325, 0),
    borderRadius: BorderRadius.circular(15),
    value: _singleDatePickerValueWithDefaultValue,
    dialogBackgroundColor: Colors.white,
  );
}
