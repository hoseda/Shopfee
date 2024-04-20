import 'package:flutter/material.dart';
import 'package:shopfee/consts/colors/colors.dart';
import 'package:shopfee/consts/textStyle/textStyle.dart';

class RectangleButton extends StatefulWidget {
  final double width;
  final double height;
  final String title;
  final bool? coloured;
  final Function()? function;
  const RectangleButton({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    this.function,
    this.coloured = true,
  });

  @override
  State<RectangleButton> createState() => _RectangleButtonState();
}

class _RectangleButtonState extends State<RectangleButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextButton(
        onPressed: widget.function,
        style: ButtonStyle(
          alignment: Alignment.center,
          animationDuration: const Duration(milliseconds: 400),
          overlayColor: widget.coloured!
              ? MaterialStateProperty.all(Colors.white10.withAlpha(40))
              : MaterialStateProperty.all(ConstColors.Brand[500]),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return ConstColors.TextDisabled;
              } else if (widget.coloured!) {
                return ConstColors.Brand;
              } else {
                return ConstColors.NeutralLight;
              }
            },
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: widget.coloured!
                  ? BorderSide.none
                  : const BorderSide(
                      color: ConstColors.Brand,
                      width: 1.6,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
            ),
          ),
        ),
        child: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: ConstTextStyle.B14M(
              widget.coloured!
                  ? ConstColors.NeutralLight
                  : ConstColors.TextHeading,
            ),
          ),
        ),
      ),
    );
  }
}
