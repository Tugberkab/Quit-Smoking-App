import 'dart:async';

import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:flutter/material.dart';
import 'package:quit_smoking_app/home/widget/data_card.dart';
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
  final Info? info;
  final Earnings? earnings;
  final MyAppStreamObject? myAppStreamObject;
  Body({this.myAppStreamObject, this.earnings, this.info});

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
      builder: (context, String value) {
        registerDate = DateTime.parse(value);

        
        // BURASI COMMENTLI KALSIN
        
        // timer = Timer.periodic(Duration(seconds: 1), (timer) {
        //   now = DateTime.now();
        //   difference = now.difference(registerDate);
        //   //print(difference.toString());
        //
        //   setState(() {
        //     timeModel = Time.fromDuration(difference);
        //   });
        // });

        return Container(
          padding: EdgeInsets.all(12),
          color: Colors.white,

          child: Expanded(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 50,
                crossAxisSpacing: 20,
                crossAxisCount: 2,
                childAspectRatio: 1.5,
              ),
              itemCount: earnings.length,
              itemBuilder: (BuildContext context, int index) => DataCard(
                earnings: earnings[index],
              ),
            ),
          ),

        );



      },
    );
  }
}
