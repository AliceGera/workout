import 'package:auto_route/auto_route.dart';
import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/res/images.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/widgets/app_app_bar_widget.dart';
import 'package:workout/features/common/widgets/app_button_widget.dart';
import 'package:workout/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'exercise_screen_widget_model.dart';

@RoutePage(
  name: AppRouteNames.exerciseScreen,
)
class ExerciseScreen extends ElementaryWidget<IExerciseScreenWidgetModel> {
  const ExerciseScreen({
    required this.exercise,
    required this.loadAgain,
    Key? key,
    WidgetModelFactory wmFactory = exerciseScreenWmFactory,
  }) : super(wmFactory, key: key);
  final ExerciseData exercise;
  final VoidCallback loadAgain;

  @override
  Widget build(IExerciseScreenWidgetModel wm) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.background),
          fit: BoxFit.cover,
        ),
      ),
      child: ValueListenableBuilder<ExerciseData>(
        builder: (context, exercise, child) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: AppAppBarWidget(
                title: exercise.exerciseName,
                onPressed: wm.closeScreen,
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Рабочий вес',
                                  style: AppTextStyle.semiBold24.value.copyWith(color: AppColors.blue),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    exercise.workingWeight,
                                    style: AppTextStyle.medium14.value.copyWith(color: AppColors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Колличество повторений',
                                  maxLines: 2,
                                  style: AppTextStyle.semiBold24.value.copyWith(
                                    color: AppColors.blue,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    exercise.repetitionsNumber,
                                    style: AppTextStyle.medium14.value.copyWith(color: AppColors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  'Комментарий к выполнению',
                                  maxLines: 2,
                                  style: AppTextStyle.semiBold24.value.copyWith(
                                    color: AppColors.blue,
                                  ),
                                ),
                              ),
                              Text(
                                exercise.comment,
                                style: AppTextStyle.medium14.value.copyWith(color: AppColors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: AppButtonWidget(
                        title: 'Редактировать',
                        onPressed: () {
                          wm.openEditExerciseScreen.call(exercise);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        valueListenable: wm.exerciseState,
      ),
    );
  }
}
