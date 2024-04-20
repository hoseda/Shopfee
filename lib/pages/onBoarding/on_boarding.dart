import 'package:flutter/material.dart';
import 'package:shopfee/consts/colors/colors.dart';
import 'package:shopfee/consts/textStyle/textStyle.dart';
import 'package:shopfee/pages/register/register.dart';
import 'package:shopfee/pages/onBoarding/on_boarding1.dart';
import 'package:shopfee/pages/onBoarding/on_boarding2.dart';
import 'package:shopfee/pages/onBoarding/on_boarding3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: null,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
              child: Text(
                'skip',
                style: ConstTextStyle.B14M(ConstColors.TextHeading),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 52),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 336,
                height: 480,
                child: Center(
                  child: PageView(
                    controller: pageController,
                    clipBehavior: Clip.hardEdge,
                    children: const [
                      PageOne(),
                      PageTwo(),
                      PageThree(),
                    ],
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 74,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      expansionFactor: 2,
                      dotColor: ConstColors.TextDisabled,
                      activeDotColor: ConstColors.Brand,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (currentIndex < 2) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      } else if (currentIndex == 2) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: currentIndex == 2 ? 175 : 156,
                      height: 48,
                      decoration: BoxDecoration(
                        color: ConstColors.Brand,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: currentIndex == 2 ? 107 : 88,
                                height: 20,
                                child: Center(
                                  child: Text(
                                    currentIndex == 2
                                        ? 'Login/Register'
                                        : 'NEXT',
                                    style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 2.0,
                                      color: ConstColors.NeutralLight,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 2),
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                size: 16,
                                color: ConstColors.NeutralLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
