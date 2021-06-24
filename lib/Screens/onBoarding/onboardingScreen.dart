import 'package:flutter/material.dart';
import 'package:pintsize/Config/backgroundPalette.dart';
import 'package:pintsize/Screens/Home/home.dart';
import 'package:pintsize/Widgets/background/backgroundPainter.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SizedBox.expand(
        child: CustomPaint(
          painter: BackgroundPainter(
            animation: _controller.view,
          ),
        ),
      ),
      const SizedBox(height: 24),
      Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(18.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(
                child: Text("Get Started ",
                    style: TextStyle(fontSize: 18, color: Palette.moderateRed)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(20)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Palette.moderateRed)))),
                onPressed: () => goToHome(context)),
          ])),
    ]));
  }

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
}
