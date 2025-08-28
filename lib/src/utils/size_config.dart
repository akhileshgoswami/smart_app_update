import 'package:flutter/widgets.dart';

/// Minimal SizeConfig placeholder so the package UI can compute sizes.
/// If the host app already has a `SizeConfig`, this file won't clash if import paths differ.
/// This class mirrors a simple pattern you used: init(context), blockSizeVertical, screenWidth.
class SizeConfig {
  static double screenWidth = 360;
  static double screenHeight = 640;
  static double blockSizeVertical = 1;

  void init(BuildContext context) {
    final mq = MediaQuery.of(context);
    screenWidth = mq.size.width;
    screenHeight = mq.size.height;
    blockSizeVertical = screenHeight / 100;
  }
}
