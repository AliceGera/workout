import 'package:auto_route/auto_route.dart';
import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/res/svg_icons.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:workout/features/common/domain/data/parameters/parameters_data.dart';
import 'package:workout/features/common/widgets/app_button_widget.dart';
import 'package:workout/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'parameters_screen_widget_model.dart';

@RoutePage(
  name: AppRouteNames.parametersScreen,
)
class ParametersScreen extends ElementaryWidget<IParametersScreenWidgetModel> {
  const ParametersScreen({
    Key? key,
    WidgetModelFactory wmFactory = parametersScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IParametersScreenWidgetModel wm) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ValueListenableBuilder<ParametersData>(
        builder: (context, parameters, child) {
          return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Мои параметры',
                  style: AppTextStyle.medium28.value.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Center(
                                child: SizedBox(
                                  width: constraints.maxWidth,
                                  height: constraints.maxHeight - 256,
                                  child: AspectRatio(
                                    aspectRatio: 0.595,
                                    child: SvgPicture.asset(
                                      SvgIcons.body,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                  ((constraints.maxWidth - 32) / 2) + (((constraints.maxHeight - 256) * 0.2975) * .57),
                                  0,
                                  0,
                                  (constraints.maxHeight - 256) * 0.929,
                                ),
                                child: Text(
                                  parameters.neckCircumference.toString().isNotEmpty ? '${parameters.neckCircumference.toString()} см' : '',
                                  style: AppTextStyle.regular15.value,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                  ((constraints.maxWidth - 32) / 2) + (((constraints.maxHeight - 256) * 0.2975) * .57),
                                  0,
                                  0,
                                  (constraints.maxHeight - 256) * 0.795,
                                ),
                                child: Text(
                                  parameters.chestCircumference.toString().isNotEmpty ? '${parameters.chestCircumference.toString()} см' : '',
                                  style: AppTextStyle.regular15.value,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                  ((constraints.maxWidth - 32) / 2) + (((constraints.maxHeight - 256) * 0.2975) * .57),
                                  0,
                                  0,
                                  (constraints.maxHeight - 256) * 0.655,
                                ),
                                child: Text(
                                  parameters.bicepsCircumference.toString().isNotEmpty ? '${parameters.bicepsCircumference.toString()} см' : '',
                                  style: AppTextStyle.regular15.value,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                  ((constraints.maxWidth - 32) / 2) + (((constraints.maxHeight - 256) * 0.2975) * .57),
                                  0,
                                  0,
                                  (constraints.maxHeight - 256) * 0.520,
                                ),
                                child: Text(
                                  parameters.waistCircumference.toString().isNotEmpty ? '${parameters.waistCircumference.toString()} см' : '',
                                  style: AppTextStyle.regular15.value,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                  ((constraints.maxWidth - 32) / 2) + (((constraints.maxHeight - 256) * 0.2975) * .57),
                                  0,
                                  0,
                                  (constraints.maxHeight - 256) * 0.386,
                                ),
                                child: Text(
                                  parameters.hipCircumference.toString().isNotEmpty ? '${parameters.hipCircumference.toString()} см' : '',
                                  style: AppTextStyle.regular15.value,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                  ((constraints.maxWidth - 32) / 2) + (((constraints.maxHeight - 256) * 0.2975) * .57),
                                  0,
                                  0,
                                  (constraints.maxHeight - 256) * 0.250,
                                ),
                                child: Text(
                                  parameters.thighCircumference.toString().isNotEmpty ? '${parameters.thighCircumference.toString()} см' : '',
                                  style: AppTextStyle.regular15.value,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                  ((constraints.maxWidth - 32) / 2) + (((constraints.maxHeight - 256) * 0.2975) * .57),
                                  0,
                                  0,
                                  (constraints.maxHeight - 256) * 0.110,
                                ),
                                child: Text(
                                  parameters.calfCircumference.toString().isNotEmpty ? '${parameters.calfCircumference.toString()} см' : '',
                                  style: AppTextStyle.regular15.value,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: Row(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              SvgPicture.asset(
                                                SvgIcons.firstParameter,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    parameters.height.toString().isNotEmpty ? '${parameters.height.toString()} см' : '',
                                                    style: AppTextStyle.regular15.value,
                                                  ),
                                                  Container(
                                                    color: AppColors.blue,
                                                    height: 1,
                                                    width: 60,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 50),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              SvgPicture.asset(
                                                SvgIcons.secondParameter,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    parameters.muscles.toString().isNotEmpty ? '${parameters.muscles.toString()} %' : '',
                                                    style: AppTextStyle.regular15.value,
                                                  ),
                                                  Container(
                                                    color: AppColors.blue,
                                                    height: 1,
                                                    width: 60,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: Row(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              SvgPicture.asset(
                                                SvgIcons.weightParameter,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    parameters.weight.toString().isNotEmpty ? '${parameters.weight.toString()} кг' : '',
                                                    style: AppTextStyle.regular15.value,
                                                  ),
                                                  Container(
                                                    color: AppColors.blue,
                                                    height: 1,
                                                    width: 60,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 50),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              SvgPicture.asset(
                                                SvgIcons.fourthParameter,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    parameters.percentage.toString().isNotEmpty ? '${parameters.percentage.toString()} %' : '',
                                                    style: AppTextStyle.regular15.value,
                                                  ),
                                                  Container(
                                                    color: AppColors.blue,
                                                    height: 1,
                                                    width: 60,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: wm.openMeasurementLogScreen,
                                child: SvgPicture.asset(
                                  SvgIcons.graph,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: AppButtonWidget(
                    title: 'Начать измерения',
                    onPressed: wm.openStartMeasurementsScreen,
                  ),
                ),
              ],
            );
          });
        },
        valueListenable: wm.parametersState,
      ),
    );
  }
}
