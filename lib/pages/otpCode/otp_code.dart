import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:shopfee/consts/colors/colors.dart';
import 'package:shopfee/consts/textStyle/textStyle.dart';

class OtpLoading extends StatefulWidget {
  final String number;
  final String info;
  final Widget? nextPage;
  const OtpLoading({
    super.key,
    required this.number,
    required this.info,
    required this.nextPage,
  });

  @override
  State<OtpLoading> createState() => _OtpLoadingState();
}

class _OtpLoadingState extends State<OtpLoading> with TickerProviderStateMixin {
  late GifController gifController;

  @override
  void initState() {
    super.initState();
    gifController = GifController(vsync: this);
  }

  Future sendOTP() async {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => widget.nextPage!,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gif(
                  width: 230,
                  height: 230,
                  alignment: Alignment.center,
                  image: const AssetImage("assets/animations/loading.gif"),
                  autostart: Autostart.loop,
                  duration: const Duration(seconds: 2),
                  onFetchCompleted: () {
                    sendOTP();
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 320,
            right: 120,
            left: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Please wait a minute,",
                  style: ConstTextStyle.B14M(ConstColors.TextHeading),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 300,
            right: 95,
            left: 94,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.info,
                  style: ConstTextStyle.B14R(ConstColors.TextHeading),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
