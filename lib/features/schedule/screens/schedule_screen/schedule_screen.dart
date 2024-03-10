import 'dart:collection';
import 'package:auto_route/auto_route.dart';
import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/res/svg_icons.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:workout/features/common/domain/data/records/record_data.dart';
import 'package:workout/features/common/widgets/app_button_widget.dart';
import 'package:workout/features/navigation/domain/entity/app_route_names.dart';
import 'package:workout/features/schedule/screens/schedule_screen/schedule_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:union_state/union_state.dart';
import 'package:intl/date_symbol_data_local.dart';

@RoutePage(
  name: AppRouteNames.scheduleScreen,
)
class ScheduleScreen extends ElementaryWidget<IScheduleScreenWidgetModel> {
  const ScheduleScreen({
    Key? key,
    WidgetModelFactory wmFactory = scheduleScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IScheduleScreenWidgetModel wm) {
    return Builder(builder: (context) {
      return UnionStateListenableBuilder<List<RecordData>>(
        unionStateListenable: wm.scheduleRecordState,
        builder: (_, scheduleRecords) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Расписание тренировок',
                    style: AppTextStyle.medium28.value.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: TableEventsExample(
                    onTapDeleteRecord: wm.onTapDeleteRecord,
                    scheduleRecords: scheduleRecords,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: AppButtonWidget(
                    title: 'Добавить запись',
                    onPressed: wm.openAddRecordScreen,
                  ),
                ),
              ],
            ),
          );
        },
        loadingBuilder: (_, serviceRecords) => const SizedBox(),
        failureBuilder: (_, exception, serviceRecords) => const SizedBox(),
      );
    });
  }
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year - 20, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year + 20, kToday.month + 3, kToday.day);

class TableEventsExample extends StatefulWidget {
  final void Function(RecordData) onTapDeleteRecord;
  final List<RecordData> scheduleRecords;

  const TableEventsExample({
    super.key,
    required this.onTapDeleteRecord,
    required this.scheduleRecords,
  });

  @override
  State<TableEventsExample> createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {
  late final ValueNotifier<List<RecordData>> _selectedEvents;
  final _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime? _selectedDay;
  LinkedHashMap kRecordDataList = LinkedHashMap<DateTime, List<RecordData>>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.scheduleRecords != oldWidget.scheduleRecords) {
      initRecordDataList(false);
    }
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _selectedDay = _focusedDay;
    initRecordDataList(true);
    _selectedEvents = ValueNotifier(_getRecordsForDay(_selectedDay!));
  }

  void initRecordDataList(bool isFirstTime) {
    kRecordDataList.clear();
    for (final record in widget.scheduleRecords) {
      if (kRecordDataList.containsKey(record.recordDate)) {
        kRecordDataList[record.recordDate]!.add(record);
      } else {
        kRecordDataList[record.recordDate] = [record];
      }
    }
    if (!isFirstTime) {
      _selectedEvents.value = _getRecordsForDay(_selectedDay!);
    }
    setState(() {});
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<RecordData> _getRecordsForDay(DateTime day) {
    return kRecordDataList[day] ?? [];
  }

  void _onDaySelected(DateTime selected, DateTime focused) {
    final selectedDay = DateUtils.dateOnly(selected);
    final focusedDay = DateUtils.dateOnly(focused);
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
      _selectedEvents.value = _getRecordsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TableCalendar<RecordData>(
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay,
              currentDay: DateTime.now(),
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: _calendarFormat,
              locale: 'ru',
              headerStyle: HeaderStyle(
                formatButtonVisible: false, // Hide the default format button
                titleCentered: true, // Center the title
                leftChevronIcon: SvgPicture.asset(
                  SvgIcons.leftArrow,
                  color: AppColors.white,
                ), // Set custom icon for left arrow
                rightChevronIcon: SvgPicture.asset(SvgIcons.rightArrow), // Set custom icon for right arrow
              ),
              calendarBuilders: CalendarBuilders(singleMarkerBuilder: (ctx, dateTime, recordData) {
                return Container(
                  width: 16,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.all(
                      Radius.elliptical(400, 100),
                    ),
                  ),
                );
              }),
              calendarStyle: CalendarStyle(
                outsideTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                markersMaxCount: 1,
                rangeHighlightColor: AppColors.green,
                todayDecoration: BoxDecoration(
                  color: AppColors.green.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: const BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                ),
              ),
              eventLoader: _getRecordsForDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: _onDaySelected,
              /*onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },*/
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<RecordData>>(
              valueListenable: _selectedEvents,
              builder: (context, values, _) {
                return ListView.builder(
                  itemCount: values.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 56,
                                  child: Text(
                                    DateFormat('HH:mm').format(values[index].recordTime!),
                                    style: AppTextStyle.medium20.value.copyWith(color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Container(width: 0.5, color: AppColors.blue),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                           values[index].recordWorkoutName,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTextStyle.medium26.value.copyWith(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        values[index].recordRepetition,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyle.light12.value.copyWith(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () => widget.onTapDeleteRecord.call(values[index]),
                                  child: SvgPicture.asset(SvgIcons.trash),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
