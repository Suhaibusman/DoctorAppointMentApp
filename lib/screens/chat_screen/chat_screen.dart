import 'package:doctor_appointment_app/utils/constant/image_constant.dart';
import 'package:doctor_appointment_app/utils/themes/color_themes.dart';
import 'package:doctor_appointment_app/utils/widget/text_widget.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  // Dummy data for chat list
  final List<Map<String, dynamic>> chatList = [
    {
      "name": "John Doe",
      "lastMessage": "Hey, how's it going?",
      "profileImage": ImageConstant.doctorImage1,
      "time": "12:30 PM"
    },
    {
      "name": "Alice Smith",
      "lastMessage": "Let's meet tomorrow.",
      "profileImage": ImageConstant.doctorImage2,
      "time": "11:15 AM"
    },
    {
      "name": "Dr. Sarah Johnson",
      "lastMessage": "Your appointment is confirmed.",
      "profileImage": ImageConstant.doctorImage3,
      "time": "9:45 AM"
    },
    // Add more chat data
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: customTextWidget(text: "Chat" , fontSize: 20 , fontWeight: FontWeight.w600 , color: Colors.white),
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chat = chatList[index];

          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(chat['profileImage']), // Use NetworkImage if fetching from the web
            ),
            title: Text(
              chat['name'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              chat['lastMessage'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Limit the last message to one line
            ),
            trailing: Text(
              chat['time'],
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            onTap: () {
              // Handle chat item tap
              // Navigate to chat details or chat messages screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailScreen(chat['name']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatDetailScreen extends StatelessWidget {
  final String chatName;
  ChatDetailScreen(this.chatName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chatName),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text('Chat with $chatName'), // Placeholder for the chat conversation
      ),
    );
  }
}
