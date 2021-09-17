import 'dart:async';

import 'package:flutter/material.dart';

//MODELS
import 'package:quit_smoking_app/models/time.dart';

//WIDGETS
import 'package:quit_smoking_app/home/widget/data_card.dart';

//STREAMING OBJECT
import "package:quit_smoking_app/MyAppStreamObject.dart";

//STREAMING SHARED PREFERENCE
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';



class Body extends StatefulWidget {
  final MyAppStreamObject? myAppStreamObject;
  Body({this.myAppStreamObject});


  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {



  late Timer timer;
  late DateTime now;
  late Duration difference;
  late DateTime registerDate;
  Map<String, int> parsedData = {};
  Time timeModel = Time();

  // Future<DateTime> getRegisterDate()async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   DateTime registerDate = DateTime.parse(prefs.getString("registerDate").toString());
  //   return registerDate;
  // }

  @override
  Widget build(BuildContext context) {
    return PreferenceBuilder(
        preference: widget.myAppStreamObject!.registerDate,
        builder: (context, String value){
          registerDate = DateTime.parse(value);

          timer = Timer.periodic(Duration(seconds: 1), (timer) {
            now = DateTime.now();
            difference = now.difference(registerDate);
            //print(difference.toString());

            setState(() {
              timeModel = Time.fromDuration(difference);
            });
          });

          return ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      "${timeModel.years} YEARS"
                  ),
                  Text(
                      "${timeModel.months} MONTHS"
                  ),
                  Text(
                      "${timeModel.weeks} WEEKS"
                  ),
                  Text(
                      "${timeModel.days} DAYS"
                  ),
                  Text(
                      "${timeModel.hours} HOURS"
                  ),
                  Text(
                      "${timeModel.minutes} MINUTES"
                  ),
                  Text(
                      "${timeModel.seconds} SECONDS"
                  ),


                  Text('Bilgiler'),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  )
                ],
              ),
            ],
          );
        });
  }
}
