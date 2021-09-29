import 'package:flutter/material.dart';
import 'package:quit_smoking_app/constants.dart';
import 'package:number_selection/number_selection.dart';

import "package:google_fonts/google_fonts.dart";

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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg1.jpg"), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    welcomeText,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tükettiğin sigara paketi sayısı',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 9,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                    width: 120,
                    height: 60,
                    child: NumberSelection(
                      theme: NumberSelectionTheme(
                          draggableCircleColor: Color(0xffab58a0),
                          iconsColor: Colors.white,
                          numberColor: Colors.white,
                          backgroundColor: Color(0xffecb0d6),
                          outOfConstraintsColor: Colors.red),
                      initialValue: 1,
                      minValue: 1,
                      maxValue: 10,
                      direction: Axis.horizontal,
                      withSpring: true,
                      onChanged: (int value) => print("value: $value"),
                      enableOnOutOfConstraintsAnimation: true,
                      onOutOfConstraints: () =>
                          print("This value is too high or too low"),
                    ),
                  ),
                  SizedBox(height: 10),
                  WelcomeButton(myAppStreamObject: myAppStreamObject),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
