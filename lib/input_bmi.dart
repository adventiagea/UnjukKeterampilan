import 'package:flutter/material.dart';
import 'package:unjuk_keterampilan_adventia/result_bmi.dart';

class InputBMI extends StatefulWidget {
  const InputBMI({super.key});

  @override
  InputBMIState createState() => InputBMIState();
}

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


class InputBMIState extends State<InputBMI> {
  int tinggi = 0;
  int berat = 0;

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
            appBar: AppBar(
              backgroundColor: customBackgroundColor(),
              centerTitle: true,
              title: const Text('Hitung BMI'),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset('images/bmi.jpg',
                    fit: BoxFit.fitWidth,
                  ),

                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              onChanged: (txt) {
                                setState(() {
                                  tinggi = int.parse(txt);
                                });
                              },
                              keyboardType: TextInputType.number,
                              maxLength: 3,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  suffix: Text('cm'),
                                  hintText: 'Tinggi'),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              onChanged: (txt) {
                                setState(() {
                                  berat = int.parse(txt);
                                });
                              },
                              keyboardType: TextInputType.number,
                              maxLength: 3,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  suffix: Text('kg'),
                                  hintText: 'Berat'),
                            ),
                          ),
                        ],
                      )),

                  Container(
                     margin: const EdgeInsets.only(left: 10,right: 10,bottom: 20),
                     child: ElevatedButton(
                       onPressed: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => BMIResult(tinggiBadan: tinggi, beratBadan: berat)),
                         );
                       },
                       child: const Text(
                         'Hitung BMI',
                         style:
                         TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                       ),
                     ),
                   ),
                ],
              ),
            ),
        );
  }
}