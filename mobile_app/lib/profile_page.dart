import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // 🔹 PROFILE IMAGE
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.deepPurple,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),

            const SizedBox(height: 15),

            // 🔹 NAME & ROLE
            const Text(
              "Thomas Anthony",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Mobile Developer",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // 🔹 EDIT PROFILE BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text("Edit Profile"),
              ),
            ),

            const SizedBox(height: 25),

            // 🔹 STATS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStat("Posts", 25),
                _buildStat("Followers", 500),
                _buildStat("Following", 120),
              ],
            ),

            const Padding(
              padding: EdgeInsets.all(20),
              child: Divider(),
            ),

            // 🔹 MENU OPTIONS
            _buildMenuItem(context, Icons.edit, "Edit Profile"),
            _buildMenuItem(context, Icons.notifications, "Notifications"),
            _buildMenuItem(context, Icons.lock, "Privacy Settings"),
            _buildMenuItem(context, Icons.help, "Help Center"),
            _buildMenuItem(context, Icons.logout, "Logout"),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 🔹 STAT WIDGET
  Widget _buildStat(String label, int value) {
    return Column(
      children: [
        Text(
          "$value",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  // 🔹 MENU ITEM WIDGET WITH NAVIGATION
  Widget _buildMenuItem(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(title: title),
          ),
        );
      },
    );
  }
}

// 🔹 DUMMY DETAIL PAGE (FOR NAVIGATION)
class DetailPage extends StatelessWidget {
  final String title;

  const DetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
          "$title Page",
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}