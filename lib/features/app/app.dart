import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:workout/features/common/widgets/di_scope/di_scope.dart';

import 'di/app_scope.dart';

class App extends StatefulWidget {
  final AppScope appScope;

  const App(this.appScope, {super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late IAppScope _scope;

  @override
  void initState() {
    super.initState();
    _scope = widget.appScope..applicationRebuilder = _rebuildApplication;
  }

  void _rebuildApplication() {
    setState(() {
      _scope = widget.appScope..applicationRebuilder = _rebuildApplication;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DiScope<IAppScope>(
      key: ObjectKey(_scope),
      factory: () {
        return _scope;
      },
      child: MaterialApp.router(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ru', 'RU'),
        ],
        routeInformationParser: _scope.router.defaultRouteParser(),
        routerDelegate: _scope.router.delegate(),
      ),
    );
  }
}
