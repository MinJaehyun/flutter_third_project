import 'package:flutter/material.dart';

void main() => runApp(const CheckboxExampleApp());

class CheckboxExampleApp extends StatelessWidget {
  const CheckboxExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Checkbox Sample')),
        body: const Center(
          child: CheckboxExample(),
        ),
      ),
    );
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

enum EnumCheckbox { test1, test2, test3 }

class _CheckboxExampleState extends State<CheckboxExample> {
  late List<bool> isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = [false, false, false];
  }

  // 중복 코드 개선
  void changeValue(index, val) {
    setState(() => isChecked[index] = val);
  }

  @override
  Widget build(BuildContext context) {
    print(isChecked);
    return Column(
      children: [
        CheckboxListTile(
          title: Text(EnumCheckbox.test2.name),
          controlAffinity: ListTileControlAffinity.leading,
          value: isChecked[1],
          onChanged: (value) => setState(() => isChecked[1] = value!),
        ),
        CheckboxListTile(
          title: Text(EnumCheckbox.test1.name),
          // 기본적으로 뒤에 checkbox 가 위치하는데, 이를 앞으로 설정하는 방법
          controlAffinity: ListTileControlAffinity.leading,
          value: isChecked[0],
          onChanged: (value) {
            changeValue(0, value);
          },
        ),
      ],
    );
  }
}
