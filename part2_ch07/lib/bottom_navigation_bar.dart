import 'package:flutter/material.dart';

/// Flutter code sample for [BottomNavigationBar].

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  // 탭 변경을 위한 인덱스
  int _selectedIndex = 0;

  // note: static 설정 이유 ?
  // 변하지 않는 고정값인 static 사용하면, 클래스의 인스턴스를 생성하지 않아도 접근 가능하여 코드를 더 깔끔한 구조로 유지하고, 직접 접근하면 오버헤드 없으므로 성능 향상을 가져올 수 있다.
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Business', style: optionStyle),
    Text('Index 2: School', style: optionStyle),
  ];

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomNavigationBar Sample')),
      // elementAt 기능 ? 인덱스에 위치하는 값을 가져온다 // final numbers = <int>[1, 2, 3, 5, 6, 7]; // final elementAt = numbers.elementAt(4); // 6
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      // BottomNavigationBar + BottomNavigationBarItem
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],

        // note: 코드 개선: onTap 에 의해 탭 클릭 시, 인덱스는 _onItemTapped 에게 전달된다
        // onTap: (value) => _onItemTapped(value),
        onTap: _onItemTapped,
      ),
    );
  }
}
