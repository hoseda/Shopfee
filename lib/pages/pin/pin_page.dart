import 'package:flutter/material.dart';
import 'package:shopfee/components/buttons/buttons.dart';
import 'package:shopfee/consts/colors/colors.dart';
import 'package:shopfee/consts/textStyle/textStyle.dart';

class PinCodePage extends StatefulWidget {
  const PinCodePage({super.key});

  @override
  State<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  List code = [];

  Widget _textFieldPIN(int index) {
    bool _filled = true;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SizedBox(
        width: 30,
        height: 36,
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
          // style: const TextStyle(
          //   fontSize: 40,
          //   fontWeight: FontWeight.w500,
          //   color: ConstColors.TextHeading,
          // ),
          //todo : start from here
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(
                color: ConstColors.TextNonActive,
                width: 3,
              ),
            ),
            filled: _filled,
            fillColor: ConstColors.TextHeading,
            contentPadding: EdgeInsets.zero,
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
          "Create a PIN",
          style: ConstTextStyle.T16M(ConstColors.TextHeading),
        ),
      ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.symmetric(vertical: 80),
        child: RectangleButton(
          width: 335,
          height: 48,
          title: "Confirm",
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: 146,
                  child: Image.asset("assets/icons/pin.png"),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Finally, Your final step....",
                        style: ConstTextStyle.B14M(ConstColors.TextHeading),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Enter 6 numbers to keep your account safe",
                        style: ConstTextStyle.B14R(ConstColors.TextHeading),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  // here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _textFieldPIN(0),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
