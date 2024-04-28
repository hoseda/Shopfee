import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopfee/components/buttons/buttons.dart';
import 'package:shopfee/consts/colors/colors.dart';
import 'package:shopfee/consts/textStyle/textStyle.dart';
import 'package:shopfee/pages/otpCode/otp_code.dart';
import 'package:shopfee/pages/pin/pin_page.dart';

class OTPPage extends StatefulWidget {
  final String number;
  const OTPPage({
    super.key,
    required this.number,
  });

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  List code = [];

  Widget _textFieldOTP(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        height: 70,
        width: 60,
        child: TextField(
          autofocus: true,
          enableInteractiveSelection: false,
          contextMenuBuilder: null,
          onChanged: (value) {
            if (value.length == 1) {
              setState(() {
                code.insert(index, value);
              });
              if (index < 4) {
                FocusScope.of(context).nextFocus();
              }
            }
            if (value.isEmpty) {
              setState(() {
                code.removeAt(index);
              });
              if (index > 0) {
                FocusScope.of(context).previousFocus();
              }
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: RectangleButton(
          width: 335,
          height: 48,
          title: "Confirm",
          function: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpLoading(
                  number: widget.number,
                  info: "We are processing your account",
                  nextPage: const PinCodePage(),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Padding(
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
                          "0${widget.number}",
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _textFieldOTP(0),
                    _textFieldOTP(1),
                    _textFieldOTP(2),
                    _textFieldOTP(3),
                    _textFieldOTP(4),
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
                height: 335,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
