import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isTextVisible = true;
  bool _isBannerExpanded = false;

  final List<Map<String, dynamic>> activities = [
    {"title": "SM Supermarket", "subtitle": "Grocery", "amount": "- ₱1,250", "icon": Icons.shopping_basket, "color": Colors.green, "isNegative": true},
    {"title": "Globe Telecom", "subtitle": "Prepaid Load", "amount": "- ₱100", "icon": Icons.phone_android, "color": Colors.blue, "isNegative": true},
    {"title": "Bank Transfer", "subtitle": "Savings", "amount": "+ ₱5,000", "icon": Icons.account_balance, "color": Colors.teal, "isNegative": false},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. WELCOME SECTION (AnimatedOpacity)
          Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 30),
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => _isTextVisible = !_isTextVisible),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: _isTextVisible ? 1.0 : 0.0,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Welcome,", style: TextStyle(color: Colors.white70, fontSize: 16)),
                            Text("Thomas Anthony", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    const Icon(Icons.notifications_outlined, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 2. FEATURE BANNER (AnimatedContainer)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              onTap: () => setState(() => _isBannerExpanded = !_isBannerExpanded),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                padding: EdgeInsets.all(_isBannerExpanded ? 35 : 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: _isBannerExpanded ? [Colors.orange, Colors.deepOrange] : [Colors.deepPurple, Colors.deepPurpleAccent],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_isBannerExpanded ? "PREMIUM ACTIVE" : "Try Premium!", style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    const Text("Unlimited access to all features", style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // 3. CATEGORIES (AnimatedScale - see CategoryItem below)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 15),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryItem(icon: Icons.grid_view, label: "All", color: Colors.blue),
              CategoryItem(icon: Icons.payments, label: "Pay", color: Colors.orange),
              CategoryItem(icon: Icons.history, label: "Logs", color: Colors.green),
              CategoryItem(icon: Icons.more_horiz, label: "More", color: Colors.red),
            ],
          ),

          const SizedBox(height: 25),

          // 4. RECENT ACTIVITY (Staggered Animation + Hero + Route Transition)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Recent Activity", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: activities.length,
            itemBuilder: (context, index) {
              final item = activities[index];
              return TweenAnimationBuilder(
                duration: Duration(milliseconds: 400 + (index * 200)),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, double value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(offset: Offset(0, 30 * (1 - value)), child: child),
                  );
                },
                child: ListTile(
                  onTap: () {
                    // CUSTOM ROUTE TRANSITION
                    Navigator.push(context, PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 600),
                      pageBuilder: (context, anim, secAnim) => DetailPage(activity: item),
                      transitionsBuilder: (context, anim, secAnim, child) => FadeTransition(opacity: anim, child: child),
                    ));
                  },
                  leading: Hero(
                    tag: 'icon_${item['title']}',
                    child: CircleAvatar(backgroundColor: item['color'].withOpacity(0.1), child: Icon(item['icon'], color: item['color'])),
                  ),
                  title: Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Text(item['amount'], style: TextStyle(color: item['isNegative'] ? Colors.red : Colors.green, fontWeight: FontWeight.bold)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatefulWidget {
  final IconData icon; final String label; final Color color;
  const CategoryItem({super.key, required this.icon, required this.label, required this.color});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.8 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Column(
          children: [
            Container(padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: widget.color.withOpacity(0.1), borderRadius: BorderRadius.circular(15)), child: Icon(widget.icon, color: widget.color)),
            Text(widget.label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}