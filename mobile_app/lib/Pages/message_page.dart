import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key}); 

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  // The list of names you provided
  final List<Map<String, dynamic>> chats = [
  {"name": "John Michael", "msg": "Thomas, Absent tana?", "time": "2:45 PM", "unread": 2, "active": true, "color": Colors.blue},
  {"name": "Wendy Baldicanas", "msg": "Unsaon gani to pag clone Thomas sa git bash", "time": "12:15 PM", "unread": 0, "active": true, "color": Colors.pink},
  {"name": "Wilson Gella", "msg": "Ga Unsa mo ganina thomas", "time": "1:20 PM", "unread": 0, "active": false, "color": Colors.orange},
  {"name": "Raymond Chavez", "msg": "thomas pre asa ta mag exam? .", "time": "11:10 AM", "unread": 1, "active": true, "color": Colors.green},
  {"name": "Vincent Caparida", "msg": "Ingna lang ko thomas kung naa na mam.", "time": "9:30 AM", "unread": 0, "active": false, "color": Colors.indigo},
  {"name": "Dash Trever Apit", "msg": "Naa na sir dira thomas.", "time": "Yesterday", "unread": 0, "active": false, "color": Colors.red},
  {"name": "Jorge Insila", "msg": "Naa na ang attendance sheet? Pa sign ko.", "time": "Yesterday", "unread": 0, "active": false, "color": Colors.brown},
  {"name": "Fritzie Mae Son", "msg": "Wapako nahuman pero mo apas ko", "time": "Monday", "unread": 0, "active": false, "color": Colors.teal},
  {"name": "Jese Castillo", "msg": "walaaa kay notes unta or picture... ?", "time": "Monday", "unread": 0, "active": false, "color": Colors.amber},
  {"name": "Shem Casul", "msg": "Thomas naa kay gcash pa load ko.", "time": "Just now", "unread": 3, "active": true, "color": Colors.deepOrange},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.chat_bubble_outline, color: Colors.white),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search conversations...",
                prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
                filled: true,
                fillColor: Colors.deepPurple.withOpacity(0.05),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Horizontal Active Section
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: chats.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) return _buildAddStory();
                var chat = chats[index - 1];
                return _buildActiveUser(chat['name'], chat['active'], chat['color']);
              },
            ),
          ),

          const Divider(thickness: 0.5),

          // Vertical Chat List
          Expanded(
            child: ListView.separated(
              itemCount: chats.length,
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundColor: chat['color'].withOpacity(0.2),
                    child: Text(
                      chat['name'][0], 
                      style: TextStyle(fontWeight: FontWeight.bold, color: chat['color']),
                    ),
                  ),
                  title: Text(
                    chat['name'],
                    style: TextStyle(
                      fontWeight: chat['unread'] > 0 ? FontWeight.bold : FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    chat['msg'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(chat['time'], style: const TextStyle(fontSize: 11, color: Colors.grey)),
                      if (chat['unread'] > 0)
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(color: Colors.deepPurple, shape: BoxShape.circle),
                          child: Text(chat['unread'].toString(), style: const TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddStory() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(radius: 30, backgroundColor: Colors.grey, child: Icon(Icons.add, color: Colors.white)),
          Text("Your Story", style: TextStyle(fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildActiveUser(String name, bool isActive, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: isActive ? Colors.green : Colors.grey[300],
            child: CircleAvatar(
              radius: 27,
              backgroundColor: Colors.white,
              child: Text(name[0], style: TextStyle(color: color, fontWeight: FontWeight.bold)),
            ),
          ),
          Text(name.split(" ")[0], style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}