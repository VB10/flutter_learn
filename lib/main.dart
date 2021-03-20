import 'package:flutter/material.dart';

import 'week1/welcome/welcome_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: WelcomeView(),
    );
  }
}
