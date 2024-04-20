// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';

enum Weights {
  regular,
  medium,
  bold;
}

class FontDetails {
  final double size;
  final double lineHeight;

  double get Size => size;
  double get LineHeight => lineHeight;

  const FontDetails({
    required this.size,
    required this.lineHeight,
  });
}

class FontGenerator {
  final FontDetails details;
  final Weights weight;

  FontGenerator(this.details, this.weight);

  TextStyle Generate(Color color) {
    FontWeight w = FontWeight.w400;

    if (weight == Weights.bold) {
      w = FontWeight.w700;
    } else if (weight == Weights.medium) {
      w = FontWeight.w500;
    }

    return TextStyle(
      fontFamily: "Poppins",
      color: color,
      height: details.LineHeight,
      fontSize: details.Size,
      fontWeight: w,
    );
  }
}

class ConstTextStyle {
  //{first letter of Font name}{font size}{font weight}
  //  {H : heading , T : title , B : body}

  // heading text styles
  // 20
  static TextStyle H20R(Color color, {double height = 3}) {
    FontDetails details = FontDetails(size: 20, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.regular).Generate(color);
    return style;
  }

  static TextStyle H20M(Color color, {double height = 3}) {
    FontDetails details = FontDetails(size: 20, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.medium).Generate(color);
    return style;
  }

  static TextStyle H20B(Color color, {double height = 3}) {
    FontDetails details = FontDetails(size: 20, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.bold).Generate(color);
    return style;
  }
  // 24

  static TextStyle H24R(Color color, {double height = 3.8}) {
    FontDetails details = FontDetails(size: 24, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.regular).Generate(color);
    return style;
  }

  static TextStyle H24M(Color color, {double height = 3.8}) {
    FontDetails details = FontDetails(size: 24, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.regular).Generate(color);
    return style;
  }

  static TextStyle H24B(Color color, {double height = 3.8}) {
    FontDetails details = FontDetails(size: 24, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.regular).Generate(color);
    return style;
  }

  // title text style
  // 16
  static TextStyle T16R(Color color, {double height = 2.4}) {
    FontDetails details = FontDetails(size: 16, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.regular).Generate(color);
    return style;
  }

  static TextStyle T16M(Color color, {double height = 2.4}) {
    FontDetails details = FontDetails(size: 16, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.medium).Generate(color);
    return style;
  }

  static TextStyle T16B(Color color, {double height = 2.4}) {
    FontDetails details = FontDetails(size: 16, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.bold).Generate(color);
    return style;
  }

  // 18
  static TextStyle T18R(Color color, {double height = 2.6}) {
    FontDetails details = FontDetails(size: 18, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.regular).Generate(color);
    return style;
  }

  static TextStyle T18M(Color color, {double height = 2.6}) {
    FontDetails details = FontDetails(size: 18, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.medium).Generate(color);
    return style;
  }

  static TextStyle T18B(Color color, {double height = 2.6}) {
    FontDetails details = FontDetails(size: 18, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.bold).Generate(color);
    return style;
  }

  // body text style
  // 10
  static TextStyle B10R(Color color, {double height = 1.4}) {
    FontDetails details = FontDetails(size: 10, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.regular).Generate(color);
    return style;
  }

  static TextStyle B10M(Color color, {double height = 1.4}) {
    FontDetails details = FontDetails(size: 10, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.medium).Generate(color);
    return style;
  }

  static TextStyle B10B(Color color, {double height = 1.4}) {
    FontDetails details = FontDetails(size: 10, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.bold).Generate(color);
    return style;
  }

  // 12
  static TextStyle B12R(Color color, {double height = 1.8}) {
    FontDetails details = FontDetails(size: 12, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.regular).Generate(color);
    return style;
  }

  static TextStyle B12M(Color color, {double height = 1.8}) {
    FontDetails details = FontDetails(size: 12, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.medium).Generate(color);
    return style;
  }

  static TextStyle B12B(Color color, {double height = 1.8}) {
    FontDetails details = FontDetails(size: 12, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.bold).Generate(color);
    return style;
  }

  // 14
  static TextStyle B14R(Color color, {double height = 2.0}) {
    FontDetails details = FontDetails(size: 14, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.regular).Generate(color);
    return style;
  }

  static TextStyle B14M(Color color, {double height = 2.0}) {
    FontDetails details = FontDetails(size: 14, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.medium).Generate(color);
    return style;
  }

  static TextStyle B14B(Color color, {double height = 2.0}) {
    FontDetails details = FontDetails(size: 14, lineHeight: height);
    TextStyle style = FontGenerator(details, Weights.bold).Generate(color);
    return style;
  }
}
