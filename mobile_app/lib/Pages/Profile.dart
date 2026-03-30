import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          
          // 1. PROFILE HEADER
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.deepPurple,
            child: Icon(
              Icons.person,
              size: 80,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Thomas Anthony V. Bandoy",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "thomas.example@email.com",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),

          // 2. ACTION BUTTONS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text("Edit Profile"),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.deepPurple),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text("Share Profile"),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // 3. STATS SECTION
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _StatItem(label: "Posts", count: "67"),
              _StatItem(label: "Followers", count: "1 Million"),
              _StatItem(label: "Following", count: "360"),
            ],
          ),

          const SizedBox(height: 20),
          const Divider(),

          // 4. INFORMATION LIST
          _ProfileListTile(
            icon: Icons.shopping_bag_outlined,
            title: "My Orders",
            onTap: () {},
          ),
          _ProfileListTile(
            icon: Icons.favorite_border,
            title: "Wishlist",
            onTap: () {},
          ),
          _ProfileListTile(
            icon: Icons.payment_outlined,
            title: "Payment Methods",
            onTap: () {},
          ),
          _ProfileListTile(
            icon: Icons.location_on_outlined,
            title: "Delivery Address",
            onTap: () {},
          ),
          _ProfileListTile(
            icon: Icons.help_outline,
            title: "Invite Friends",
            onTap: () {},
          ),
          
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// Custom widget for the Stats (Posts, Followers, etc.)
class _StatItem extends StatelessWidget {
  final String label;
  final String count;

  const _StatItem({required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

// Custom widget for the list items to keep the code clean
class _ProfileListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileListTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}