import 'package:flutter/material.dart';
import 'package:quit_smoking_app/constants.dart';
import 'package:quit_smoking_app/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

//STREAMING OBJECT
import "package:quit_smoking_app/MyAppStreamObject.dart";

//STREAMING SHARED PREFERENCE
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';


class WelcomeButton extends StatelessWidget {
  final MyAppStreamObject? myAppStreamObject;
  WelcomeButton({this.myAppStreamObject});


  setRegisterDate()async{
    DateTime now = DateTime.now();
    this.myAppStreamObject?.registerDate.setValue(now.toString());
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: secondaryColor,
            blurRadius: 2,
            offset: Offset(-1, 2),
          ),
          BoxShadow(
            color: secondaryColor,
            blurRadius: 2,
            offset: Offset(1, -2),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: secondaryColor,
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () async{
          await setRegisterDate();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Home(myAppStreamObject: myAppStreamObject)));
        },
        child: Text(
          'hadi başlayalım!'.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
