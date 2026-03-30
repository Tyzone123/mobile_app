import 'package:flutter/material.dart';
import 'Pages/home_page.dart';
import 'Pages/message_Page.dart';
import 'Pages/profile_page.dart';
import 'Pages/setting_page.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
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

  // Pages List with ValueKeys for the AnimatedSwitcher
  final List<Widget> _pages = [
    const HomePage(key: ValueKey(0)),
    const Message(key: ValueKey(1)),
    const Profile(key: ValueKey(2)),
    const Setting(key: ValueKey(3)),
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
        foregroundColor: Colors.white,
      ),

      // 1. SIDE NAVIGATION MENU (RESTORED)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(radius: 30, backgroundColor: Colors.white, child: Icon(Icons.person, color: Colors.deepPurple)),
                  SizedBox(height: 10),
                  Text('Thomas Anthony', style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ),
            _buildDrawerTile(0, Icons.home, 'Home'),
            _buildDrawerTile(1, Icons.message, 'Messages'),
            _buildDrawerTile(2, Icons.person, 'Profile'),
            _buildDrawerTile(3, Icons.settings, 'Settings'),
          ],
        ),
      ),

      // 2. ANIMATED BODY (Smooth transition between pages)
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.1, 0), // Slight slide from right
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: _pages[_selectedIndex],
      ),

      // 3. BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  // Helper to build Drawer Tiles and handle navigation + closing drawer
  Widget _buildDrawerTile(int index, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: _selectedIndex == index ? Colors.deepPurple : Colors.grey),
      title: Text(title, style: TextStyle(color: _selectedIndex == index ? Colors.deepPurple : Colors.black)),
      selected: _selectedIndex == index,
      onTap: () {
        _onItemTapped(index);
        Navigator.pop(context); // Closes the drawer
      },
    );
  }
}