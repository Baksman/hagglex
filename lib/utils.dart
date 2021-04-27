import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  double get appHeight => MediaQuery.of(this).size.height;
  double get appWidth => MediaQuery.of(this).size.width;
}
