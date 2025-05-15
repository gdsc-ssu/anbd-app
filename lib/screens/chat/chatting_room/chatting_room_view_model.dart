import 'package:flutter/material.dart';

class ChattingRoomViewModel extends ChangeNotifier {
  final List<Message> messages = [
    Message(
      text: '안녕하세요! 송실대입구역에서 거래 가능할까요?',
      time: '오후 3:55',
      isMe: false,
      profileUrl: 'https://via.placeholder.com/150.png?text=YoU',
    ),
    Message(
      text: '네네 가능합니다!',
      time: '오후 3:57',
      isMe: true,
      isRead: true,
    ),
  ];

  // 메시지 전송 (데모용)
  void sendMessage(String text) {
    messages.add(
      Message(text: text, time: '오후 4:00', isMe: true),
    );
    notifyListeners();
  }
}

class Message {
  final String text;
  final String time;
  final bool isMe;
  final bool isRead;
  final String? profileUrl;

  Message({
    required this.text,
    required this.time,
    required this.isMe,
    this.isRead = false,
    this.profileUrl,
  });
}
