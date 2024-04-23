import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopfee/components/buttons/buttons.dart';
import 'package:shopfee/consts/colors/colors.dart';
import 'package:shopfee/consts/textStyle/textStyle.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  int _box = 0;

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
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _box = index;
                        });
                      },
                      child: AnimatedContainer(
                        width: 60,
                        height: 70,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.fastEaseInToSlowEaseOut,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:
                              index == _box ? null : ConstColors.NeutralMedium,
                          border: index == _box
                              ? Border.all(
                                  color: ConstColors.Brand,
                                  width: 1.5,
                                  strokeAlign: BorderSide.strokeAlignInside,
                                )
                              : null,
                          boxShadow: index == _box
                              ? const [
                                  BoxShadow(
                                    color: ConstColors.Brand,
                                    offset: Offset(0, 0),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    blurStyle: BlurStyle.outer,
                                  ),
                                ]
                              : [],
                        ),
                        //todo : childe
                        // child: TextField(),
                      ),
                    ),
                  );
                },
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
            const RectangleButton(width: 335, height: 48, title: "Confirm"),
          ],
        ),
      ),
    );
  }
}
