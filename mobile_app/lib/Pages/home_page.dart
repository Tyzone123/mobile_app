import 'package:flutter/material.dart';
import 'detail_page.dart'; // Make sure this import matches your file name

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. WELCOME SECTION
            Container(
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 30),
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome,", style: TextStyle(color: Colors.white70, fontSize: 16)),
                          Text("Thomas Anthony", 
                            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications_outlined, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search services...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 2. FEATURE BANNER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Try Premium!", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text("Get unlimited access to all features", style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // 3. CATEGORIES SECTION
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryItem(Icons.grid_view, "All", Colors.blue),
                _buildCategoryItem(Icons.payments_outlined, "Pay", Colors.orange),
                _buildCategoryItem(Icons.history, "Logs", Colors.green),
                _buildCategoryItem(Icons.more_horiz, "More", Colors.red),
              ],
            ),

            const SizedBox(height: 25),

            // 4. RECENT ACTIVITY SECTION
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent Activity", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("View All", style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            Builder(
              builder: (context) {
                final List<Map<String, dynamic>> activities = [
                  {
                    "title": "SM Supermarket",
                    "subtitle": "Grocery Shopping",
                    "amount": "- ₱1,250.00",
                    "icon": Icons.shopping_basket_outlined,
                    "color": Colors.green,
                    "isNegative": true,
                  },
                  {
                    "title": "Globe Telecom",
                    "subtitle": "Load Prepaid",
                    "amount": "- ₱100.00",
                    "icon": Icons.phone_android,
                    "color": Colors.blue,
                    "isNegative": true,
                  },
                  {
                    "title": "Bank Transfer",
                    "subtitle": "Bandoy Savings",
                    "amount": "+ ₱5,000.00",
                    "icon": Icons.account_balance_wallet_outlined,
                    "color": Colors.teal,
                    "isNegative": false,
                  },
                ];

                return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: activities.length,
                  itemBuilder: (context, index) {
                    final item = activities[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          // NAVIGATION HAPPENS HERE
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(activity: item),
                            ),
                          );
                        },
                        child: Card(
                          margin: EdgeInsets.zero,
                          elevation: 0.5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: item['color'].withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(item['icon'], color: item['color']),
                            ),
                            title: Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(item['subtitle'], style: const TextStyle(fontSize: 12)),
                            trailing: Text(
                              item['amount'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: item['isNegative'] ? Colors.red : Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }
}