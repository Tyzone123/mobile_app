import 'package:flutter/material.dart';
import 'home_page.dart';
import 'message_page.dart';
import 'profile_page.dart';
import 'setting_page.dart';

void main() => runApp(const MobileApp());

class MobileApp extends StatelessWidget {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  // We use this integer to track which page is currently showing
  int _currentIndex = 0;

  // List of Page Titles for the AppBar
  final List<String> _titles = ["Home Feed", "Messages", "Profile", "Settings"];

  // [WHITEBOARD CONCEPT: ANIMATE A PAGE FOR ROUTE TRANSITION]
  // We use ValueKeys so the AnimatedSwitcher knows when a "New" page enters.
  final List<Widget> _screens = [
    const HomePage(key: ValueKey(0)),
    const MessagePage(key: ValueKey(1)),
    const ProfilePage(key: ValueKey(2)),
    const Setting(key: ValueKey(3)),
  ];

  // Helper method to change the page and refresh the UI
  void _onNavigate(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex], style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white), // Makes drawer icon white
      ),

      // ---------------------------------------------------------
      // 1. THE SIDE DRAWER (RESTORED)
      // ---------------------------------------------------------
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header with Profile Info
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 30, backgroundColor: Colors.white, child: Icon(Icons.person, color: Colors.deepPurple)),
                  SizedBox(height: 10),
                  Text('Thomas Anthony', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('thomas.dev@email.com', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
            // Navigation Tiles inside the Drawer
            _buildDrawerTile(0, Icons.home, 'Home'),
            _buildDrawerTile(1, Icons.message, 'Messages'),
            _buildDrawerTile(2, Icons.person, 'Profile'),
            _buildDrawerTile(3, Icons.settings, 'Settings'),
          ],
        ),
      ),

      // ---------------------------------------------------------
      // 2. ANIMATED BODY (Concept: Route Transition)
      // ---------------------------------------------------------
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        // This transition causes the pages to "Fade In" smoothly
        transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
        child: _screens[_currentIndex],
      ),

      // ---------------------------------------------------------
      // 3. BOTTOM NAVIGATION BAR
      // ---------------------------------------------------------
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavigate, // Calls the navigation helper
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setup"),
        ],
      ),
    );
  }

  // --- DRAWER HELPER METHOD ---
  // This helps clean up the code and makes it "Understandable"
  Widget _buildDrawerTile(int index, IconData icon, String title) {
    bool isSelected = _currentIndex == index;
    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.orange : Colors.grey),
      title: Text(title, style: TextStyle(color: isSelected ? Colors.deepPurple : Colors.black, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
      selected: isSelected,
      onTap: () {
        _onNavigate(index); // Update the page index
        Navigator.pop(context); // [IMPORTANT] Closes the drawer after clicking
      },
    );
  }
}


