import 'package:anbd/screens/chat/chat_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatViewModel(),
      child: Scaffold(
        body: Consumer<ChatViewModel>(
          builder: (context, viewModel, child) {
            final chatData = viewModel.chatData;

            return ListView.builder(
              itemCount: chatData.length,
              itemBuilder: (context, index) {
                final chat = chatData[index];
                return Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      leading: chat['profileImage']!.isEmpty
                          ? const CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.person, color: Colors.white),
                            )
                          : CircleAvatar(
                              radius: 22,
                              backgroundImage:
                                  NetworkImage(chat['profileImage']!),
                            ),
                      title: Row(
                        children: [
                          Text(chat['name']!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 6),
                          Text(
                            '${chat['location']} · ${chat['time']}',
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(chat['message']!),
                      ),
                      trailing: chat['thumbnail'] != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                chat['thumbnail']!,
                                width: 48,
                                height: 48,
                                fit: BoxFit.cover,
                              ),
                            )
                          : null,
                    ),
                    if (index != chatData.length - 1)
                      const Padding(
                        padding: EdgeInsets.only(left: 80, right: 16),
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: Color(0xFFEEEEEE),
                        ),
                      ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
