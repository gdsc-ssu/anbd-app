import 'package:flutter/material.dart';
import 'package:anbd/data/dto/response/chatting_messages_response.dart';
import 'package:anbd/data/service/chat_service.dart';
import 'package:intl/intl.dart';
import 'package:anbd/data/repository/local/secure_storage_repository.dart';

class ChattingRoomViewModel extends ChangeNotifier {
  final int roomId;
  final String profileUrl;
  final String title;
  final String image;
  final ChatService _service = ChatService();
  final SecureStorageRepository _secureStorage = SecureStorageRepository();

  ChattingRoomViewModel({
    required this.roomId,
    required this.profileUrl,
    required this.title,
    required this.image,
  });

  List<Message> messages = [];
  bool isLoading = false;

  Future<void> loadChatting() async {
    try {
      isLoading = true;
      notifyListeners();

      final myId = int.parse(/*await _secureStorage.readUserId() ?? */ '30');

      final page = await _service.getChattingMessages(
        roomId: roomId,
        page: 0,
        size: 100,
        sort: ['timestamp,asc'],
      );

      messages = page.content.map((msg) {
        return Message(
          text: msg.message,
          time: _formatTime(DateTime.parse(msg.timestamp.toString())),
          isMe: msg.senderId == myId,
          profileUrl: profileUrl,
        );
      }).toList();
    } catch (e) {
      print('채팅 메시지 불러오기 오류: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  String _formatTime(DateTime time) {
    return DateFormat('a h:mm', 'ko').format(time.toLocal());
  }

  void sendMessage(String text) {
    messages.add(
      Message(
        text: text,
        time: _formatTime(DateTime.now()),
        isMe: true,
      ),
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
