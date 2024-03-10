import 'package:auto_route/auto_route.dart';
import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/res/images.dart';
import 'package:workout/assets/res/svg_icons.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:workout/features/common/widgets/app_app_bar_widget.dart';
import 'package:workout/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:union_state/union_state.dart';
import 'my_workouts_screen_widget_model.dart';

@RoutePage(
  name: AppRouteNames.myWorkoutsScreen,
)
class MyWorkoutsScreen extends ElementaryWidget<IMyWorkoutsScreenWidgetModel> {
  const MyWorkoutsScreen({
    required this.loadAgain,
    Key? key,
    WidgetModelFactory wmFactory = myWorkoutsScreenWmFactory,
  }) : super(wmFactory, key: key);
  final VoidCallback loadAgain;

  @override
  Widget build(IMyWorkoutsScreenWidgetModel wm) {
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
            title: 'Мои тренировки',
            onPressed: wm.closeScreen,
          ),
        ),
        body: UnionStateListenableBuilder<List<MyWorkoutData>>(
          unionStateListenable: wm.myWorkoutsState,
          builder: (_, myWorkouts) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: (myWorkouts.length / 2).round(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        wm.openWorkoutInfoScreen.call(myWorkouts[index * 2]);
                                      },
                                      child: Container(
                                        height: 180,
                                        decoration: BoxDecoration(
                                          color: index % 2 == 0 ? AppColors.yellow : AppColors.blue,
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
                                                myWorkouts[index * 2].workoutName,
                                                style: AppTextStyle.medium18.value,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  if (index * 2 + 1 != myWorkouts.length)
                                    Expanded(
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          wm.openWorkoutInfoScreen.call(myWorkouts[index * 2 + 1]);
                                        },
                                        child: Container(
                                          height: 180,
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
                                                  myWorkouts[index * 2 + 1].workoutName,
                                                  style: AppTextStyle.medium18.value,
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
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          loadingBuilder: (_, myWorkouts) => const SizedBox(),
          failureBuilder: (_, exception, myWorkouts) => const SizedBox(),
        ),
      ),
    );
  }
}
