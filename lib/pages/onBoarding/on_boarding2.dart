import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopfee/consts/colors/colors.dart';
import 'package:shopfee/consts/textStyle/textStyle.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/images/onboard2.svg',
            width: 294,
            height: 261,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 63,
          ),
          //todo:
          Text(
            "Quickly and easly",
            style: ConstTextStyle.H20B(ConstColors.TextHeading, height: 0),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "You can place your order quickly and\neasly without wasting time. You can also \nschedule orders via your smarthphone.",
            softWrap: true,
            textAlign: TextAlign.left,
            style: ConstTextStyle.T16M(ConstColors.TextHeading, height: 0),
          ),
        ],
      ),
    );
  }
}
