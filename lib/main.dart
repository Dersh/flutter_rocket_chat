import 'package:flutter/material.dart';
import 'package:flutter_rocket_chat/model/profile.dart';
import 'model/auth.dart';
import 'model/message.dart';
import 'model/profile.dart';

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
  Future<Auth> auth;
  final String username = "dersh";
  final String pwd = "Welcome01";
  int _counter = 0;
  String _msg = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
      _msg = "";
    });
  }

  @override
  void initState() {
    super.initState();
    auth = doAuth(username, pwd);
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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            // пользовательский код
            FlatButton(
              child: Text('Run Future'),
              onPressed: () {
                runMyFuture();
              },
            ),
            Text(
              '$_msg',
            ),
            FutureBuilder(
                future: auth,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.token);
                  } else if (snapshot.hasError) {
                    return Text("Error");
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

// Future
  Future<bool> myTypedFuture() async {
    await Future.delayed(Duration(seconds: 1));
    return Future.error('Error from return');
  }

// Function to call future
  void runMyFuture() {
    myTypedFuture().then((value) {
      // Run extra code here
    }, onError: (error) {
      setState(() {
        _msg = error;
      });
    });
  }
}
