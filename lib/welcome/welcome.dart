import 'package:flutter/material.dart';
import 'package:quit_smoking_app/constants.dart';

//WIDGETS
import 'package:quit_smoking_app/welcome/widget/dropdown_btn.dart';
import 'package:quit_smoking_app/welcome/widget/welcome_button.dart';

//STREAMING OBJECT
import "package:quit_smoking_app/MyAppStreamObject.dart";

//STREAMING SHARED PREFERENCE
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class WelcomePage extends StatelessWidget {
  final MyAppStreamObject? myAppStreamObject;
  WelcomePage({this.myAppStreamObject});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: gradientTB,
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset('assets/images/smoke.png'),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      welcomeText,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.3,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tükettiğiniz sigara paketi sayısı',
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 50),
                            child: DropDownBtn(),
                          ),
                        ),
                      ],
                    ),
                    WelcomeButton(myAppStreamObject: myAppStreamObject),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
