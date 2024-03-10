import 'package:auto_route/auto_route.dart';
import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/res/images.dart';
import 'package:workout/assets/res/svg_icons.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:workout/features/common/domain/data/parameters/parameters_data.dart';
import 'package:workout/features/common/widgets/app_app_bar_widget.dart';
import 'package:workout/features/common/widgets/app_button_widget.dart';
import 'package:workout/features/common/widgets/counter_widget.dart';
import 'package:workout/features/common/widgets/gradient_slider_widget.dart';
import 'package:workout/features/common/widgets/slider_widget.dart';
import 'package:workout/features/navigation/domain/entity/app_route_names.dart';
import 'package:workout/features/parameters/screens/start_measurements_screen/start_measurements_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage(
  name: AppRouteNames.startMeasurementsScreen,
)
class StartMeasurementsScreen extends ElementaryWidget<IStartMeasurementsScreenWidgetModel> {
  const StartMeasurementsScreen({
    required this.loadAgain,
    Key? key,
    WidgetModelFactory wmFactory = startMeasurementsScreenWmFactory,
  }) : super(wmFactory, key: key);
  final VoidCallback loadAgain;

  @override
  Widget build(IStartMeasurementsScreenWidgetModel wm) {
    return StartMeasurementsScreenBody(wm: wm);
  }
}

class StartMeasurementsScreenBody extends StatefulWidget {
  final IStartMeasurementsScreenWidgetModel wm;

  const StartMeasurementsScreenBody({
    required this.wm,
    super.key,
  });

  @override
  State<StartMeasurementsScreenBody> createState() => _StartMeasurementsScreenState();
}

