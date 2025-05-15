import 'package:flutter/material.dart';
import 'package:anbd/data/dto/response/chatting_room_response.dart';
import 'package:anbd/data/service/chat_service.dart';

class ChatViewModel extends ChangeNotifier {
  final ChatService _service;

  ChatViewModel(this._service) {
    _loadChattingRooms();
  }

  List<ChattingRoomResponse> _chatData = [];
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<ChattingRoomResponse> get chatData => _chatData;

  Future<void> _loadChattingRooms() async {
    try {
      _isLoading = true;
      notifyListeners();

      final data = await _service.getChattingRoomList();
      _chatData = data;
    } catch (e) {
      print('채팅방 목록 불러오기 오류: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _loadChatting() async {
    try {
      _isLoading = true;
      notifyListeners();

      final data = await _service.getChattingRoomList();
      _chatData = data;
    } catch (e) {
      print('채팅방 목록 불러오기 오류: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
