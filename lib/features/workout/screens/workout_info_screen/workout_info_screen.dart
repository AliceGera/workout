import 'package:auto_route/auto_route.dart';
import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/res/images.dart';
import 'package:workout/assets/res/svg_icons.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:workout/features/common/widgets/app_app_bar_widget.dart';
import 'package:workout/features/common/widgets/app_button_widget.dart';
import 'package:workout/features/navigation/domain/entity/app_route_names.dart';
import 'package:workout/features/workout/screens/workout_info_screen/workout_info_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage(
  name: AppRouteNames.workoutInfoScreen,
)
class WorkoutInfoScreen extends ElementaryWidget<IWorkoutInfoScreenWidgetModel> {
  const WorkoutInfoScreen({
    required this.myWorkout,
    required this.loadAgain,
    Key? key,
    WidgetModelFactory wmFactory = workoutInfoScreenWmFactory,
  }) : super(wmFactory, key: key);
  final MyWorkoutData myWorkout;
  final VoidCallback loadAgain;

  @override
  Widget build(IWorkoutInfoScreenWidgetModel wm) {
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
          child: ValueListenableBuilder<String>(
            builder: (context, workoutName, child) {
              return AppAppBarWidget(
                title: workoutName,
                onPressed: wm.closeScreen,
              );
            },
            valueListenable: wm.workoutNameState,
          ),
        ),
        body: ValueListenableBuilder<List<ExerciseData>>(
          builder: (context, exercises, child) {
            return SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: ListView.separated(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: exercises.length,
                        itemBuilder: (context, index) {
                          return Padding(
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
                                      flex: 3,
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        exercises[index].exerciseName,
                                        style: AppTextStyle.medium16.value.copyWith(color: AppColors.black),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(SvgIcons.restart),
                                              Text(
                                                overflow: TextOverflow.ellipsis,
                                                exercises[index].workingWeight,
                                                style: AppTextStyle.regular15.value.copyWith(color: AppColors.black),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(SvgIcons.restart),
                                              Text(
                                                exercises[index].repetitionsNumber,
                                                style: AppTextStyle.regular15.value.copyWith(color: AppColors.black),
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
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: 8),
                      ),
                    ),
                  ),
                  AppButtonWidget(
                    title: 'Редактировать',
                    onPressed: () {
                      wm.openEditWorkoutScreen.call(myWorkout, exercises);
                    },
                  ),
                ],
              ),
            ));
          },
          valueListenable: wm.exerciseState,
        ),
      ),
    );
  }
}
