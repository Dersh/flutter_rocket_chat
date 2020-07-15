import 'dart:convert';
import 'package:http/http.dart' as http;
import 'base.dart';

class Auth {
  String token;
  String userId;

  Auth({this.userId, this.token});

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
        userId: json['data']['userId'] as String,
        token: json['data']['authToken'] as String);
  }
}

Future<Auth> doAuth(String name, String pwd) async {
  const url = "$baseUrl/api/v1/login";

  final response = await http.post(url, body: {
    'user': '$name',
    'password': '$pwd',
  });

  if (response.statusCode == 200) {
    return Auth.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
