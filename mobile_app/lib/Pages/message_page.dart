import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chats = [
      {"name": "John Michael", "msg": "Thomas, Absent tana?", "unread": 2, "color": Colors.blue},
       {"name": "Wendy Baldicanas", "msg": "Unsaon pag git clone thomas", "unread": 0, "color": Colors.pink},
      {"name": "Raymond Chavez", "msg": "Pre naa tay quiz karon?", "unread": 3, "color": Colors.deepOrange},
      
    ];

    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          leading: CircleAvatar(backgroundColor: chat['color'], child: Text(chat['name'][0], style: const TextStyle(color: Colors.white))),
          title: Text(chat['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(chat['msg']),
          trailing: chat['unread'] > 0 
            ? TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(milliseconds: 800),
                curve: Curves.elasticOut,
                builder: (context, value, child) => Transform.scale(scale: value, child: child),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(color: Colors.deepPurple, shape: BoxShape.circle),
                  child: Text(chat['unread'].toString(), style: const TextStyle(color: Colors.white, fontSize: 12)),
                ),
              )
            : null,
        );
      },
    );
  }
}