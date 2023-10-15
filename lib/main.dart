
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:unjuk_keterampilan_adventia/input_name_screen.dart';
import 'package:unjuk_keterampilan_adventia/welcome_splash.dart';

void main() => runApp(const MaterialApp(home: MyApp(),));

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
    return Icon(
      Icons.mode_night,
      color: Colors.blue.shade400,
      size: 20,
    );
  }
  if (hour < 18) {
    return const Icon(
      Icons.sunny,
      color: Colors.white,
      size: 20,
    );
  }

  return Icon(
    Icons.mode_night,
    color: Colors.blue.shade400,
    size: 20,
  );
}

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

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key, required this.name});
  final String name;
  final greetingText = greeting();
  final logo = logoSplash();
  final customBackground = customBackgroundColor();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Splash Screen',
        home: AnimatedSplashScreen(
            centered: true,
            duration: 5000,
            splash: Column(
              children: [
                logo,
                Text(
                  textAlign: TextAlign.center,
                  "$greetingText $name",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                
              ],
            ),
            nextScreen: Welcome(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: customBackground)
            );
  }
}
