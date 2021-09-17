import 'package:flutter/material.dart';

import 'package:quit_smoking_app/welcome/welcome.dart';

//STREAMING OBJECT
import "package:quit_smoking_app/MyAppStreamObject.dart";

//STREAMING SHARED PREFERENCE
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final StreamingSharedPreferences preferences = await StreamingSharedPreferences.instance;
  final streamingObject = MyAppStreamObject(preferences);

  runApp(MyApp(myAppStreamObject: streamingObject));
}

class MyApp extends StatelessWidget {
  final MyAppStreamObject? myAppStreamObject;
  MyApp({this.myAppStreamObject});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(myAppStreamObject: myAppStreamObject),
    );
  }
}
