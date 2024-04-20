import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopfee/consts/colors/colors.dart';
import 'package:shopfee/consts/textStyle/textStyle.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/images/onboard1.svg',
            width: 294,
            height: 261,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 63,
          ),
          Text(
            "Choose and customize your \nDrinks",
            style: ConstTextStyle.H20B(ConstColors.TextHeading, height: 0),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Customize your own drink exactly how \nyou like it by adding any topping you \nlike!!!",
            softWrap: true,
            textAlign: TextAlign.left,
            style: ConstTextStyle.T16M(ConstColors.TextHeading, height: 0),
          ),
        ],
      ),
    );
  }
}
