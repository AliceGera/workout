import 'package:auto_route/auto_route.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/res/images.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:workout/features/common/domain/data/parameters/parameters_data.dart';
import 'package:workout/features/common/widgets/app_app_bar_widget.dart';
import 'package:workout/features/navigation/domain/entity/app_route_names.dart';
import 'package:workout/features/parameters/screens/measurement_log_screen/measurement_log_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:union_state/union_state.dart';

@RoutePage(
  name: AppRouteNames.measurementLogScreen,
)
class MeasurementLogScreen extends ElementaryWidget<IMeasurementLogScreenWidgetModel> {
  MeasurementLogScreen({
    Key? key,
    WidgetModelFactory wmFactory = measurementLogScreenWmFactory,
  }) : super(wmFactory, key: key);
  final List<String> titles = [
    'Вес',
    'Рост',
    'Обхват шеи',
    'Обхват бицепса',
    'Обхват предплечья',
    'Обхват бедра',
    'Обхват голени',
    'Окружность груди',
    'Окружность талии',
    'Окружность бедер',
    'Мышцы',
    '% жира'
  ];

  @override
  Widget build(IMeasurementLogScreenWidgetModel wm) {
    return UnionStateListenableBuilder<List<ParametersData>>(
      unionStateListenable: wm.parametersState,
      builder: (_, parameters) {
        return DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Images.background),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: AppAppBarWidget(
                title: 'Журнал измерений',
                onPressed: wm.closeScreen,
              ),
            ),
            body: SafeArea(
              child: ValueListenableBuilder<int>(
                valueListenable: wm.selectedIndexState,
                builder: (context, selectedIndex, child) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Container(
                          height: 30.0,
                          color: Colors.transparent,
                          child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: titles.length,
                            itemBuilder: (BuildContext context, int index) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  wm.tapOnTitle(index);
                                },
                                child: Text(
                                  titles[index],
                                  style: AppTextStyle.light13.value.copyWith(
                                    color: selectedIndex == index ? AppColors.blue : AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: _GraphWidget(parameters: parameters, selectedIndex: selectedIndex),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
      loadingBuilder: (_, parameters) => const SizedBox(),
      failureBuilder: (_, exception, parameters) => const SizedBox(),
    );
  }
}

class _GraphWidget extends StatefulWidget {
  _GraphWidget({
    required this.parameters,
    required this.selectedIndex,
  });

  List<ParametersData> parameters;
  int selectedIndex;

  @override
  _GraphWidgetState createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<_GraphWidget> {

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SfCartesianChart(
            zoomPanBehavior: ZoomPanBehavior(
              enableDoubleTapZooming: true,
              enablePinching: true,
              enablePanning: true,
              enableSelectionZooming: true,
            ),
            plotAreaBorderWidth: 0,
            primaryXAxis: DateTimeAxis(
              majorGridLines: const MajorGridLines(
                width: 0.3,
                color: Color(0xFF87CEDD),
              ),
              dateFormat: DateFormat.yMMMMd('ru'),
            ),
            primaryYAxis: const NumericAxis(
              minimum: 0,
              maximum: 100,
              interval: 100,
              majorGridLines: MajorGridLines(width: 0),
            ),
            series: <CartesianSeries<ParametersData, DateTime>>[
              AreaSeries<ParametersData, DateTime>(
                dataSource: widget.parameters,
                xValueMapper: (ParametersData data, _) {
                  return data.parametersDate!;
                },
                yValueMapper: (ParametersData data, _) => widget.selectedIndex == 0
                    ? data.weight
                    : widget.selectedIndex == 1
                        ? data.height
                        : widget.selectedIndex == 2
                            ? data.neckCircumference
                            : widget.selectedIndex == 3
                                ? data.bicepsCircumference
                                : widget.selectedIndex == 4
                                    ? data.forearmCircumference
                                    : widget.selectedIndex == 5
                                        ? data.thighCircumference
                                        : widget.selectedIndex == 6
                                            ? data.calfCircumference
                                            : widget.selectedIndex == 7
                                                ? data.chestCircumference
                                                : widget.selectedIndex == 8
                                                    ? data.waistCircumference
                                                    : widget.selectedIndex == 9
                                                        ? data.hipCircumference
                                                        : widget.selectedIndex == 10
                                                            ? data.muscles
                                                            : data.percentage,
                dataLabelMapper: (ParametersData data, _) => '${data.weight}',
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFD0E9BC),
                    const Color(0xFFD0E9BC).withOpacity(0.15),
                  ],
                ),
                markerSettings: const MarkerSettings(
                  isVisible: true,
                  color: Colors.yellow,
                  height: 6,
                  width: 6,
                  borderWidth: 0,
                ),
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  labelAlignment: ChartDataLabelAlignment.top,
                  borderWidth: 0,
                  textStyle: TextStyle(
                    color: Color(0xFFFFFDFD),
                  ),
                  margin: EdgeInsets.zero,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
