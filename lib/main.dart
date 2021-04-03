import 'package:flutter/material.dart';

import 'week3/core/theme/light_theme.dart';
import 'week3/food_dashboard/food_dashboard_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: LightTheme.instance.data,
      home: FoodDashboardView(),
    );
  }
}
