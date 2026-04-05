import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _notif = true;
  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          // 🔹 SECTION TITLE
          const Text(
            "Preferences",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 10),

          // 🔹 CARD CONTAINER
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [

                // 🔹 NOTIFICATION SWITCH
                SwitchListTile(
                  title: const Text("Push Notifications"),
                  value: _notif,
                  activeThumbColor: Colors.deepPurple,
                  onChanged: (v) {
                    setState(() => _notif = v);
                  },
                ),

                // 🔹 DARK MODE SWITCH
                SwitchListTile(
                  title: const Text("Dark Mode"),
                  value: _dark,
                  activeThumbColor: Colors.deepPurple,
                  onChanged: (v) {
                    setState(() => _dark = v);
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // 🔹 ANIMATED LOGOUT BUTTON
          TweenAnimationBuilder(
            duration: const Duration(milliseconds: 1200),
            curve: Curves.bounceOut,
            tween: Tween<double>(begin: 0, end: 1),
            builder: (context, double val, child) {
              return Transform.translate(
                offset: Offset(0, 100 * (1 - val)),
                child: child,
              );
            },
            child: ElevatedButton(
              onPressed: () => _showLogoutDialog(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("LOGOUT ACCOUNT"),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 LOGOUT CONFIRMATION DIALOG
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Add logout logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }
}