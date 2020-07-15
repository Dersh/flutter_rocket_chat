import 'dart:convert';
import 'package:http/http.dart' as http;
import 'base.dart';

class Profile {
  String userId;
  String name;
  String email;
  String avatarUrl;

  Profile({this.userId, this.name, this.email, this.avatarUrl});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        userId: json['userId'] as String,
        name: json['name'] as String,
        email: json['email'][0]['address'] as String,
        avatarUrl: json['avatarUrl'] as String);
  }
}

Future<Profile> getSelfProfile() async {
  const url = "$baseUrl/api/v1/me";

  final response = await http.get(url);

  if (response.statusCode == 200) {
    return Profile.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
