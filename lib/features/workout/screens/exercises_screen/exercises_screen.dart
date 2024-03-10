import 'package:auto_route/auto_route.dart';
import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/res/images.dart';
import 'package:workout/assets/res/svg_icons.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/widgets/app_app_bar_widget.dart';
import 'package:workout/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:union_state/union_state.dart';

import 'exercises_screen_widget_model.dart';

@RoutePage(
  name: AppRouteNames.exercisesScreen,
)
class ExercisesScreen extends ElementaryWidget<IExercisesScreenWidgetModel> {
  const ExercisesScreen({
    required this.loadAgain,
    Key? key,
    WidgetModelFactory wmFactory = exercisesScreenWmFactory,
  }) : super(wmFactory, key: key);
  final VoidCallback loadAgain;

  @override
  Widget build(IExercisesScreenWidgetModel wm) {
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
              title: 'Упражнения',
              onPressed: wm.closeScreen,
            ),
          ),
          body: UnionStateListenableBuilder<List<ExerciseData>>(
            unionStateListenable: wm.exercisesState,
            builder: (_, exercises) {
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
                            itemCount: (exercises.length / 2).round(),
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
                                          wm.openExerciseScreen.call(exercises[index * 2]);
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
                                                            exercises[index * 2].exerciseName,
                                                            style: AppTextStyle.regular14.value.copyWith(color: AppColors.black),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            wm.saveLike(index * 2);
                                                          },
                                                          child: exercises[index * 2].exerciseLike
                                                              ? SvgPicture.asset(SvgIcons.fillHeart)
                                                              : SvgPicture.asset(SvgIcons.emptyHeart),
                                                        ),
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
                                    if (index * 2 + 1 != exercises.length)
                                      Expanded(
                                        child: InkWell(
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          onTap: () {
                                            wm.openExerciseScreen.call(exercises[index * 2 + 1]);
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
                                                              exercises[index * 2 + 1].exerciseName,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: AppTextStyle.regular14.value.copyWith(color: AppColors.black),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              wm.saveLike(index * 2+1);
                                                            },
                                                            child: exercises[index * 2+1].exerciseLike
                                                                ? SvgPicture.asset(SvgIcons.fillHeart)
                                                                : SvgPicture.asset(SvgIcons.emptyHeart),
                                                          ),
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
            loadingBuilder: (_, exercises) => const SizedBox(),
            failureBuilder: (_, exception, exercises) => const SizedBox(),
          )),
    );
  }
}
