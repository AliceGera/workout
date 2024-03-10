import 'package:auto_route/auto_route.dart';
import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/res/images.dart';
import 'package:workout/assets/res/svg_icons.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:workout/features/common/domain/data/records/record_data.dart';
import 'package:workout/features/common/widgets/app_app_bar_widget.dart';
import 'package:workout/features/common/widgets/app_button_widget.dart';
import 'package:workout/features/common/widgets/app_date_picker_widget.dart';
import 'package:workout/features/common/widgets/app_dropdown.dart';
import 'package:workout/features/common/widgets/choose_widget.dart';
import 'package:workout/features/navigation/domain/entity/app_route_names.dart';
import 'package:workout/features/schedule/screens/add_record_screen/add_record_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';
import 'package:union_state/union_state.dart';

@RoutePage(
  name: AppRouteNames.addRecordScreen,
)
class AddRecordScreen extends ElementaryWidget<IAddRecordScreenWidgetModel> {
  AddRecordScreen({
    required this.loadAgain,
    Key? key,
    WidgetModelFactory wmFactory = addRecordScreenWmFactory,
  }) : super(wmFactory, key: key);
  final VoidCallback loadAgain;
  final List<String> recordRepetition = [
    'Раз в неделю',
    'Каждые два дня',
    'Раз в дне недели',
    'Раз в месяц',
  ];
  final inputFormaters = <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'^(\+?\d{0,3})?[\s.-]?\(?\d{0,3}\)?[\s.-]?\d{0,4}[\s.-]?\d{0,4}$')),
  ];

  @override
  Widget build(IAddRecordScreenWidgetModel wm) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.background),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: AppAppBarWidget(
              title: 'Планирование тренировки',
              onPressed: wm.closeScreen,
            ),
          ),
          body: UnionStateListenableBuilder<List<MyWorkoutData>>(
            unionStateListenable: wm.workoutsState,
            builder: (_, workouts) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: ValueListenableBuilder<RecordData>(
                  builder: (context, record, child) {
                    return Column(
                      children: [
                        Column(
                          children: [
                            InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () async {
                                final result = await showAppDatePicker(context);
                                if (result != null && result.isNotEmpty) {
                                  wm.addDate(result.first);
                                }
                              },
                              child: ChooseWidget(
                                text: record.recordDate != null ? DateFormat('dd.MM.yyyy').format(record.recordDate!) : '00.00.00',
                                assetName: SvgIcons.calendar,
                                fieldName: 'Дата',
                              ),
                            ),
                            InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () async {
                                final result = await showTimeDialog(context: context);
                                if (result != null) {
                                  wm.addTime(result);
                                }
                              },
                              child: ChooseWidget(
                                text: record.recordTime != null ? DateFormat('HH:mm').format(record.recordTime!) : '00:00',
                                assetName: SvgIcons.time,
                                fieldName: 'Время',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 12),
                                        child: Text(
                                          'Тренировка',
                                          style: AppTextStyle.semiBold24.value.copyWith(
                                            color: AppColors.blue,
                                          ),
                                        ),
                                      ),
                                      record.recordWorkoutName.isNotEmpty
                                          ? Padding(
                                              padding: const EdgeInsets.only(bottom: 8),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.blue)),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        record.recordWorkoutName,
                                                        style: AppTextStyle.regular14.value,
                                                      ),
                                                      SvgPicture.asset(SvgIcons.choose),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          : const SizedBox(),
                                      AppButtonWidget(
                                        title: 'Выбрать тренировку',
                                        onPressed: () async {
                                          final isSelected = await showDialog<bool>(
                                            context: context,
                                            builder: (ctx) => AddWorkoutDialogWidget(
                                              workouts: workouts,
                                              tapOnCheckBoxExercise: wm.tapOnCheckBoxExercise,
                                              selectedIndexState: wm.selectedIndexState,
                                            ),
                                          );
                                          wm.selectExercise(isSelected);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: DropdownWidget(
                                items: recordRepetition,
                                title: record.recordRepetition.isEmpty ? 'Повторение' : record.recordRepetition,
                                selectedValueText: wm.saveRecordRepetition,
                                // text: record.recordBrand.isEmpty ? '' : 'Переодичность',
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        AppButtonWidget(
                          title: 'Запланировать тренировку',
                          onPressed: (record.recordRepetition.isNotEmpty && record.recordDate != null && record.recordTime != null)
                              ? () async {
                                  await wm.addRecord();
                                  loadAgain.call();
                                }
                              : null,
                          color:
                              (record.recordRepetition.isNotEmpty && record.recordDate != null && record.recordTime != null) ? AppColors.blue : AppColors.white,
                          textColor:
                              (record.recordRepetition.isNotEmpty && record.recordDate != null && record.recordTime != null) ? Colors.black : AppColors.blue,
                          borderColor:
                              (record.recordRepetition.isNotEmpty && record.recordDate != null && record.recordTime != null) ? AppColors.prime : Colors.black,
                        ),
                      ],
                    );
                  },
                  valueListenable: wm.recordState,
                ),
              );
            },
            loadingBuilder: (_, workouts) => const SizedBox(),
            failureBuilder: (_, exception, workouts) => const SizedBox(),
          ),
        ),
      ),
    );
  }
}

