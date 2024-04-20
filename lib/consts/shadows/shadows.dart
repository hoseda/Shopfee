// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ConstShadows {
  static BoxShadow Low(Color color) {
    return BoxShadow(
      color: color,
      offset: const Offset(0, 0),
      blurRadius: 4,
      spreadRadius: 0,
    );
  }

  static BoxShadow High(Color color) {
    return BoxShadow(
      color: color,
      offset: const Offset(0, 0),
      blurRadius: 10,
      spreadRadius: 0,
    );
  }
}
