import 'dart:convert';
import 'package:http/http.dart' as http;
import 'base.dart';

class MessagesList {
  List<Message> messages;

  MessagesList({this.messages});

  factory MessagesList.fromJson(Map<String, dynamic> json) {
    var messageJson = json["messages"] as List;

    List<Message> messagesList =
        messageJson.map((i) => Message.fromJson(i)).toList();

    return MessagesList(messages: messagesList);
  }
}

class Message {
  String text;
  String roomId;
  String userId;

  Message({this.userId, this.roomId, this.text});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        userId: json['userId'] as String,
        roomId: json['rid'] as String,
        text: json['text'] as String);
  }
}

Future<MessagesList> getMessageList() async {
  const url = "$baseUrl/api/v1/login";

  final response = await http.get(url);

  if (response.statusCode == 200) {
    return MessagesList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
