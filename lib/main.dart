import 'package:flutter/material.dart';

import 'week2/post_json_place_holder/post_json_place_holder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: PostJsonPlaceHolder(),
    );
  }
}
