import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:unjuk_keterampilan_adventia/input_name_screen.dart';

void main() {
  runApp(SplashScreen());
}

var hour = DateTime.now().hour;
String greeting() {
  if (hour < 4) {
    return ' Selamat Malam';
  }
  if (hour < 11) {
    return ' Selamat Pagi';
  }
  if (hour < 15) {
    return ' Selamat Siang';
  }
  if (hour < 18) {
    return ' Selamat Sore';
  }
  if (hour > 18) {
    return ' Selamat Malam';
  }
  
  return ' Hallo';
}

logoSplash() {
  if (hour < 4) {
    return 
    Icon(
      Icons.mode_night,
      color: Colors.blue.shade400,
      size: 30,
    );
  }
  if (hour < 18) {
    return 
    const Icon(
      Icons.sunny,
      color: Colors.white,
      size: 30,
    );
  }

  return Icon(
      Icons.mode_night,
      color: Colors.blue.shade400,
      size: 30,
    );
}

customBackgroundColor() {
  if (hour < 4) {
    return Colors.black;
  }
  if (hour < 18) {
    return Colors.blueGrey;
  }
  return Colors.black;
}

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final greetingText = greeting();
  final logo = logoSplash();
  final customBackground = customBackgroundColor();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Splash Screen',
        home: AnimatedSplashScreen(
            duration: 5000,
            splash: 
            Column(
              children: [
                logo,
                Text(
                  greetingText,
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
              
            ),
            nextScreen: const InputName(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: customBackground));
  }
}
