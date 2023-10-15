import 'package:flutter/material.dart';
import 'package:unjuk_keterampilan_adventia/main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Input nama',
      home: MyCustomForm(),
    );
  }
}


class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
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

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selamat Datang!'),
        backgroundColor: customBackgroundColor(),
      ),
      body: 
      Column(children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Masukkan nama..',
            ),
            controller: myController,
          ),
         ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
            onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SplashScreen(name: myController.text,)),
              );
            },
            child: const Text('Submit'),
          ),
        ),
      ],
      ),
    );
  }
}