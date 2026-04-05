import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> item;
  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transaction Summary")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // [WHITEBOARD CONCEPT: HERO ANIMATION]
            // Tag must match the one from HomePage. Flutter 'flies' the widget between screens.
            Hero(
              tag: item['name'],
              child: Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(color: item['color'].withOpacity(0.1), shape: BoxShape.circle),
                child: Icon(item['icon'], size: 100, color: item['color']),
              ),
            ),
            const SizedBox(height: 30),

            // [WHITEBOARD CONCEPT: FADE WIDGETS IN AND OUT]
            // Using TweenAnimationBuilder to fade the text in specifically on this page.
            TweenAnimationBuilder(
              duration: const Duration(seconds: 1),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, double val, child) => Opacity(opacity: val, child: child),
              child: Column(
                children: [
                  Text(item['name'], style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  Text(item['price'], style: const TextStyle(fontSize: 40, color: Colors.deepPurple, fontWeight: FontWeight.w900)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}