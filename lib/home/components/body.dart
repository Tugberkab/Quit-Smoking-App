import 'dart:async';

import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:flutter/material.dart';
import 'package:quit_smoking_app/home/widget/earnings_card.dart';
import 'package:quit_smoking_app/home/widget/info_card.dart';
import 'package:quit_smoking_app/models/earnings.dart';
import 'package:quit_smoking_app/models/time.dart';
import 'package:quit_smoking_app/models/info.dart';
import 'package:shared_preferences/shared_preferences.dart';

//STREAMING OBJECT
import "package:quit_smoking_app/MyAppStreamObject.dart";

//STREAMING SHARED PREFERENCE
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class Body extends StatefulWidget {
  final MyAppStreamObject? myAppStreamObject;
  final Duration? difference;
  Body({this.myAppStreamObject, this.difference});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // Future<DateTime> getRegisterDate()async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   DateTime registerDate = DateTime.parse(prefs.getString("registerDate").toString());
  //   return registerDate;
  // }

  @override
  Widget build(BuildContext context) {
    return PreferenceBuilder(
      preference: widget.myAppStreamObject!.registerDate,
      builder: (context, String value) {
        if(value == "" || value==null){
          return Container(color: Colors.red,);
        }
        else{
          return Container(
            color: Colors.white,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                crossAxisCount: 2,
                childAspectRatio: 1.5,
              ),
              itemCount: earnings.length,
              itemBuilder: (BuildContext context, int index) => EarningsCard(
                earnings: earnings[index],
                duration: widget.difference!,
                paket: widget.myAppStreamObject!.paket.getValue(),
              ),
            ),
          );
        }
      },
    );
  }
}
