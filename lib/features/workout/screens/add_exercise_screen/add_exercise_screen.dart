import 'package:auto_route/auto_route.dart';
import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/res/images.dart';
import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/widgets/app_app_bar_widget.dart';
import 'package:workout/features/common/widgets/app_button_widget.dart';
import 'package:workout/features/common/widgets/app_textfield_widget.dart';
import 'package:workout/features/navigation/domain/entity/app_route_names.dart';
import 'package:workout/features/workout/screens/add_exercise_screen/add_exercise_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

@RoutePage(
  name: AppRouteNames.addExerciseScreen,
)
class AddExerciseScreen extends ElementaryWidget<IAddExerciseScreenWidgetModel> {
  AddExerciseScreen({
    required this.loadAgain,
    Key? key,
    WidgetModelFactory wmFactory = addExerciseScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  final VoidCallback loadAgain;
  final controller = TextEditingController();

  @override
  Widget build(IAddExerciseScreenWidgetModel wm) {
    return Container(
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
            title: 'Создать упражнение',
            onPressed: wm.closeScreen,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: ValueListenableBuilder<ExerciseData>(
                builder: (context, exercise, child) {
                  return Column(
                    children: [
                      AppTextFieldWidget(
                        controller: wm.exerciseNameController,
                        labelText: 'Название',
                        hintText: 'Введите название',
                      ),
                      AppTextFieldWidget(
                        controller: wm.workingWeightController,
                        labelText: 'Рабочий вес',
                        hintText: 'Укажите вес',
                        keyboardType: TextInputType.number,
                      ),
                      AppTextFieldWidget(
                        controller: wm.repetitionsNumberController,
                        labelText: 'Колличество повторений',
                        hintText: 'Укажите колличество повторений',
                        keyboardType: TextInputType.number,
                      ),
                      AppTextFieldWidget(
                        controller: wm.commentController,
                        labelText: 'Комментарий к выполнению',
                        hintText: 'Укажите комментарий',
                        lines: 2,
                      ),
                      AppButtonWidget(
                        title: 'Сохранить',
                        onPressed: (exercise.exerciseName.isNotEmpty &&
                                exercise.workingWeight.isNotEmpty &&
                                exercise.repetitionsNumber.isNotEmpty )
                            ? () async {
                                await wm.addExercise();
                                loadAgain.call();
                              }
                            : null,
                        color: (exercise.exerciseName.isNotEmpty &&
                            exercise.workingWeight.isNotEmpty &&
                            exercise.repetitionsNumber.isNotEmpty &&
                            exercise.comment.isNotEmpty)
                            ? AppColors.blue
                            : AppColors.white,
                        textColor: (exercise.exerciseName.isNotEmpty &&
                            exercise.workingWeight.isNotEmpty &&
                            exercise.repetitionsNumber.isNotEmpty &&
                            exercise.comment.isNotEmpty)
                            ? AppColors.black
                            : AppColors.blue,
                        borderColor: (exercise.exerciseName.isNotEmpty &&
                            exercise.workingWeight.isNotEmpty &&
                            exercise.repetitionsNumber.isNotEmpty &&
                            exercise.comment.isNotEmpty)
                            ? AppColors.blue
                            : AppColors.blue,
                      ),
                    ],
                  );
                },
                valueListenable: wm.exercisesState,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
