import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;
  double get deviceRatio => MediaQuery.of(this).size.aspectRatio;
  Size get deviceSize => MediaQuery.of(this).size;
}
