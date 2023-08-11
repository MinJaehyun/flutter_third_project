import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

enum TestRadioButton { test1, test2, test3 }

class _MyAppState extends State<MyApp> {
  TestRadioButton _character = TestRadioButton.test1;

  @override
  Widget build(BuildContext context) {
    print(_character);

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: Text(TestRadioButton.test1.name),
                leading: Radio(
                  value: TestRadioButton.test1,
                  groupValue: _character,
                  onChanged: (value) => setState(() => _character = value!),
                ),
              ),
              ListTile(
                title: Text(TestRadioButton.test2.name),
                leading: Radio(
                  value: TestRadioButton.test2,
                  groupValue: _character,
                  onChanged: (value) => setState(() => _character = value!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
