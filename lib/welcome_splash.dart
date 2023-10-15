
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:unjuk_keterampilan_adventia/input_BMI.dart';

var hour = DateTime.now().hour;

customBackgroundColor() {
  if (hour < 4) {
    return Colors.black;
  }
  if (hour < 15) {
    return Colors.blueGrey;
  }
  if (hour < 18) {
    return Colors.deepOrangeAccent;
  }
  return Colors.black;
}

class Welcome extends StatelessWidget {
  Welcome({super.key});
  final customBackground = customBackgroundColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Center(
          child: AnimatedSplashScreen(
            duration: 5000,
            splash:  const Column(
              children: [
                Center(
                  child: Text(
                  textAlign: TextAlign.center,
                  "Selamat datang di aplikasi\nPerhitungan BMI",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  ),
                ),
              ],
            ),
            nextScreen: const InputBMI(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: customBackground
            )
        ),
        
    );
  }
}
