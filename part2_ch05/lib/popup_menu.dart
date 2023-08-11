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

enum TestSampleItem { itemOne, itemTwo, itemThree }

class _PopupMenuExampleState extends State<PopupMenuExample> {
  TestSampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    print(selectedMenu);

    return Scaffold(
      appBar: AppBar(title: const Text('PopupMenuButton')),
      body: Center(
        child: PopupMenuButton<TestSampleItem>(
          initialValue: selectedMenu,
          onSelected: (TestSampleItem item) {
            setState(() {
              selectedMenu = item;
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<TestSampleItem>>[
            const PopupMenuItem<TestSampleItem>(
              value: TestSampleItem.itemOne,
              child: Text('Item 1'),
            ),
            const PopupMenuItem<TestSampleItem>(
              value: TestSampleItem.itemTwo,
              child: Text('Item 2'),
            ),
          ],
        ),
      ),
    );
  }
}
