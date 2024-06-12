import 'package:flutter/material.dart';
import 'package:flutter_exam/app/app_theme.dart';
import 'package:flutter_exam/core/app_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppRouter _appRouter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appRouter = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.getInstance().getTheme(),
      routerConfig: _appRouter.config(),
    );
  }
}
