import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopfee/consts/colors/colors.dart';
import 'package:shopfee/consts/textStyle/textStyle.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/images/onboard3.svg',
            alignment: Alignment.topLeft,
            width: 294,
            height: 261,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 63,
          ),
          //todo:
          Text(
            "Get and Redeem Voucher",
            style: ConstTextStyle.H20B(ConstColors.TextHeading, height: 0),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Exciting prizes await you! Redeem yours \nby collecting all the points after purchase\nin the app!",
            softWrap: true,
            textAlign: TextAlign.left,
            style: ConstTextStyle.T16M(ConstColors.TextHeading, height: 0),
          ),
        ],
      ),
    );
  }
}
