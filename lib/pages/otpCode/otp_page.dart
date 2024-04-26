import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopfee/components/buttons/buttons.dart';
import 'package:shopfee/consts/colors/colors.dart';
import 'package:shopfee/consts/textStyle/textStyle.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController con = TextEditingController();
  List<String> code = List.empty(growable: true);

  int findKey(String char) {
    int idx = code.lastIndexWhere((element) => element == char);
    return idx;
  }

  void prin() {
    print(code.length);
  }

  Widget _textFieldOTP(bool first, bool last) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        height: 70,
        width: 60,
        //todo:tomorow
        child: TextField(
          autofocus: true,
          enableInteractiveSelection: false,
          contextMenuBuilder: null,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              code.add(value);
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              int id = findKey(value);
              code.removeAt(id);
              print(code.length);
              FocusScope.of(context).previousFocus();
            }
          },
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: ConstColors.TextHeading,
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.5,
                color: ConstColors.Brand,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 2,
                color: Colors.transparent,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: ConstColors.NeutralMedium,
            contentPadding: const EdgeInsets.symmetric(vertical: 5),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: ConstColors.TextHeading,
        surfaceTintColor: ConstColors.NeutralLight,
        elevation: 2.8,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: ConstColors.TextHeading,
          ),
        ),
        title: Text(
          "Confirm OTP code",
          style: ConstTextStyle.T16M(ConstColors.TextHeading),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 63,
                      child: Text(
                        "081234567891",
                        style: ConstTextStyle.H24M(ConstColors.TextHeading),
                      ),
                    ),
                    Text(
                      "Enter the 5-digit OTP code that has been sent from SMS\n to complete your account registration",
                      style: ConstTextStyle.B12R(ConstColors.TextHeading),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  _textFieldOTP(true, false),
                  _textFieldOTP(false, false),
                  _textFieldOTP(false, false),
                  _textFieldOTP(false, false),
                  _textFieldOTP(false, true),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            RichText(
              text: TextSpan(
                text: "Haven't got the confirmation code yet?",
                style: ConstTextStyle.B12R(Colors.black),
                children: [
                  TextSpan(
                    text: " Resend",
                    style: ConstTextStyle.B12M(ConstColors.SemanticInfo),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const Center(),
                            transitionsBuilder: (
                              context,
                              animation,
                              secondaryAnimation,
                              child,
                            ) {
                              var curve = Curves.ease;
                              var tween = Tween(
                                begin: const Offset(1.0, 0.0),
                                end: Offset.zero,
                              ).chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 102,
            ),
            RectangleButton(
              width: 335,
              height: 48,
              title: "Confirm",
              function: () {
                prin();
              },
            ),
          ],
        ),
      ),
    );
  }
}
