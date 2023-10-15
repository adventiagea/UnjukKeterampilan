import 'dart:math';
import 'package:flutter/material.dart';

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

bmiResult (double bmi){
  if (bmi >= 28) {
      return const Text (
        "Obese",
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w500,
          color: Colors.red,
        ),
      );
    } else if (bmi >= 23) {
      return const Text (
        "Overweight",
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w500,
          color: Colors.deepOrange,
        ),
      );
    } else if (bmi >= 17.5) {
      return const Text (
        "Normal",
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w500,
          color: Colors.green,
        ),
      );
    } else {
      return const Text (
        "Underweight",
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w500,
          color: Colors.blueGrey,
        ),
      );
    }
}

class BMIResult extends StatelessWidget {
  const BMIResult(
      {super.key, required this.tinggiBadan, required this.beratBadan});
  final int tinggiBadan;
  final int beratBadan;

  @override
  Widget build(BuildContext context) {
    double bmi = beratBadan / pow(tinggiBadan / 100, 2);
    
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            bmiResult(bmi),
            Text(
              bmi.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const Text(
              'Normal BMI Range',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const Text(
              '17,5 -  22.9 ',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          child: const Text('Kembali',
            style: TextStyle(
              fontSize: 20
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
