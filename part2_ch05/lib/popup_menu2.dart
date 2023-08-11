import 'package:flutter/material.dart';

/// Flutter code sample for [PopupMenuButton].

void main() => runApp(const PopupMenuApp());

class PopupMenuApp extends StatelessWidget {
  const PopupMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PopupMenuExample(),
    );
  }
}

class PopupMenuExample extends StatefulWidget {
  const PopupMenuExample({super.key});

  @override
  State<PopupMenuExample> createState() => _PopupMenuExampleState();
}

class _PopupMenuExampleState extends State<PopupMenuExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PopupMenuButton')),
      body: TestSample(),
    );
  }
}

class TestSample extends StatefulWidget {
  const TestSample({super.key});

  @override
  State<TestSample> createState() => _TestSampleState();
}

enum TestSampleItem { itemOne, itemTwo, itemThree }

class _TestSampleState extends State<TestSample> {
  TestSampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    print(selectedMenu);
    return PopupMenuButton(
      initialValue: selectedMenu,
      onSelected: (TestSampleItem item) {
        setState(() {
          selectedMenu = item;
        });
      },
      itemBuilder: (BuildContext context) {
        return TestSampleItem.values.map((e) => PopupMenuItem(child: Text(e.name), value: e)).toList();
      },
    );
  }
}

// 에러: The return type 'Iterable<PopupMenuItem<TestSampleItem>>' isn't a 'List<PopupMenuEntry<_>>', as required by the closure's context. (Documentation)
// 해결: map 의 결과값은 Iterable 인데, 위에서는 List 이여야 한다
