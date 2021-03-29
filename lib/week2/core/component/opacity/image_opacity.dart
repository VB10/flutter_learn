import 'package:flutter/material.dart';

import '../../enum/duration_enum.dart';

class ImageOpacity extends StatefulWidget {
  /// The ImageOpacity base [Image.newtwrok].
  /// Create opacity image
  ///
  /// See also:
  ///
  ///  * [Image.network()], get image from service
  ///  * [AnimatedOpacity], for animation
  ///

  final String url;

  const ImageOpacity({Key? key, required this.url}) : super(key: key);
  @override
  _ImageOpacityState createState() => _ImageOpacityState();
}

class _ImageOpacityState extends State<ImageOpacity> {
  bool _isOpacity = true;

  @override
  void initState() {
    super.initState();
    waitForTime();
  }

  Future<void> waitForTime() async {
    await Future.delayed(DurationEnums.NORMAL.time);
    setState(() {
      _isOpacity = false;
    });
  }

  double get opacityValee => _isOpacity ? 0 : 1;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacityValee,
      duration: DurationEnums.HIGH.time,
      child: Image.network(widget.url),
    );
  }
}
