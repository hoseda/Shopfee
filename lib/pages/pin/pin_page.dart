import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  bool _visible = false;
  bool _active = false;

  Widget _obsecure() {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: ConstColors.TextHeading,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: ConstColors.TextNonActive,
          width: 2,
        ),
      ),
    );
  }

  Widget _textFieldPIN(int index) {
    return SizedBox(
      width: 30,
      height: 30,
      child: TextField(
        autofocus: true,
        enableInteractiveSelection: false,
        contextMenuBuilder: null,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.length == 1) {
            setState(() {
              code.insert(index, value);
            });
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            setState(() {
              code.removeAt(index);
            });
            FocusScope.of(context).previousFocus();
          }

          if (code.length == 6) {
            setState(() {
              _active = true;
            });
          } else {
            setState(() {
              _active = false;
            });
          }
        },
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        showCursor: false,
        readOnly: false,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w500,
          color: ConstColors.TextHeading,
        ),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          counter: Offstage(),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide.none,
          ),
          filled: false,
          contentPadding: EdgeInsets.zero,
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: RectangleButton(
          width: 335,
          height: 48,
          title: "Confirm",
          function: _active ? () {} : null,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedCrossFade(
                        firstChild: _textFieldPIN(0),
                        secondChild: _obsecure(),
                        crossFadeState: _visible
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 200),
                      ),
                      AnimatedCrossFade(
                        firstChild: _textFieldPIN(0),
                        secondChild: _obsecure(),
                        crossFadeState: _visible
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 200),
                      ),
                      AnimatedCrossFade(
                        firstChild: _textFieldPIN(0),
                        secondChild: _obsecure(),
                        crossFadeState: _visible
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 200),
                      ),
                      AnimatedCrossFade(
                        firstChild: _textFieldPIN(0),
                        secondChild: _obsecure(),
                        crossFadeState: _visible
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 200),
                      ),
                      AnimatedCrossFade(
                        firstChild: _textFieldPIN(0),
                        secondChild: _obsecure(),
                        crossFadeState: _visible
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 200),
                      ),
                      AnimatedCrossFade(
                        firstChild: _textFieldPIN(0),
                        secondChild: _obsecure(),
                        crossFadeState: _visible
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 200),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(!_visible ? "Hide your PIN" : "Show your PIN"),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _visible = !_visible;
                          });
                        },
                        icon: Icon(
                          _visible == false
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ],
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
