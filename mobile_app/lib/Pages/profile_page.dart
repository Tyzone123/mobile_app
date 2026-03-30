import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          
          // 1. PROFILE HEADER (Scale-in Animation with Icon)
          TweenAnimationBuilder(
            duration: const Duration(milliseconds: 800),
            curve: Curves.elasticOut,
            tween: Tween<double>(begin: 0, end: 1),
            builder: (context, double value, child) {
              return Transform.scale(scale: value, child: child);
            },
            child: const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.deepPurple,
              // REVERTED: Using an Icon child instead of an image
              child: Icon(
                Icons.person, 
                size: 80, 
                color: Colors.white
              ),
            ),
          ),
          
          const SizedBox(height: 15),
          const Text(
            "Thomas Anthony V. Bandoy", 
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
          ),
          const Text(
            "thomas.example@email.com", 
            style: TextStyle(fontSize: 14, color: Colors.grey)
          ),
          
          const SizedBox(height: 30),

          // 2. STATS SECTION (Counting Animation)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _StatItem(label: "Posts", count: 67),
              _StatItem(label: "Followers", count: 1200),
              _StatItem(label: "Following", count: 360),
            ],
          ),

          const SizedBox(height: 20),
          const Divider(),

          // 3. INFORMATION LIST (Staggered Slide Animation)
          _buildAnimatedTile(0, Icons.shopping_bag_outlined, "My Orders"),
          _buildAnimatedTile(1, Icons.favorite_border, "Wishlist"),
          _buildAnimatedTile(2, Icons.payment_outlined, "Payment Methods"),
          _buildAnimatedTile(3, Icons.location_on_outlined, "Delivery Address"),
          _buildAnimatedTile(4, Icons.help_outline, "Invite Friends"),
        ],
      ),
    );
  }

  // Staggered Slide Helper
  Widget _buildAnimatedTile(int index, IconData icon, String title) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 500 + (index * 100)),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(50 * (1 - value), 0), // Slides from right to left
            child: child,
          ),
        );
      },
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final int count;
  const _StatItem({required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TWEEN ANIMATION FOR NUMBERS
        TweenAnimationBuilder(
          duration: const Duration(seconds: 2),
          tween: IntTween(begin: 0, end: count),
          builder: (context, int value, child) {
            return Text("$value", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
          },
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}