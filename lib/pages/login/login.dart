import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopfee/components/buttons/buttons.dart';
import 'package:shopfee/components/input/text_input.dart';
import 'package:shopfee/consts/colors/colors.dart';
import 'package:shopfee/consts/textStyle/textStyle.dart';
import 'package:shopfee/pages/register/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();

  bool _enabled = false;

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
                title: "Phone Number",
                hint: "input your phone number",
                error: "please",
                inputType: TextInputType.phone,
                autoFocus: false,
                prefix: Text(
                  "+98 ",
                  style: ConstTextStyle.B14R(
                    ConstColors.TextNonActive,
                    height: 1.5,
                  ),
                ),
                onChanged: (string) {
                  if (string.isNotEmpty) {
                    if (string.length >= 10) {
                      setState(() {
                        _enabled = true;
                      });
                    } else {
                      setState(() {
                        _enabled = false;
                      });
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              RectangleButton(
                width: double.infinity,
                height: 48,
                title: "Login",
                coloured: true,
                function: _enabled
                    ? () {
                        print('click');
                      }
                    : null,
              ),
              const SizedBox(
                height: 326,
              ),
              RichText(
                text: TextSpan(
                  text: "Don’t have an account?",
                  style: ConstTextStyle.B14M(ConstColors.TextParagraph),
                  children: [
                    TextSpan(
                      text: " Register",
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
                                      const RegisterPage(),
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
