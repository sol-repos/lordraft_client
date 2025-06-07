import 'package:flutter/material.dart';
import 'package:lordraft_client/core/dependencies.dart';
import 'package:lordraft_client/presentation/pages/host_game_page.dart';
import 'package:lordraft_client/core/theme.dart';
import 'package:lordraft_client/core/util.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isSetupDone = false;

  @override
  void initState() {
    Dependencies.instance.setup().then((_) {
      setState(() {
        isSetupDone = true;
      });
    });
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
      home: isSetupDone ? const HostGamePage() : const _LoadingPage(),
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
