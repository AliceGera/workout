import 'package:workout/features/app/di/app_scope.dart';
import 'package:workout/features/common/domain/data/my_workout/my_workout_data.dart';
import 'package:workout/features/navigation/service/router.dart';
import 'package:workout/features/workout/screens/my_workouts_screen/my_workouts_screen.dart';
import 'package:workout/features/workout/screens/my_workouts_screen/my_workouts_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_state/union_state.dart';

MyWorkoutsScreenWidgetModel myWorkoutsScreenWmFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final model = MyWorkoutsScreenModel(
    appScope.myWorkoutsService,
  );

  return MyWorkoutsScreenWidgetModel(
    model,
    appScope.router,
  );
}

class MyWorkoutsScreenWidgetModel extends WidgetModel<MyWorkoutsScreen, MyWorkoutsScreenModel> implements IMyWorkoutsScreenWidgetModel {
  final AppRouter _router;

  MyWorkoutsScreenWidgetModel(
    super._model,
    this._router,
  );

  final _myWorkoutsState = UnionStateNotifier<List<MyWorkoutData>>([]);
  void Function()? _updateWorkout;

  @override
  void initWidgetModel() {
    final args = _router.current.args is MyWorkoutsRouterArgs ? _router.current.args! as MyWorkoutsRouterArgs : null;
    if (args != null) {
      _updateWorkout = args.loadAgain;
    }
    getMyWorkouts();
    super.initWidgetModel();
  }

  Future<void> getMyWorkouts() async {
    _myWorkoutsState.loading();
    try {
      final myWorkouts = await model.getMyWorkouts();
      _myWorkoutsState.content(myWorkouts);
    } on Exception catch (e) {
      _myWorkoutsState.failure(e);
    }
  }

  @override
  void loadAgain() {
    getMyWorkouts();
  }

  @override
  void openWorkoutInfoScreen(MyWorkoutData myWorkout) {
    _router.push(
      WorkoutInfoRouter(
        loadAgain: () {
          _updateWorkout?.call();
          loadAgain.call();
        },
        myWorkout: myWorkout,
      ),
    );
  }

  @override
  void closeScreen() {
    _router.pop();
  }

  @override
  UnionStateNotifier<List<MyWorkoutData>> get myWorkoutsState => _myWorkoutsState;
}

abstract class IMyWorkoutsScreenWidgetModel implements IWidgetModel {
  void loadAgain();

  void openWorkoutInfoScreen(MyWorkoutData myWorkout);

  void closeScreen();

  UnionStateNotifier<List<MyWorkoutData>> get myWorkoutsState;
}
