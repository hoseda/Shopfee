import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopfee/consts/colors/colors.dart';
import 'package:shopfee/consts/textStyle/textStyle.dart';
import 'package:shopfee/pages/onBoarding/on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool run = false;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        setState(() {
          run = true;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnBoarding(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 400),
        curve: Curves.bounceOut,
        opacity: run ? 0 : 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 105,
              child: Image.asset('assets/icons/logo.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Shop',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    color: ConstColors.Brand,
                  ),
                ),
                Text(
                  'fee',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    color: ConstColors.Brand.shade400,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Let us make your day!',
                  style: ConstTextStyle.T16M(ConstColors.NeutralDark),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
