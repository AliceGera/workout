import 'dart:async';
import 'package:workout/features/app/di/app_scope.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/app/app.dart';

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await _runApp();
}

Future<void> _runApp() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final scope = AppScope(sharedPreferences);
  runApp(App(scope));
}
