import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:lordraft_client/presentation/pages/debug_start_page.dart';
import 'package:lordraft_client/presentation/states/app_startup_state.dart';
import 'package:lordraft_client/core/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    June.getState(() => AppStartupState()).setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(
      context,
      "Noto Sans",
      "Noto Sans Runic",
    );
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'LoR Cube Draft',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: JuneBuilder(
        () => AppStartupState(),
        builder: (state) {
          if (!state.isSetupDone) {
            return const _LoadingPage();
          }
          return const DebugStartPage();
        },
      ),
    );
  }
}

class _LoadingPage extends StatelessWidget {
  const _LoadingPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Loading...', style: TextTheme.of(context).displayMedium),
      ),
    );
  }
}
