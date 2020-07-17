import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rocket_chat/model/self_profile.dart';
import 'model/const.dart';
import 'package:http/http.dart' as http;

import 'model/login.dart';
import 'model/room.dart';
import 'model/user.dart';
import 'model/base.dart';
import 'model/message.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocket Chat Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Rocket Chat Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
                future: check(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('Auth-Token: ${snapshot.data}');
                  } else if (snapshot.hasError) {
                    return Text("Error");
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<String> check() async {
    final String username = "dersh";
    final String pwd = "Welcome01";

    var login = await logIn(username, pwd);
    var rooms = await getRooms(login);
    var msg = await sendMessage("hello", rooms.update.first.sId, login);
    var result = await updateOwnName("myNewName", login);
    var me = await getSelfProfile(login);
    var logoutResult = await logOut(login);

    final String newuser = "newAcc01";
    //var r1 = await registerUser(newuser, newuser, "$newuser@a.ru", pwd);
    login = await logIn(newuser, pwd);
    //var r2 = await updateOwnName("newName", login);
    // var r3 = await createRoom("someChannel", login);
    // var r4 = await inviteToRoom(r3.room.sId, "bctf3QWfJAPXpMpZt", login);
    // var r5 = await deleteRoom("someChanllel", login);
    var r6 = await deleteSelfAccount(pwd, login);

    return logoutResult.data.message;
  }
}

Future<Login> logIn(String username, String pwd) async {
  const url = "$baseUrl/api/v1/login";

  var response = await http.post(url, body: {
    'user': '$username',
    'password': '$pwd',
  });

  if (response.statusCode == 200) {
    return Login.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}

Future<RoomList> getRooms(Login login) async {
  const url = "$baseUrl/api/v1/rooms.get";

  var response = await http.get(url, headers: {
    'X-Auth-Token': '${login.data.authToken}',
    'X-User-Id': '${login.data.userId}',
    'Content-type': 'application/json'
  });

  if (response.statusCode == 200) {
    return RoomList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}

Future<MessageResult> sendMessage(
    String text, String channel, Login login) async {
  const url = '$baseUrl/api/v1/chat.sendMessage';

  var response = await http.post(url,
      headers: {
        'X-Auth-Token': '${login.data.authToken}',
        'X-User-Id': '${login.data.userId}',
        'Content-type': 'application/json'
      },
      body: '{"message":{"rid":"$channel","msg":"$text"}}');

  if (response.statusCode == 200) {
    return MessageResult.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}

Future<Base> updateOwnName(String newName, Login login) async {
  const url = '$baseUrl/api/v1/users.updateOwnBasicInfo';

  var response = await http.post(url,
      headers: {
        'X-Auth-Token': '${login.data.authToken}',
        'X-User-Id': '${login.data.userId}',
        'Content-type': 'application/json'
      },
      body: '{"data":{"name":"$newName"}}');

  if (response.statusCode == 200) {
    return Base.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}

Future<SelfProfile> getSelfProfile(Login login) async {
  const url = '$baseUrl/api/v1/me';

  var response = await http.get(url, headers: {
    'X-Auth-Token': '${login.data.authToken}',
    'X-User-Id': '${login.data.userId}',
  });

  if (response.statusCode == 200) {
    return SelfProfile.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}

Future<Base> logOut(Login login) async {
  const url = '$baseUrl/api/v1/logout';

  var response = await http.post(url, headers: {
    'X-Auth-Token': '${login.data.authToken}',
    'X-User-Id': '${login.data.userId}',
  });

  if (response.statusCode == 200) {
    return Base.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}

Future<RoomResult> createRoom(String channelname, Login login) async {
  var response = await http.post('$baseUrl/api/v1/channels.create',
      headers: {
        'X-Auth-Token': '${login.data.authToken}',
        'X-User-Id': '${login.data.userId}',
        'Content-type': 'application/json'
      },
      body: '{"name":"$channelname"}');

  if (response.statusCode == 200) {
    return RoomResult.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}

Future<RoomResult> inviteToRoom(
    String roomId, String recepientUserId, Login login) async {
  var response = await http.post('$baseUrl/api/v1/channels.invite',
      headers: {
        'X-Auth-Token': '${login.data.authToken}',
        'X-User-Id': '${login.data.userId}',
        'Content-type': 'application/json'
      },
      body: '{"roomId":"$roomId","userId":"$recepientUserId"}');

  if (response.statusCode == 200) {
    return RoomResult.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}

Future<Base> deleteRoom(String channelname, Login login) async {
  var response = await http.post('$baseUrl/api/v1/channels.delete',
      headers: {
        'X-Auth-Token': '${login.data.authToken}',
        'X-User-Id': '${login.data.userId}',
        'Content-type': 'application/json'
      },
      body: '{"roomName":"$channelname"}');

  if (response.statusCode == 200) {
    return Base.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}

Future<Base> deleteSelfAccount(String pwd, Login login) async {
  var bytes = utf8.encode(pwd); // data being hashed
  var pwdhash = sha256.convert(bytes);
  var response = await http.post('$baseUrl/api/v1/users.deleteOwnAccount',
      headers: {
        'X-Auth-Token': '${login.data.authToken}',
        'X-User-Id': '${login.data.userId}',
        'Content-type': 'application/json'
      },
      body: '{"password":"$pwdhash"}');

  if (response.statusCode == 200) {
    return Base.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}

Future<UserResult> registerUser(
    String name, String username, String email, String pwd) async {
  var response = await http.post('$baseUrl/api/v1/users.register',
      headers: {'Content-type': 'application/json'},
      body:
          '{"username":"$username","email":"$email","pass":"$pwd","name":"$name"}');

  if (response.statusCode == 200) {
    return UserResult.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
