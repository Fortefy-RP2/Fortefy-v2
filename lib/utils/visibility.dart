import 'package:flutter/material.dart';

class VisibilityUtils {
  static void togglePasswordVisibility({
    required bool isVisible,
    required ValueChanged<bool> onVisibilityChanged,
  }) {
    onVisibilityChanged(!isVisible);
  }
}