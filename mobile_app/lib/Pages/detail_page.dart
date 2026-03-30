import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> activity;

  const DetailPage({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Receipt"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. SIMPLE HEADER
            Center(
              child: Column(
                children: [
                  Icon(activity['icon'], size: 60, color: Colors.deepPurple),
                  const SizedBox(height: 10),
                  Text(activity['title'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(activity['amount'], style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.deepPurple)),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
            const Divider(),
            const SizedBox(height: 20),

            // 2. DATA ROWS
            _infoRow("Status", "Completed"),
            _infoRow("Category", activity['subtitle']),
            _infoRow("Date", "March 30, 2026"),
            _infoRow("Reference", "REF12345678"),

            const Spacer(),

            // 3. DONE BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text("Close", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Simple helper for info rows
  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}