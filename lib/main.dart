import 'package:flutter/material.dart';

import '../screens/home.dart';
import '../screens/signin.dart';
import '../screens/signup.dart';

import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const MaterialApp(home: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getPref();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            "assets/background.jpg",
            fit: BoxFit.fill,
          ),
        ),
        (_loginStatus==1)?Home():SignIn()
      ],),
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signin': (BuildContext context) => SignIn(),
        '/signup': (BuildContext context) => const SignUp(),
        '/home': (BuildContext context) => Home(),
      },
    );
  }
var _loginStatus=0;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _loginStatus = preferences.getInt("value");


    });
  }
}

