import 'package:auto_route/auto_route.dart';
import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/res/images.dart';
import 'package:workout/assets/res/svg_icons.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:workout/features/common/domain/data/exercise/exercise_data.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:workout/features/common/widgets/app_app_bar_widget.dart';
import 'package:workout/features/common/widgets/app_button_widget.dart';
import 'package:workout/features/common/widgets/app_textfield_widget.dart';
import 'package:workout/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:union_state/union_state.dart';
import 'edit_workout_screen_widget_model.dart';

@RoutePage(
  name: AppRouteNames.editWorkoutScreen,
)
class EditWorkoutScreen extends ElementaryWidget<EditWorkoutScreenWidgetModel> {
  const EditWorkoutScreen({
    required this.refreshWorkout,
    required this.myWorkout,
    required this.exercises,
    Key? key,
    WidgetModelFactory wmFactory = editWorkoutScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  final void Function(MyWorkoutData myWorkout)? refreshWorkout;
  final MyWorkoutData myWorkout;
  final List<ExerciseData> exercises;

  @override
  Widget build(IEditWorkoutScreenWidgetModel wm) {
    return Builder(builder: (context) {
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
                title: 'Редактировать тренировку',
                onPressed: wm.closeScreen,
                /*deleteIcon: SvgIcons.trash,
                onPressedDelete: () {
                  wm.deleteWorkout.call(myWorkout);
                }*/),
          ),
          body: UnionStateListenableBuilder<List<ExerciseData>>(
            unionStateListenable: wm.exercisesState,
            builder: (_, exercises) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: AppTextFieldWidget(
                                controller: wm.workoutNameController,
                                labelText: 'Название',
                                hintText: 'Введите название',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: ValueListenableBuilder<List<ExerciseData>>(
                                valueListenable: wm.selectedExerciseListState,
                                builder: (context, selectedExercises, child) {
                                  return ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: selectedExercises.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 6),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: AppColors.blue),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      selectedExercises[index].exerciseName,
                                                      style: AppTextStyle.regular14.value,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(right: 4),
                                                          child: SvgPicture.asset(SvgIcons.weight),
                                                        ),
                                                        Text(
                                                          selectedExercises[index].workingWeight,
                                                          style: AppTextStyle.regular14.value,
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(right: 4),
                                                          child: SvgPicture.asset(SvgIcons.restart),
                                                        ),
                                                        Text(
                                                          selectedExercises[index].repetitionsNumber,
                                                          style: AppTextStyle.regular14.value,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                InkWell(
                                                  highlightColor: Colors.transparent,
                                                  splashColor: Colors.transparent,
                                                  onTap: () {
                                                    wm.removeExercise(selectedExercises[index]);
                                                  },
                                                  child: SvgPicture.asset(SvgIcons.trash),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: AppButtonWidget(
                                title: 'Добавить упражнения',
                                onPressed: () async {
                                  final isSaved = await showDialog<bool>(
                                    context: context,
                                    builder: (ctx) => AddWorkoutDialogWidget(
                                      exercises: exercises,
                                      tapOnCheckBoxExercise: wm.tapOnCheckBoxExercise,
                                      selectedExerciseListState: wm.selectedExerciseListState,
                                    ),
                                  );
                                  wm.saveOrClearSelectedExerciseList(isSaved ?? false);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      ValueListenableBuilder<MyWorkoutData>(
                        valueListenable: wm.myWorkoutState,
                        builder: (context, myWorkout, child) {
                          return AppButtonWidget(
                            title: 'Сохранить',
                            onPressed: (myWorkout.workoutName.isNotEmpty)
                                ? () async {
                                    await wm.editWorkout();
                                  }
                                : null,
                            color: (myWorkout.workoutName.isNotEmpty) ? AppColors.blue : AppColors.white,
                            textColor: (myWorkout.workoutName.isNotEmpty) ? AppColors.black : AppColors.blue,
                            borderColor: (myWorkout.workoutName.isNotEmpty) ? AppColors.blue : AppColors.blue,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            loadingBuilder: (_, exercises) => const SizedBox(),
            failureBuilder: (_, exception, exercises) => const SizedBox(),
          ),
        ),
      );
    });
  }
}

class AddWorkoutDialogWidget extends StatelessWidget {
  const AddWorkoutDialogWidget({
    super.key,
    required this.tapOnCheckBoxExercise,
    required this.exercises,
    required this.selectedExerciseListState,
  });

  final void Function(ExerciseData, bool) tapOnCheckBoxExercise;
  final List<ExerciseData> exercises;
  final ValueNotifier<List<ExerciseData>> selectedExerciseListState;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        height: 340,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Добавить упражнения',
                  style: AppTextStyle.medium28.value.copyWith(color: AppColors.blue),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SingleChildScrollView(
                      child: ValueListenableBuilder<List<ExerciseData>>(
                        valueListenable: selectedExerciseListState,
                        builder: (context, selectedExerciseList, child) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.blue),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: exercises.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            exercises[index].exerciseName,
                                            style: AppTextStyle.regular14.value,
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(right: 4),
                                                child: SvgPicture.asset(SvgIcons.weight),
                                              ),
                                              Text(
                                                exercises[index].workingWeight,
                                                style: AppTextStyle.regular14.value,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 4),
                                                child: SvgPicture.asset(SvgIcons.restart),
                                              ),
                                              Text(
                                                exercises[index].repetitionsNumber,
                                                style: AppTextStyle.regular14.value,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      CheckboxWidget(
                                        tapOnCheckBoxExercise: (bool checkBoxState) {
                                          tapOnCheckBoxExercise.call(
                                            exercises[index],
                                            checkBoxState,
                                          );
                                        },
                                        isSelected: selectedExerciseList.contains(exercises[index]),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    AppButtonWidget(
                      title: 'Закрыть',
                      color: AppColors.white,
                      borderColor: AppColors.blue,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Spacer(),
                    AppButtonWidget(
                      title: 'Выбрать',
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({
    required this.tapOnCheckBoxExercise,
    required this.isSelected,
    super.key,
  });

  final bool isSelected;
  final void Function(bool) tapOnCheckBoxExercise;

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Colors.white;
    }

    return Checkbox(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(4.0),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      checkColor: Colors.black,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isSelected,
      onChanged: (bool? value) {
        widget.tapOnCheckBoxExercise.call(value ?? false);
        setState(() {
          isSelected = value ?? false;
        });
      },
    );
  }
}
