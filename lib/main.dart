import 'package:flutter/material.dart';
import 'package:quit_smoking_app/home/home.dart';

import 'package:quit_smoking_app/welcome/welcome.dart';

//STREAMING OBJECT
import "package:quit_smoking_app/MyAppStreamObject.dart";

//STREAMING SHARED PREFERENCE
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final StreamingSharedPreferences preferences =
      await StreamingSharedPreferences.instance;
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
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      home: PreferenceBuilder(
        preference: myAppStreamObject!.registerDate,
        builder: (context, String value) {
          if(value == null || value == ""){
            return WelcomePage(myAppStreamObject: myAppStreamObject!);
          }
          else{
            return Home(myAppStreamObject: myAppStreamObject!);
          }
        },
      ),


     //
    );
  }
}
