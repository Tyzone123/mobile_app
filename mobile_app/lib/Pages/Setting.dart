import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // State variables for toggles
  bool _notificationsEnabled = true;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // SECTION 1: Account
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Account Settings",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          ),
        ),
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.deepPurple,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: const Text("Edit Profile"),
          subtitle: const Text("Name, Email, Phone Number"),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // Add navigation logic here
          },
        ),
        const Divider(height: 1),
        ListTile(
          leading: const Icon(Icons.lock_outline),
          title: const Text("Change Password"),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),

        const SizedBox(height: 20),

        // SECTION 2: App Settings
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "App Settings",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          ),
        ),
        SwitchListTile(
          secondary: const Icon(Icons.notifications_active_outlined),
          title: const Text("Push Notifications"),
          subtitle: const Text("Get notified about new messages"),
          value: _notificationsEnabled,
          activeColor: Colors.deepPurple,
          onChanged: (bool value) {
            setState(() {
              _notificationsEnabled = value;
            });
          },
        ),
        SwitchListTile(
          secondary: const Icon(Icons.dark_mode_outlined),
          title: const Text("Dark Mode"),
          value: _darkMode,
          activeColor: Colors.deepPurple,
          onChanged: (bool value) {
            setState(() {
              _darkMode = value;
            });
          },
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: const Text("Language"),
          trailing: const Text("English (US)", style: TextStyle(color: Colors.grey)),
          onTap: () {},
        ),

        const SizedBox(height: 20),

        // SECTION 3: Support & About
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "More",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.help_outline),
          title: const Text("Help Center"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text("About App"),
          onTap: () {},
        ),

        const SizedBox(height: 30),

        // LOGOUT BUTTON
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton.icon(
            onPressed: () {
              // Add logout logic here
            },
            icon: const Icon(Icons.logout),
            label: const Text("Logout"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            "Version 1.0.0",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}