class _StartMeasurementsScreenState extends State<StartMeasurementsScreenBody> {
  final PageController controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
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
            title: 'Измерения',
            onPressed: () {
              if (index == 0) {
                widget.wm.closeScreen.call();
              } else {
                controller.animateToPage(
                  index - 1,
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 300),
                );
              }
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.yellow,
                          ),
                          height: 8,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: (index >= 1) ? AppColors.yellow : AppColors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: (index == 2) ? AppColors.yellow : AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ValueListenableBuilder<ParametersData?>(
                  valueListenable: widget.wm.parametersState,
                  builder: (context, parameters, child) {
                    return parameters != null
                        ? Expanded(
                            child: PageView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: controller,
                              onPageChanged: (idx) {
                                setState(() {
                                  index = idx;
                                });
                              },
                              children: <Widget>[
                                _FirstWidget(
                                  assetName1: Images.onboarding1_1,
                                  assetName2: Images.onboarding1_2,
                                  assetName3: Images.onboarding1_3,
                                  title: 'Ведите журнал измерений своих параметров и отлеживайте динамику',
                                  parametersData: parameters,
                                  wm: widget.wm,
                                ),
                                _SecondWidget(
                                  assetName1: Images.onboarding1_1,
                                  assetName2: Images.onboarding1_2,
                                  assetName3: Images.onboarding1_3,
                                  title: 'Ведите журнал измерений своих параметров и отлеживайте динамику',
                                  parametersData: parameters,
                                  wm: widget.wm,
                                ),
                                _ThirdWidget(
                                  assetName1: Images.onboarding1_1,
                                  assetName2: Images.onboarding1_2,
                                  assetName3: Images.onboarding1_3,
                                  title: 'Ведите журнал измерений своих параметров и отлеживайте динамику',
                                  parametersData: parameters,
                                  wm: widget.wm,
                                ),
                              ],
                            ),
                          )
                        : SizedBox();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: AppButtonWidget(
                    title: 'Далее',
                    color: AppColors.blue,
                    onPressed: () async {
                      if (index == 2) {
                        await widget.wm.saveParameters();
                      } else {
                        index++;
                        controller.animateToPage(
                          index,
                          curve: Curves.easeIn,
                          duration: const Duration(milliseconds: 300),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FirstWidget extends StatelessWidget {
  const _FirstWidget({
    required this.assetName1,
    required this.assetName2,
    required this.assetName3,
    required this.title,
    required this.parametersData,
    required this.wm,
  });

  final String assetName1;
  final String assetName2;
  final String assetName3;
  final String title;
  final ParametersData parametersData;
  final IStartMeasurementsScreenWidgetModel wm;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Рост*',
                        style: AppTextStyle.regular24.value,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SliderWidget(
                        measure: 'см',
                        value: parametersData.height.toDouble(),
                        valueStr: parametersData.height.toString(),
                        onChanged: (value) {
                          wm.setHeight(value.toInt());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 16),
              child: _InfoWidget(
                title: 'Рост можно измерить, стоя на прямой поверхности с головой, спиной и ягодицами прижатыми к стене. Используйте ленту или измерительную '
                    'линейку, чтобы измерить расстояние от пятки до верхней части головы.',
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Вес*',
                        style: AppTextStyle.regular24.value,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SliderWidget(
                        measure: 'кг',
                        value: parametersData.weight,
                        valueStr: parametersData.weight.toString(),
                        onChanged: (value) {
                          wm.setWeight(value.toPrecision(1));
                        },
                        interval: 0.1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 16),
              child: _InfoWidget(
                title: 'Вес можно измерить, используя весы. Просто встаньте на весы и запишите показания.',
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '%',
                                style: AppTextStyle.semiBold28.value,
                              ),
                              Text(
                                'жира',
                                style: AppTextStyle.regular24.value,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          GradientSliderWidget(
                            onChanged: (value) {
                              wm.setPercentage(value.toPrecision(1));
                            },
                            muscles: parametersData.percentage,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '15',
                                style: AppTextStyle.regular12.value,
                              ),
                              Text(
                                '18.5',
                                style: AppTextStyle.regular12.value,
                              ),
                              Text(
                                '25',
                                style: AppTextStyle.regular12.value,
                              ),
                              Text(
                                '30',
                                style: AppTextStyle.regular12.value,
                              ),
                              Text(
                                '40',
                                style: AppTextStyle.regular12.value,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 16),
              child: _InfoWidget(title: 'Процент жира или индекс жировой массы (IMG) – это количество жировой массы по отношению к общему весу тела. '),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Мышцы',
                        style: AppTextStyle.regular24.value,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SliderWidget(
                        measure: '%',
                        value: parametersData.muscles,
                        valueStr: parametersData.muscles.toString(),
                        onChanged: (value) {
                          wm.setMuscles(value.toPrecision(1));
                        },
                        interval: 0.1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 16),
              child: _InfoWidget(title: 'Мышечная масса – это размер мышц в теле, их вес и объем, в том числе скелетной, гладкой, сердечной мышцы.'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SecondWidget extends StatelessWidget {
  const _SecondWidget({
    required this.assetName1,
    required this.assetName2,
    required this.assetName3,
    required this.title,
    required this.parametersData,
    required this.wm,
  });

  final String assetName1;
  final String assetName2;
  final String assetName3;
  final String title;
  final ParametersData parametersData;
  final IStartMeasurementsScreenWidgetModel wm;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  right: 16,
                  left: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Окружность груди',
                      style: AppTextStyle.regular24.value,
                    ),
                    SliderWidget(
                      measure: 'см',
                      value: parametersData.chestCircumference.toDouble(),
                      valueStr: parametersData.chestCircumference.toString(),
                      onChanged: (value) {
                        wm.setChestCircumference(value.toInt());
                      },
                    ),
                    const _InfoWidget(
                      title: 'Процент жира или индекс жировой массы (IMG) – это количество жировой массы по отношению к общему весу тела. ',
                      backgroundColor: Colors.transparent,
                      borderColor: Colors.transparent,
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  right: 16,
                  left: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Окружность талии',
                      style: AppTextStyle.regular24.value,
                    ),
                    SliderWidget(
                      measure: 'см',
                      value: parametersData.waistCircumference.toDouble(),
                      valueStr: parametersData.waistCircumference.toString(),
                      onChanged: (value) {
                        wm.setWaistCircumference(value.toInt());
                      },
                    ),
                    const _InfoWidget(
                      title:
                          'Чтобы измерить окружность талии, оберните измерительную ленту вокруг самой узкой части талии, обычно между ребрами и верхней частью бедра.',
                      backgroundColor: Colors.transparent,
                      borderColor: Colors.transparent,
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  right: 16,
                  left: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Окружность бедер',
                      style: AppTextStyle.regular24.value,
                    ),
                    SliderWidget(
                      measure: 'см',
                      value: parametersData.hipCircumference.toDouble(),
                      valueStr: parametersData.hipCircumference.toString(),
                      onChanged: (value) {
                        wm.setHipCircumference(value.toInt());
                      },
                    ),
                    const _InfoWidget(
                      title: 'Чтобы измерить окружность бедер, оберните измерительную ленту вокруг наиболее выступающей части ягодиц и бедра.',
                      backgroundColor: Colors.transparent,
                      borderColor: Colors.transparent,
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThirdWidget extends StatelessWidget {
  const _ThirdWidget({
    required this.assetName1,
    required this.assetName2,
    required this.assetName3,
    required this.title,
    required this.parametersData,
    required this.wm,
  });

  final String assetName1;
  final String assetName2;
  final String assetName3;
  final String title;
  final ParametersData parametersData;
  final IStartMeasurementsScreenWidgetModel wm;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CounterWidget(
              title: 'Обхват шеи',
              infoText: 'Чтобы измерить обхват шеи, оберните измерительную ленту вокруг шейки в самой нижней точке шеи.',
              background: AppColors.blue,
              onChanged: (value) {
                wm.setNeckCircumference(value);
              },
              initialValue: parametersData.neckCircumference,
            ),
            CounterWidget(
              title: 'Обхват бицепса',
              infoText: 'Согните руку под прямым углом и положите ленту на верхнюю часть бицепса и оберните ее вокруг мышцы.',
              background: AppColors.yellow,
              onChanged: (value) {
                wm.setBicepsCircumference(value);
              },
              initialValue: parametersData.bicepsCircumference,
            ),
            CounterWidget(
              title: 'Обхват предплечья',
              infoText:
                  'Чтобы измерить обхват предплечья, возьмите гибкую измерительную ленту и оберните ее вокруг наиболее широкой части предплечья, примерно на 2-3 сантиметра ниже локтевого сустава. Убедитесь, что лента плотно прилегает к коже и не сдавливает мышцы. Запишите показания.',
              background: AppColors.yellow,
              onChanged: (value) {
                wm.setForearmCircumference(value);
              },
              initialValue: parametersData.forearmCircumference,
            ),
            CounterWidget(
              title: 'Обхват бедра',
              infoText:
                  'Чтобы измерить обхват бедра, возьмите гибкую измерительную ленту и оберните ее вокруг наиболее выступающей части верхней части бедра. Запишите показания.',
              background: AppColors.green,
              onChanged: (value) {
                wm.setThighCircumference(value);
              },
              initialValue: parametersData.thighCircumference,
            ),
            CounterWidget(
              title: 'Обхват голени',
              infoText:
                  'Для измерения обхвата голени ленту оберните ее вокруг наиболее широкой части икроножной мышцы. Подобно обмеру бедра, лента должна плотно прилегать к коже и не провисать. ',
              background: AppColors.green,
              onChanged: (value) {
                wm.setCalfCircumference(value);
              },
              initialValue: parametersData.calfCircumference,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoWidget extends StatelessWidget {
  const _InfoWidget({
    required this.title,
    this.borderColor = Colors.red,
    this.backgroundColor = AppColors.black,
    this.textColor = AppColors.white,
  });

  final Color borderColor;
  final Color backgroundColor;
  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: SvgPicture.asset(SvgIcons.infoCircle),
            ),
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.light10.value.copyWith(color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension DoubleExtension on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
