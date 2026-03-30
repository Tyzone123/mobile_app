import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> activity;
  const DetailPage({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transaction Detail")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'icon_${activity['title']}',
              child: Icon(activity['icon'], size: 120, color: Colors.deepPurple),
            ),
            const SizedBox(height: 20),
            Text(activity['title'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(activity['amount'], style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Colors.deepPurple)),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("Back to Home")),
          ],
        ),
      ),
    );
  }
}