import 'package:anbd/constants/constants.dart';
import 'package:anbd/screens/chat/chat_view_model.dart';
import 'package:anbd/data/service/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatViewModel(ChatService()),
      child: Scaffold(
        body: Consumer<ChatViewModel>(
          builder: (context, viewModel, child) {
            final chatData = viewModel.chatData;
            final latestMessages = viewModel.latestMessages;

            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: chatData.length,
              itemBuilder: (context, index) {
                final chat = chatData[index];
                final latestMessage =
                    latestMessages[chat.id]?.message ?? '최근 메시지가 없습니다';

                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        context.push(Paths.chattingRoom);
                      },
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      leading: (chat.partner.profileImage?.isEmpty ?? true)
                          ? const CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.person, color: Colors.white),
                            )
                          : CircleAvatar(
                              radius: 22,
                              backgroundImage:
                                  NetworkImage(chat.partner.profileImage!),
                            ),
                      title: Row(
                        children: [
                          Text(chat.partner.nickname,
                              style: AnbdTextStyle.BodySB15),
                          const SizedBox(width: 6),
                          Text(
                            chat.partner.neighborhood,
                            style: AnbdTextStyle.Body10.copyWith(
                              color: AnbdColor.systemGray03,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          latestMessage,
                          style: AnbdTextStyle.Body14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      trailing: chat.sharePost.images.isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                chat.sharePost.images.first,
                                width: 50,
                                height: 50,
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
