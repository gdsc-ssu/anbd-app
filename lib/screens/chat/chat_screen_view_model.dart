import 'package:flutter/material.dart';

class ChatViewModel extends ChangeNotifier {
  final List<Map<String, String>> _chatData = [
    {
      'name': '요우',
      'location': '군자동',
      'time': '1주 전',
      'message': '감사합니다!! 조심히가세요!',
      'profileImage': 'https://via.placeholder.com/150x150.png?text=YoU',
      'thumbnail': 'https://via.placeholder.com/80x80.png?text=Item1',
    },
    {
      'name': '요이키',
      'location': '문정동',
      'time': '1주 전',
      'message': '확인했습니다 감사합니다 :)',
      'profileImage': '',
      'thumbnail': 'https://via.placeholder.com/80x80.png?text=Item2',
    },
    {
      'name': 'chan',
      'location': '구의동',
      'time': '2주 전',
      'message': '넵 수고하세용',
      'profileImage': 'https://via.placeholder.com/150x150.png?text=Chan',
      'thumbnail': 'https://via.placeholder.com/80x80.png?text=Item3',
    },
  ];

  List<Map<String, String>> get chatData => _chatData;
}
