import 'package:auto_route/auto_route.dart';
import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/res/svg_icons.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:workout/features/common/domain/data/my_workouts_and_exercises/my_workouts_and_exercises_data.dart';
import 'package:workout/features/navigation/domain/entity/app_route_names.dart';
import 'package:workout/features/workout/screens/my_workouts_and_exercises_screen/my_workouts_and_exercises_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:union_state/union_state.dart';

@RoutePage(
  name: AppRouteNames.myWorkoutsAndExercisesScreen,
)
class MyWorkoutsAndExercisesScreen extends ElementaryWidget<IMyWorkoutsAndExercisesScreenWidgetModel> {
  const MyWorkoutsAndExercisesScreen({
    Key? key,
    WidgetModelFactory wmFactory = myWorkoutsAndExercisesScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IMyWorkoutsAndExercisesScreenWidgetModel wm) {
    return Builder(
      builder: (context) {
        return UnionStateListenableBuilder<MyWorkoutsAndExercisesData>(
          unionStateListenable: wm.exercisesWithObjectsState,
          builder: (_, workoutsAndExercises) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Мои тренировки', style: AppTextStyle.medium28.value.copyWith(color: AppColors.white)),
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: wm.openMyWorkoutsScreen,
                            child: Row(
                              children: [
                                Text(
                                  'Все',
                                  style: AppTextStyle.medium12.value.copyWith(color: AppColors.blue),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.blue,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: workoutsAndExercises.myWorkouts.length + 1,
                        itemBuilder: (context, index) {
                          return index == 0
                              ? InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: wm.openAddWorkoutScreen,
                                  child: Container(
                                    height: 180,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 8),
                                            child: SvgPicture.asset(SvgIcons.person),
                                          ),
                                          Text(
                                            textAlign: TextAlign.center,
                                            'Новая тренировка',
                                            style: AppTextStyle.medium18.value,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    wm.openWorkoutInfoScreen.call(workoutsAndExercises.myWorkouts[index - 1]);
                                  },
                                  child: Container(
                                    height: 180,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      color: index % 2 == 0 ? AppColors.blue : AppColors.yellow,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 8),
                                            child: SvgPicture.asset(SvgIcons.train),
                                          ),
                                          Text(
                                            workoutsAndExercises.myWorkouts[index - 1].workoutName,
                                            style: AppTextStyle.medium18.value,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                        },
                        separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Упражнения', style: AppTextStyle.medium28.value.copyWith(color: AppColors.white)),
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: wm.openExercisesScreen,
                            child: Row(
                              children: [
                                Text(
                                  'Все',
                                  style: AppTextStyle.medium12.value.copyWith(color: AppColors.blue),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.blue,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount:
                            ((workoutsAndExercises.exercises.length + 1) / 2).round() != 0 ? ((workoutsAndExercises.exercises.length + 1) / 2).round() : 1,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                if (index == 0) ...[
                                  Expanded(
                                    child: InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: wm.openAddExerciseScreen,
                                      child: Container(
                                        height: 140,
                                        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Expanded(flex: 1, child: SvgPicture.asset(SvgIcons.oldExercise)),
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Новое \nупражнение',
                                                        style: AppTextStyle.regular14.value.copyWith(color: AppColors.black),
                                                      ),
                                                      const SizedBox(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  if (index != workoutsAndExercises.exercises.length)
                                    Expanded(
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          wm.openExerciseScreen.call(workoutsAndExercises.exercises[index]);
                                        },
                                        child: Container(
                                          height: 140,
                                          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Expanded(flex: 1, child: SvgPicture.asset(SvgIcons.oldExercise)),
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 8),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            maxLines: 2,
                                                            workoutsAndExercises.exercises[index].exerciseName,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: AppTextStyle.regular14.value.copyWith(color: AppColors.black),
                                                          ),
                                                        ),
                                                        workoutsAndExercises.exercises[index].exerciseLike
                                                            ? SvgPicture.asset(SvgIcons.fillHeart)
                                                            : SvgPicture.asset(SvgIcons.emptyHeart),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  else
                                    const Spacer()
                                ] else ...[
                                  Expanded(
                                    child: InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        wm.openExerciseScreen.call(workoutsAndExercises.exercises[index * 2 - 1]);
                                      },
                                      child: Container(
                                        height: 140,
                                        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Expanded(flex: 1, child: SvgPicture.asset(SvgIcons.oldExercise)),
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          maxLines: 2,
                                                          overflow: TextOverflow.ellipsis,
                                                          '${workoutsAndExercises.exercises[index * 2 - 1].exerciseName} ',
                                                          style: AppTextStyle.regular14.value.copyWith(color: AppColors.black),
                                                        ),
                                                      ),
                                                      workoutsAndExercises.exercises[index * 2 - 1].exerciseLike
                                                          ? SvgPicture.asset(SvgIcons.fillHeart)
                                                          : SvgPicture.asset(SvgIcons.emptyHeart),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  if (index * 2 != workoutsAndExercises.exercises.length)
                                    Expanded(
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          wm.openExerciseScreen.call(workoutsAndExercises.exercises[index * 2]);
                                        },
                                        child: Container(
                                          height: 140,
                                          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Expanded(flex: 1, child: SvgPicture.asset(SvgIcons.oldExercise)),
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 8),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            maxLines: 2,
                                                            workoutsAndExercises.exercises[index * 2].exerciseName,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: AppTextStyle.regular14.value.copyWith(color: AppColors.black),
                                                          ),
                                                        ),
                                                        SvgPicture.asset(SvgIcons.fillHeart),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  else
                                    const Spacer(),
                                ],
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          loadingBuilder: (_, exercisesWithWorkouts) => const SizedBox(),
          failureBuilder: (_, exception, exercisesWithWorkouts) => const SizedBox(),
        );
      },
    );
  }
}