Future<DateTime?> showTimeDialog({
  required BuildContext context,
}) {
  var dialog = Dialog(

    insetPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
    backgroundColor: Theme.of(context).canvasColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    clipBehavior: Clip.antiAlias,
    child: const TimePicker(),
  );

  return showDialog<DateTime?>(
    context: context,
    builder: (BuildContext context) => dialog,
    barrierColor: Colors.black54,
  );
}

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  DateTime? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TimePickerSpinner(
              is24HourMode: true,
              onTimeChange: (time) {
                setState(
                  () {
                    selectedTime = time;
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: AppButtonWidget(
                title: 'Выбрать',
                onPressed: () {
                  Navigator.pop(context, selectedTime);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddWorkoutDialogWidget extends StatelessWidget {
  const AddWorkoutDialogWidget({
    super.key,
    required this.tapOnCheckBoxExercise,
    required this.workouts,
    required this.selectedIndexState,
  });

  final void Function(int) tapOnCheckBoxExercise;
  final List<MyWorkoutData> workouts;
  final ValueNotifier<int?> selectedIndexState;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        height: 340,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Center(
            child: ValueListenableBuilder<int?>(
              valueListenable: selectedIndexState,
              builder: (context, selectedIndex, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Выбрать тренировку',
                      style: AppTextStyle.medium28.value.copyWith(color: AppColors.blue),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: SingleChildScrollView(
                          child: workouts.isEmpty
                              ? const SizedBox()
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: AppColors.blue),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: workouts.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  workouts[index].workoutName,
                                                  style: AppTextStyle.regular14.value,
                                                ),
                                              ],
                                            ),
                                            CheckboxWidget(
                                              tapOnCheckBoxExercise: (bool checkBoxState) {
                                                tapOnCheckBoxExercise.call(index);
                                              },
                                              isSelected: selectedIndex == index,
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        AppButtonWidget(
                          title: 'Закрыть',
                          color: AppColors.white,
                          borderColor: AppColors.blue,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Spacer(),
                        AppButtonWidget(
                          title: 'Выбрать',
                          onPressed: () {
                            Navigator.pop(context, selectedIndex != null ? true : null);
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({
    required this.tapOnCheckBoxExercise,
    required this.isSelected,
    super.key,
  });

  final bool isSelected;
  final void Function(bool) tapOnCheckBoxExercise;

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Colors.white;
    }

    return Checkbox(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(4.0),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      checkColor: Colors.black,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: widget.isSelected,
      onChanged: (bool? value) {
        widget.tapOnCheckBoxExercise.call(value ?? false);
      },
    );
  }
}
