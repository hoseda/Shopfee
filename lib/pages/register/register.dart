import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopfee/components/buttons/buttons.dart';
import 'package:shopfee/components/input/text_input.dart';
import 'package:shopfee/consts/colors/colors.dart';
import 'package:shopfee/consts/textStyle/textStyle.dart';
import 'package:shopfee/pages/login/login.dart';
import 'package:shopfee/pages/otpCode/otp_code.dart';
import 'package:shopfee/pages/otpCode/otp_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with TickerProviderStateMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool _name = false;
  bool _phone = false;

  void nameValidator(String string) {
    if (string.isNotEmpty) {
      setState(() {
        _name = true;
      });
    } else {
      setState(() {
        _name = false;
      });
    }
  }

  void phoneValidator(String string) {
    if (string.isNotEmpty) {
      if (string.length >= 5) {
        setState(() {
          _name = true;
        });
      } else {
        setState(() {
          _name = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 180,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 220,
                    height: 100,
                    child: Image.asset('assets/icons/logo2.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 26,
              ),
              TextInputWidget(
                controller: nameController,
                title: "Name",
                hint: "input your name",
                autoFocus: false,
                onChanged: (string) {
                  if (string.isNotEmpty) {
                    if (string.length >= 5) {
                      setState(() {
                        _name = true;
                      });
                    } else {
                      setState(() {
                        _name = false;
                      });
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextInputWidget(
                controller: phoneController,
                title: "Phone Number",
                hint: "input your phone number",
                autoFocus: false,
                onChanged: (string) {
                  if (string.isNotEmpty) {
                    if (string.length >= 10) {
                      setState(() {
                        _phone = true;
                      });
                    } else {
                      setState(() {
                        _phone = false;
                      });
                    }
                  }
                  return null;
                },
                prefix: Text(
                  "+98 ",
                  style: ConstTextStyle.B14R(
                    ConstColors.TextNonActive,
                    height: 1.5,
                  ),
                ),
                inputType: TextInputType.phone,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 242,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'By tapping "Register" you agree to our ',
                    style: ConstTextStyle.B12R(const Color(0xff7C7C7C)),
                    children: [
                      TextSpan(
                        text: "Terms of Use",
                        style: ConstTextStyle.B12R(const Color(0xff032172)),
                      ),
                      TextSpan(
                        text: " and ",
                        style: ConstTextStyle.B12R(const Color(0xff7C7C7C)),
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: ConstTextStyle.B12R(const Color(0xff032172)),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 42,
              ),
              //todo : there is a bug that button should change color when all fields has a valid value
              RectangleButton(
                width: double.infinity,
                height: 48,
                title: "Register",
                coloured: true,
                function: _phone && _name
                    ? () async {
                        Future.delayed(
                          const Duration(milliseconds: 300),
                          () async {
                            await showDialog<void>(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  contentPadding: EdgeInsets.zero,
                                  content: Container(
                                    width: 280,
                                    height: 350,
                                    decoration: BoxDecoration(
                                      color: ConstColors.NeutralLight,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: ConstColors.Brand[50]!,
                                        width: 3,
                                        strokeAlign:
                                            BorderSide.strokeAlignInside,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                        horizontal: 17,
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: 168,
                                            height: 161,
                                            child: Image.asset(
                                                'assets/icons/otp.png'),
                                          ),
                                          const SizedBox(
                                            height: 24,
                                          ),
                                          SizedBox(
                                            height: 64,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Send OTP code',
                                                      style:
                                                          ConstTextStyle.B14M(
                                                        Colors.black,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 0,
                                                    ),
                                                    Text(
                                                      'We will send the OTP code via SMS. Make',
                                                      style:
                                                          ConstTextStyle.B12R(
                                                        ConstColors
                                                            .TextParagraph,
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'sure the number ',
                                                          style: ConstTextStyle
                                                              .B12R(
                                                            ConstColors
                                                                .TextParagraph,
                                                          ),
                                                        ),
                                                        Text(
                                                          "0${phoneController.text}",
                                                          style: ConstTextStyle
                                                              .B12M(
                                                            ConstColors
                                                                .TextHeading,
                                                          ),
                                                        ),
                                                        Text(
                                                          ' is active.',
                                                          style: ConstTextStyle
                                                              .B12R(
                                                            ConstColors
                                                                .TextParagraph,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 23,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RectangleButton(
                                                width: 108,
                                                height: 40,
                                                title: 'Cancel',
                                                coloured: false,
                                                function: () {
                                                  Future.delayed(
                                                    const Duration(
                                                        milliseconds: 200),
                                                    () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  );
                                                },
                                              ),
                                              RectangleButton(
                                                width: 108,
                                                height: 40,
                                                title: 'Confirm',
                                                coloured: true,
                                                function: () {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          OtpLoading(
                                                        number: phoneController
                                                            .text,
                                                        info:
                                                            "we will send you the OTP code.",
                                                        nextPage: OTPPage(
                                                          number:
                                                              phoneController
                                                                  .text,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                    : null,
              ),
              const SizedBox(
                height: 153,
              ),
              RichText(
                text: TextSpan(
                  text: "Have an account?",
                  style: ConstTextStyle.B14M(ConstColors.TextParagraph),
                  children: [
                    TextSpan(
                      text: " Login",
                      style: ConstTextStyle.B14M(ConstColors.Brand),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const LoginPage(),
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
            ],
          ),
        ),
      ),
    );
  }
}
