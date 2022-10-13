import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:khobor/snake.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const ExampleApp(),
     // home: const ExampleApp(),
      home: const ExampleApp(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePage();
// }

// class _MyHomePage extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      bottomNavigationBar: SnakeNavigationBar.color(
//         behaviour: SnakeBarBehaviour.pinned,
//         snakeShape: SnakeShape.circle,
        
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

//         ///configuration for SnakeNavigationBar.color
//         snakeViewColor: Colors.amber,
//         // selectedItemColor: snakeShape == SnakeShape.indicator ? selectedColor : null,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.blueGrey,

//         ///configuration for SnakeNavigationBar.gradient
//         //snakeViewGradient: selectedGradient,
//         //selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
//         //unselectedItemGradient: unselectedGradient,

//         showUnselectedLabels: true,
//         showSelectedLabels: true,

//         currentIndex: 0,
//         onTap: (index) => setState(() => _selectedItemPosition = index),
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'tickets'),
//           BottomNavigationBarItem(icon: Icon(CustomIcons.calendar), label: 'calendar'),
//           BottomNavigationBarItem(icon: Icon(CustomIcons.home), label: 'home'),
//           BottomNavigationBarItem(icon: Icon(CustomIcons.podcasts), label: 'microphone'),
//           BottomNavigationBarItem(icon: Icon(CustomIcons.search), label: 'search')
//         ],
//     );
//   }
// }
