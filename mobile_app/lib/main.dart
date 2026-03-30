import 'package:flutter/material.dart';
import 'Pages/HomePage.dart';
import 'Pages/Message.dart';
import 'Pages/Profile.dart';
import 'Pages/Setting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile App Bandoy',
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Message(),
    Profile(),
    Setting(),
  ];

  final List<String> _titles = [
    'Home',
    'Messages',
    'Profile',
    'Settings',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Colors.deepPurple,
      ),

      body: _pages[_selectedIndex],

      drawer: Drawer(
  child: Column(
    children: [
      Container(
        decoration: const BoxDecoration(),
        child: const Text('Menu', style: TextStyle(fontSize: 24)),
      ),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Home'),
        onTap: () {
          setState(() {
            _selectedIndex = 0;
          });
          Navigator.pop(context); // close drawer
        },
      ),
      ListTile(
        leading: const Icon(Icons.message),
        title: const Text('Messages'),
        onTap: () {
          setState(() {
            _selectedIndex = 1;
          });
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text('Profile'),
        onTap: () {
          setState(() {
            _selectedIndex = 2;
          });
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('Settings'),
        onTap: () {
          setState(() {
            _selectedIndex = 3;
          });
          Navigator.pop(context);
        },
      ),
    ],
  ),
),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: const Color.fromARGB(255, 69, 8, 173),
        backgroundColor: Colors.yellow,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}