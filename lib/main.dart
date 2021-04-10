import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

import 'week3/core/theme/light_theme.dart';
import 'week4/feature/task/view/task_view.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env'); //
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: LightTheme.instance.data,
      home: TaskView(),
    );
  }
}
