import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isExpanded = false;

  final List<Map<String, dynamic>> items = [
    {"name": "SM Supermarket", "price": "- ₱1,250", "icon": Icons.shopping_cart, "color": Colors.green},
    {"name": "Globe Prepaid", "price": "- ₱100", "icon": Icons.phone_iphone, "color": Colors.blue},
    {"name": "Freelance Pay", "price": "+ ₱8,000", "icon": Icons.wallet, "color": Colors.teal},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // [WHITEBOARD CONCEPT: IMPLICIT ANIMATION]
        // We use AnimatedContainer. It's 'Implicit' because you don't need a Controller.
        // Changing the 'height' or 'color' inside setState() triggers the animation.
        GestureDetector(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(25),
            height: _isExpanded ? 200 : 120, // Height logic
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: _isExpanded ? [Colors.orange, Colors.deepOrange] : [Colors.deepPurple, Colors.deepPurpleAccent],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Total Savings", style: TextStyle(color: Colors.white70)),
                Text("₱ 15,400.00", style: TextStyle(color: Colors.white, fontSize: _isExpanded ? 32 : 24, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),

        // [WHITEBOARD CONCEPT: STAGGERED ANIMATION]
        // By using (index * delay), we create a "Waterfall" effect where items appear in sequence.
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return TweenAnimationBuilder(
                duration: Duration(milliseconds: 500 + (index * 200)), // The 'Stagger' logic
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, double value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(offset: Offset(0, 30 * (1 - value)), child: child),
                  );
                },
                child: ListTile(
                  onTap: () {
                    // Manual Route Transition to Detail Page
                    Navigator.push(context, MaterialPageRoute(builder: (c) => DetailPage(item: items[index])));
                  },
                  // [WHITEBOARD CONCEPT: HERO ANIMATIONS]
                  leading: Hero(
                    tag: items[index]['name'],
                    child: CircleAvatar(backgroundColor: Colors.grey[200], child: Icon(items[index]['icon'], color: items[index]['color'])),
                  ),
                  title: Text(items[index]['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Text(items[index]['price'], style: TextStyle(color: items[index]['color'], fontWeight: FontWeight.bold)),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}