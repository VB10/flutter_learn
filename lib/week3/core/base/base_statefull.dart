import 'package:flutter/material.dart';

import '../images/image_constants.dart';
import '../localizate/application_strings.dart';

abstract class BaseStatefull<T extends StatefulWidget> extends State<T> {
  ApplicationStrings applicationStrings = ApplicationStrings.instance;

  TextTheme get textTheme => Theme.of(context).textTheme;
  ThemeData get theme => Theme.of(context);
  ColorScheme get colorSchema => Theme.of(context).colorScheme;

  ImageConstants imageConstants = ImageConstants.instance;

  EdgeInsets insetsAll = EdgeInsets.all(30);

  double dynamichHeight(double val) => MediaQuery.of(context).size.height * val;
}
