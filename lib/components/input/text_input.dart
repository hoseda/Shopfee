import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopfee/consts/colors/colors.dart';
import 'package:shopfee/consts/shadows/shadows.dart';
import 'package:shopfee/consts/textStyle/textStyle.dart';

class TextInputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? title;
  final String? hint;
  final String? error;
  final bool? autoFocus;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? inputType;
  final Function(String string)? onChanged;

  const TextInputWidget({
    super.key,
    required this.controller,
    this.title,
    this.hint,
    this.autoFocus,
    this.onChanged,
    this.inputType,
    this.prefix,
    this.suffix,
    this.error,
  });

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  FocusNode focus = FocusNode();
  bool _isClicked = false;

  @override
  void initState() {
    focus.addListener(
      () {
        setState(() {
          _isClicked = focus.hasFocus ? true : false;
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  bool get isNotEmpty => widget.controller.value.text.isNotEmpty ? true : false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title ?? "",
            style: ConstTextStyle.B14R(ConstColors.TextHeading),
          ),
          const SizedBox(
            height: 4,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            decoration: BoxDecoration(
              boxShadow: _isClicked
                  ? [
                      ConstShadows.Low(
                        const Color(0xff9F4A00),
                      ),
                    ]
                  : null,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextFormField(
              controller: widget.controller,
              focusNode: focus,
              autofocus: widget.autoFocus ?? false,
              keyboardType: widget.inputType ?? TextInputType.text,
              textAlign: TextAlign.left,
              style: ConstTextStyle.B14R(ConstColors.TextHeading, height: 1.5),
              onTapOutside: (event) {
                setState(() {
                  focus.unfocus();
                  _isClicked = false;
                });
              },
              onTap: () {
                if (focus.hasPrimaryFocus) {
                  setState(() {
                    _isClicked = true;
                  });
                }
              },
              onChanged: widget.onChanged,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              //todo : here validator
              cursorColor: const Color(0xff8A8A8A),
              cursorHeight: 20,
              inputFormatters: [
                LengthLimitingTextInputFormatter(
                  widget.inputType == TextInputType.phone ? 10 : null,
                ),
              ],
              decoration: InputDecoration(
                prefixIcon: focus.hasFocus && widget.prefix != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          bottom: 14,
                          left: 20,
                        ),
                        child: widget.prefix,
                      )
                    : null,
                suffixIcon: widget.suffix,
                constraints: const BoxConstraints(maxHeight: 48),
                fillColor: Colors.white,
                filled: true,
                hintText: _isClicked ? null : widget.hint,
                hintStyle: ConstTextStyle.B14R(
                  const Color(0xff8A8A8A),
                  height: 1.75,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0xffD0D0D0),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: ConstColors.Brand,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
