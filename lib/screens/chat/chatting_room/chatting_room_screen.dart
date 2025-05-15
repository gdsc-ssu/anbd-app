import 'package:anbd/screens/chat/chatting_room/chatting_room_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/sender_message.dart';
import 'widgets/receiver_message.dart';

class ChattingRoomScreen extends StatelessWidget {
  const ChattingRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChattingRoomViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('요우'),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1,
          foregroundColor: Colors.black,
          actions: [
            IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
        body: Column(
          children: [
            // 상품 정보 영역
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFFF6F6F6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://via.placeholder.com/60x60.png?text=상품',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('거래완료',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('세제용품 나눔합니다'),
                      Text('5000원'),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),

            // 메시지 목록
            Expanded(
              child: Consumer<ChattingRoomViewModel>(
                builder: (context, viewModel, _) {
                  return ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemCount: viewModel.messages.length,
                    itemBuilder: (context, index) {
                      final msg = viewModel.messages[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: msg.isMe
                            ? ReceiverMessage(
                                text: msg.text,
                                time: msg.time,
                                isRead: msg.isRead,
                              )
                            : SenderMessage(
                                text: msg.text,
                                time: msg.time,
                                profileUrl: msg.profileUrl!,
                              ),
                      );
                    },
                  );
                },
              ),
            ),

            // 입력창
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Color(0xFFEEEEEE))),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Icon(Icons.add),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F3F3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: '메시지 보내기',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.send, color: Colors.grey),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
