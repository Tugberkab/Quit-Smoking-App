import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quit_smoking_app/home/widget/data_card.dart';
import 'package:quit_smoking_app/models/earnings.dart';
import 'package:shared_preferences/shared_preferences.dart';

//STREAMING OBJECT
import "package:quit_smoking_app/MyAppStreamObject.dart";

//STREAMING SHARED PREFERENCE
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class Body extends StatefulWidget {
  final Earnings? earnings;
  final MyAppStreamObject? myAppStreamObject;
  Body({this.myAppStreamObject, this.earnings});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Timer timer;
  late DateTime now;
  late Duration difference;
  late DateTime registerDate;
  Map<String, int> parsedData = {};

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
        timer = Timer.periodic(Duration(seconds: 1), (timer) {
          now = DateTime.now();
          difference = now.difference(registerDate);
          //print(difference.toString());
          setState(() {
            parsedData = parseDate(difference);
          });
        });
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${parsedData['years'] ?? 0} YEARS"),
            Text("${parsedData['months'] ?? 0} MONTHS"),
            Text("${parsedData['weeks'] ?? 0} WEEKS"),
            Text("${parsedData['days'] ?? 0} DAYS"),
            Text("${parsedData['hours'] ?? 0} HOURS"),
            Text("${parsedData['minutes'] ?? 0} MINUTES"),
            Text("${parsedData['seconds'] ?? 0} SECONDS"),
            Expanded(
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
            Text('Bilgiler'),
          ],
        );
      },
    );
  }
}
