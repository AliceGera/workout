// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddExerciseRouter.name: (routeData) {
      final args = routeData.argsAs<AddExerciseRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddExerciseScreen(
          loadAgain: args.loadAgain,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    AddRecordRouter.name: (routeData) {
      final args = routeData.argsAs<AddRecordRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddRecordScreen(
          loadAgain: args.loadAgain,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    AddWorkoutRouter.name: (routeData) {
      final args = routeData.argsAs<AddWorkoutRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddWorkoutScreen(
          loadAgain: args.loadAgain,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    EditExerciseRouter.name: (routeData) {
      final args = routeData.argsAs<EditExerciseRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditExerciseScreen(
          refreshExercise: args.refreshExercise,
          exercise: args.exercise,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    EditWorkoutRouter.name: (routeData) {
      final args = routeData.argsAs<EditWorkoutRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditWorkoutScreen(
          refreshWorkout: args.refreshWorkout,
          myWorkout: args.myWorkout,
          exercises: args.exercises,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    ExerciseRouter.name: (routeData) {
      final args = routeData.argsAs<ExerciseRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExerciseScreen(
          exercise: args.exercise,
          loadAgain: args.loadAgain,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    ExercisesRouter.name: (routeData) {
      final args = routeData.argsAs<ExercisesRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExercisesScreen(
          loadAgain: args.loadAgain,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    FaqRouter.name: (routeData) {
      final args =
          routeData.argsAs<FaqRouterArgs>(orElse: () => const FaqRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FaqScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    MeasurementLogRouter.name: (routeData) {
      final args = routeData.argsAs<MeasurementLogRouterArgs>(
          orElse: () => const MeasurementLogRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MeasurementLogScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    MyWorkoutsAndExercisesRouter.name: (routeData) {
      final args = routeData.argsAs<MyWorkoutsAndExercisesRouterArgs>(
          orElse: () => const MyWorkoutsAndExercisesRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MyWorkoutsAndExercisesScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    MyWorkoutsRouter.name: (routeData) {
      final args = routeData.argsAs<MyWorkoutsRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MyWorkoutsScreen(
          loadAgain: args.loadAgain,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    OnboardingRouter.name: (routeData) {
      final args = routeData.argsAs<OnboardingRouterArgs>(
          orElse: () => const OnboardingRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OnboardingScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    ParametersRouter.name: (routeData) {
      final args = routeData.argsAs<ParametersRouterArgs>(
          orElse: () => const ParametersRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ParametersScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    ScheduleRouter.name: (routeData) {
      final args = routeData.argsAs<ScheduleRouterArgs>(
          orElse: () => const ScheduleRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScheduleScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    SettingsRouter.name: (routeData) {
      final args = routeData.argsAs<SettingsRouterArgs>(
          orElse: () => const SettingsRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    SplashRouter.name: (routeData) {
      final args = routeData.argsAs<SplashRouterArgs>(
          orElse: () => const SplashRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    StartMeasurementsRouter.name: (routeData) {
      final args = routeData.argsAs<StartMeasurementsRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StartMeasurementsScreen(
          loadAgain: args.loadAgain,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    TempRouter.name: (routeData) {
      final args = routeData.argsAs<TempRouterArgs>(
          orElse: () => const TempRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TempScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    WorkoutInfoRouter.name: (routeData) {
      final args = routeData.argsAs<WorkoutInfoRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WorkoutInfoScreen(
          myWorkout: args.myWorkout,
          loadAgain: args.loadAgain,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
  };
}

/// generated route for
/// [AddExerciseScreen]
class AddExerciseRouter extends PageRouteInfo<AddExerciseRouterArgs> {
  AddExerciseRouter({
    required void Function() loadAgain,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = addExerciseScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          AddExerciseRouter.name,
          args: AddExerciseRouterArgs(
            loadAgain: loadAgain,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AddExerciseRouter';

  static const PageInfo<AddExerciseRouterArgs> page =
      PageInfo<AddExerciseRouterArgs>(name);
}

class AddExerciseRouterArgs {
  const AddExerciseRouterArgs({
    required this.loadAgain,
    this.key,
    this.wmFactory = addExerciseScreenWidgetModelFactory,
  });

  final void Function() loadAgain;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'AddExerciseRouterArgs{loadAgain: $loadAgain, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [AddRecordScreen]
class AddRecordRouter extends PageRouteInfo<AddRecordRouterArgs> {
  AddRecordRouter({
    required void Function() loadAgain,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = addRecordScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          AddRecordRouter.name,
          args: AddRecordRouterArgs(
            loadAgain: loadAgain,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AddRecordRouter';

  static const PageInfo<AddRecordRouterArgs> page =
      PageInfo<AddRecordRouterArgs>(name);
}

class AddRecordRouterArgs {
  const AddRecordRouterArgs({
    required this.loadAgain,
    this.key,
    this.wmFactory = addRecordScreenWmFactory,
  });

  final void Function() loadAgain;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'AddRecordRouterArgs{loadAgain: $loadAgain, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [AddWorkoutScreen]
class AddWorkoutRouter extends PageRouteInfo<AddWorkoutRouterArgs> {
  AddWorkoutRouter({
    required void Function() loadAgain,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = addWorkoutScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          AddWorkoutRouter.name,
          args: AddWorkoutRouterArgs(
            loadAgain: loadAgain,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AddWorkoutRouter';

  static const PageInfo<AddWorkoutRouterArgs> page =
      PageInfo<AddWorkoutRouterArgs>(name);
}

class AddWorkoutRouterArgs {
  const AddWorkoutRouterArgs({
    required this.loadAgain,
    this.key,
    this.wmFactory = addWorkoutScreenWidgetModelFactory,
  });

  final void Function() loadAgain;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'AddWorkoutRouterArgs{loadAgain: $loadAgain, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [EditExerciseScreen]
class EditExerciseRouter extends PageRouteInfo<EditExerciseRouterArgs> {
  EditExerciseRouter({
    void Function(ExerciseData)? refreshExercise,
    required ExerciseData exercise,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = editExerciseScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          EditExerciseRouter.name,
          args: EditExerciseRouterArgs(
            refreshExercise: refreshExercise,
            exercise: exercise,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'EditExerciseRouter';

  static const PageInfo<EditExerciseRouterArgs> page =
      PageInfo<EditExerciseRouterArgs>(name);
}

class EditExerciseRouterArgs {
  const EditExerciseRouterArgs({
    this.refreshExercise,
    required this.exercise,
    this.key,
    this.wmFactory = editExerciseScreenWidgetModelFactory,
  });

  final void Function(ExerciseData)? refreshExercise;

  final ExerciseData exercise;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'EditExerciseRouterArgs{refreshExercise: $refreshExercise, exercise: $exercise, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [EditWorkoutScreen]
class EditWorkoutRouter extends PageRouteInfo<EditWorkoutRouterArgs> {
  EditWorkoutRouter({
    required void Function(MyWorkoutData)? refreshWorkout,
    required MyWorkoutData myWorkout,
    required List<ExerciseData> exercises,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = editWorkoutScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          EditWorkoutRouter.name,
          args: EditWorkoutRouterArgs(
            refreshWorkout: refreshWorkout,
            myWorkout: myWorkout,
            exercises: exercises,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'EditWorkoutRouter';

  static const PageInfo<EditWorkoutRouterArgs> page =
      PageInfo<EditWorkoutRouterArgs>(name);
}

class EditWorkoutRouterArgs {
  const EditWorkoutRouterArgs({
    required this.refreshWorkout,
    required this.myWorkout,
    required this.exercises,
    this.key,
    this.wmFactory = editWorkoutScreenWidgetModelFactory,
  });

  final void Function(MyWorkoutData)? refreshWorkout;

  final MyWorkoutData myWorkout;

  final List<ExerciseData> exercises;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'EditWorkoutRouterArgs{refreshWorkout: $refreshWorkout, myWorkout: $myWorkout, exercises: $exercises, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [ExerciseScreen]
class ExerciseRouter extends PageRouteInfo<ExerciseRouterArgs> {
  ExerciseRouter({
    required ExerciseData exercise,
    required void Function() loadAgain,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = exerciseScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          ExerciseRouter.name,
          args: ExerciseRouterArgs(
            exercise: exercise,
            loadAgain: loadAgain,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'ExerciseRouter';

  static const PageInfo<ExerciseRouterArgs> page =
      PageInfo<ExerciseRouterArgs>(name);
}

class ExerciseRouterArgs {
  const ExerciseRouterArgs({
    required this.exercise,
    required this.loadAgain,
    this.key,
    this.wmFactory = exerciseScreenWmFactory,
  });

  final ExerciseData exercise;

  final void Function() loadAgain;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'ExerciseRouterArgs{exercise: $exercise, loadAgain: $loadAgain, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [ExercisesScreen]
class ExercisesRouter extends PageRouteInfo<ExercisesRouterArgs> {
  ExercisesRouter({
    required void Function() loadAgain,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = exercisesScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          ExercisesRouter.name,
          args: ExercisesRouterArgs(
            loadAgain: loadAgain,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'ExercisesRouter';

  static const PageInfo<ExercisesRouterArgs> page =
      PageInfo<ExercisesRouterArgs>(name);
}

class ExercisesRouterArgs {
  const ExercisesRouterArgs({
    required this.loadAgain,
    this.key,
    this.wmFactory = exercisesScreenWmFactory,
  });

  final void Function() loadAgain;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'ExercisesRouterArgs{loadAgain: $loadAgain, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [FaqScreen]
class FaqRouter extends PageRouteInfo<FaqRouterArgs> {
  FaqRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = faqScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          FaqRouter.name,
          args: FaqRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'FaqRouter';

  static const PageInfo<FaqRouterArgs> page = PageInfo<FaqRouterArgs>(name);
}

class FaqRouterArgs {
  const FaqRouterArgs({
    this.key,
    this.wmFactory = faqScreenWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'FaqRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [MeasurementLogScreen]
class MeasurementLogRouter extends PageRouteInfo<MeasurementLogRouterArgs> {
  MeasurementLogRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = measurementLogScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          MeasurementLogRouter.name,
          args: MeasurementLogRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'MeasurementLogRouter';

  static const PageInfo<MeasurementLogRouterArgs> page =
      PageInfo<MeasurementLogRouterArgs>(name);
}

class MeasurementLogRouterArgs {
  const MeasurementLogRouterArgs({
    this.key,
    this.wmFactory = measurementLogScreenWmFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'MeasurementLogRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [MyWorkoutsAndExercisesScreen]
class MyWorkoutsAndExercisesRouter
    extends PageRouteInfo<MyWorkoutsAndExercisesRouterArgs> {
  MyWorkoutsAndExercisesRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = myWorkoutsAndExercisesScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          MyWorkoutsAndExercisesRouter.name,
          args: MyWorkoutsAndExercisesRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'MyWorkoutsAndExercisesRouter';

  static const PageInfo<MyWorkoutsAndExercisesRouterArgs> page =
      PageInfo<MyWorkoutsAndExercisesRouterArgs>(name);
}

class MyWorkoutsAndExercisesRouterArgs {
  const MyWorkoutsAndExercisesRouterArgs({
    this.key,
    this.wmFactory = myWorkoutsAndExercisesScreenWmFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'MyWorkoutsAndExercisesRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [MyWorkoutsScreen]
class MyWorkoutsRouter extends PageRouteInfo<MyWorkoutsRouterArgs> {
  MyWorkoutsRouter({
    required void Function() loadAgain,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = myWorkoutsScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          MyWorkoutsRouter.name,
          args: MyWorkoutsRouterArgs(
            loadAgain: loadAgain,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'MyWorkoutsRouter';

  static const PageInfo<MyWorkoutsRouterArgs> page =
      PageInfo<MyWorkoutsRouterArgs>(name);
}

class MyWorkoutsRouterArgs {
  const MyWorkoutsRouterArgs({
    required this.loadAgain,
    this.key,
    this.wmFactory = myWorkoutsScreenWmFactory,
  });

  final void Function() loadAgain;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'MyWorkoutsRouterArgs{loadAgain: $loadAgain, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRouter extends PageRouteInfo<OnboardingRouterArgs> {
  OnboardingRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = onboardingScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          OnboardingRouter.name,
          args: OnboardingRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'OnboardingRouter';

  static const PageInfo<OnboardingRouterArgs> page =
      PageInfo<OnboardingRouterArgs>(name);
}

class OnboardingRouterArgs {
  const OnboardingRouterArgs({
    this.key,
    this.wmFactory = onboardingScreenWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'OnboardingRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [ParametersScreen]
class ParametersRouter extends PageRouteInfo<ParametersRouterArgs> {
  ParametersRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = parametersScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          ParametersRouter.name,
          args: ParametersRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'ParametersRouter';

  static const PageInfo<ParametersRouterArgs> page =
      PageInfo<ParametersRouterArgs>(name);
}

class ParametersRouterArgs {
  const ParametersRouterArgs({
    this.key,
    this.wmFactory = parametersScreenWmFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'ParametersRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [ScheduleScreen]
class ScheduleRouter extends PageRouteInfo<ScheduleRouterArgs> {
  ScheduleRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = scheduleScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          ScheduleRouter.name,
          args: ScheduleRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'ScheduleRouter';

  static const PageInfo<ScheduleRouterArgs> page =
      PageInfo<ScheduleRouterArgs>(name);
}

class ScheduleRouterArgs {
  const ScheduleRouterArgs({
    this.key,
    this.wmFactory = scheduleScreenWmFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'ScheduleRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRouter extends PageRouteInfo<SettingsRouterArgs> {
  SettingsRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = settingsScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsRouter.name,
          args: SettingsRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'SettingsRouter';

  static const PageInfo<SettingsRouterArgs> page =
      PageInfo<SettingsRouterArgs>(name);
}

class SettingsRouterArgs {
  const SettingsRouterArgs({
    this.key,
    this.wmFactory = settingsScreenWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'SettingsRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRouter extends PageRouteInfo<SplashRouterArgs> {
  SplashRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = splashWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          SplashRouter.name,
          args: SplashRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'SplashRouter';

  static const PageInfo<SplashRouterArgs> page =
      PageInfo<SplashRouterArgs>(name);
}

class SplashRouterArgs {
  const SplashRouterArgs({
    this.key,
    this.wmFactory = splashWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'SplashRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [StartMeasurementsScreen]
class StartMeasurementsRouter
    extends PageRouteInfo<StartMeasurementsRouterArgs> {
  StartMeasurementsRouter({
    required void Function() loadAgain,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = startMeasurementsScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          StartMeasurementsRouter.name,
          args: StartMeasurementsRouterArgs(
            loadAgain: loadAgain,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'StartMeasurementsRouter';

  static const PageInfo<StartMeasurementsRouterArgs> page =
      PageInfo<StartMeasurementsRouterArgs>(name);
}

class StartMeasurementsRouterArgs {
  const StartMeasurementsRouterArgs({
    required this.loadAgain,
    this.key,
    this.wmFactory = startMeasurementsScreenWmFactory,
  });

  final void Function() loadAgain;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'StartMeasurementsRouterArgs{loadAgain: $loadAgain, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [TempScreen]
class TempRouter extends PageRouteInfo<TempRouterArgs> {
  TempRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = initScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          TempRouter.name,
          args: TempRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'TempRouter';

  static const PageInfo<TempRouterArgs> page = PageInfo<TempRouterArgs>(name);
}

class TempRouterArgs {
  const TempRouterArgs({
    this.key,
    this.wmFactory = initScreenWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'TempRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [WorkoutInfoScreen]
class WorkoutInfoRouter extends PageRouteInfo<WorkoutInfoRouterArgs> {
  WorkoutInfoRouter({
    required MyWorkoutData myWorkout,
    required void Function() loadAgain,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = workoutInfoScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          WorkoutInfoRouter.name,
          args: WorkoutInfoRouterArgs(
            myWorkout: myWorkout,
            loadAgain: loadAgain,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'WorkoutInfoRouter';

  static const PageInfo<WorkoutInfoRouterArgs> page =
      PageInfo<WorkoutInfoRouterArgs>(name);
}

class WorkoutInfoRouterArgs {
  const WorkoutInfoRouterArgs({
    required this.myWorkout,
    required this.loadAgain,
    this.key,
    this.wmFactory = workoutInfoScreenWmFactory,
  });

  final MyWorkoutData myWorkout;

  final void Function() loadAgain;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'WorkoutInfoRouterArgs{myWorkout: $myWorkout, loadAgain: $loadAgain, key: $key, wmFactory: $wmFactory}';
  }
}
