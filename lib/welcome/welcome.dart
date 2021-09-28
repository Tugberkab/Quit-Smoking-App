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
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg1.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      welcomeText,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        height: 1.3,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Tükettiğiniz sigara paketi sayısı',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 60,
                          child: NumberSelection(
                            theme: NumberSelectionTheme(
                                draggableCircleColor: Colors.grey,
                                iconsColor: Colors.white,
                                numberColor: Colors.white,
                                backgroundColor: Colors.deepPurpleAccent,
                                outOfConstraintsColor: Colors.red),
                            initialValue: 1,
                            minValue: 1,
                            maxValue: 10,
                            direction: Axis.horizontal,
                            withSpring: true,
                            onChanged: (int value) => print("value: $value"),
                            enableOnOutOfConstraintsAnimation: true,
                            onOutOfConstraints: () => print("This value is too high or too low"),
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
