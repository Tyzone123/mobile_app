import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _notificationsEnabled = true;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text("Account Settings", 
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
        const SizedBox(height: 10),
        
        // ListTile with internal scale animation
        _buildSettingTile(Icons.person_outline, "Edit Profile", "Name, Email, Phone"),
        _buildSettingTile(Icons.lock_outline, "Change Password", "Secure your account"),
        
        const SizedBox(height: 20),
        const Text("Preferences", 
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple)),

        // SWITCHES (Implicit Animation)
        SwitchListTile(
          secondary: const Icon(Icons.notifications_active_outlined),
          title: const Text("Push Notifications"),
          value: _notificationsEnabled,
          activeThumbColor: Colors.deepPurple,
          onChanged: (val) => setState(() => _notificationsEnabled = val),
        ),
        SwitchListTile(
          secondary: const Icon(Icons.dark_mode_outlined),
          title: const Text("Dark Mode"),
          value: _darkMode,
          activeThumbColor: Colors.deepPurple,
          onChanged: (val) => setState(() => _darkMode = val),
        ),

        const SizedBox(height: 40),

        // LOGOUT BUTTON (Animated Entrance)
        TweenAnimationBuilder(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.bounceOut,
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, double value, child) {
            return Transform.translate(
              offset: Offset(0, 100 * (1 - value)),
              child: child,
            );
          },
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.logout),
            label: const Text("Logout"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingTile(IconData icon, String title, String sub) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title),
      subtitle: Text(sub, style: const TextStyle(fontSize: 12)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: () {},
    );
  }
}