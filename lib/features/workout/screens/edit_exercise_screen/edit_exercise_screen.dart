import 'package:auto_route/auto_route.dart';
import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/res/images.dart';
import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/widgets/app_app_bar_widget.dart';
import 'package:workout/features/common/widgets/app_button_widget.dart';
import 'package:workout/features/common/widgets/app_textfield_widget.dart';
import 'package:workout/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'edit_exercise_screen_widget_model.dart';

@RoutePage(
  name: AppRouteNames.editExerciseScreen,
)
class EditExerciseScreen extends ElementaryWidget<IEditExerciseScreenWidgetModel> {
  EditExerciseScreen({
    this.refreshExercise,
    required this.exercise,
    Key? key,
    WidgetModelFactory wmFactory = editExerciseScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  final void Function(ExerciseData exercise)? refreshExercise;
  final ExerciseData exercise;

  final controller = TextEditingController();

  @override
  Widget build(IEditExerciseScreenWidgetModel wm) {
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
            title: 'Редактировать упражнение',
            onPressed: wm.closeScreen,
            /* deleteIcon:SvgIcons.trash,
              onPressedDelete:(){wm.deleteExercise.call(exercise);}*/
          ),
        ),
        body: ValueListenableBuilder<ExerciseData>(
          builder: (context, editExercise, child) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Column(
                    children: [
                      AppTextFieldWidget(controller: wm.exerciseNameController, labelText: 'Название', hintText: 'Введите название'),
                      AppTextFieldWidget(
                        controller: wm.workingWeightController,
                        labelText: 'Рабочий вес',
                        hintText: 'Укажите вес',
                        keyboardType: TextInputType.number,
                      ),
                      AppTextFieldWidget(
                        controller: wm.repetitionsNumberController,
                        labelText: 'Колличество повторений',
                        hintText: 'Укажите колличество '
                            'повторений',
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
                        onPressed: (editExercise.exerciseName.isNotEmpty && editExercise.workingWeight.isNotEmpty && editExercise.repetitionsNumber.isNotEmpty)
                            ? () async {
                                await wm.editExercise();
                              }
                            : null,
                        color: (editExercise.exerciseName.isNotEmpty &&
                                editExercise.workingWeight.isNotEmpty &&
                                editExercise.repetitionsNumber.isNotEmpty &&
                                editExercise.comment.isNotEmpty)
                            ? AppColors.blue
                            : AppColors.white,
                        textColor: (editExercise.exerciseName.isNotEmpty &&
                                editExercise.workingWeight.isNotEmpty &&
                                editExercise.repetitionsNumber.isNotEmpty &&
                                editExercise.comment.isNotEmpty)
                            ? AppColors.black
                            : AppColors.blue,
                        borderColor: (editExercise.exerciseName.isNotEmpty &&
                                editExercise.workingWeight.isNotEmpty &&
                                editExercise.repetitionsNumber.isNotEmpty &&
                                editExercise.comment.isNotEmpty)
                            ? AppColors.blue
                            : AppColors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          valueListenable: wm.exercisesState,
        ),
      ),
    );
  }
}
