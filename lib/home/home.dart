import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quit_smoking_app/constants.dart';
import 'package:quit_smoking_app/home/components/body.dart';
import 'package:quit_smoking_app/home/widget/custom_shape.dart';
import "package:quit_smoking_app/MyAppStreamObject.dart";
import 'package:quit_smoking_app/home/widget/info_card.dart';
import 'package:quit_smoking_app/home/widget/time_card.dart';
import 'package:quit_smoking_app/models/info.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:quit_smoking_app/models/time.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class Home extends StatefulWidget {
  final MyAppStreamObject? myAppStreamObject;
  final int? paket;
  Home({this.myAppStreamObject, this.paket});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Time timeModel = Time();
  late Timer timer;
  late DateTime now;
  Duration difference = Duration();
  late DateTime registerDate;

  @override
  Widget build(BuildContext context) {
    if (widget.myAppStreamObject != null) {
      return Scaffold(
        appBar: buildCustomAppBar(context, widget.myAppStreamObject),
        body: SnappingSheet(
          lockOverflowDrag: true,
          grabbingHeight: 60,
          grabbing: Padding(
            padding: EdgeInsets.only(top: 0),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-5, -5),
                    color: Colors.black45,
                    spreadRadius: 3,
                    blurRadius: 7,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 3,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Text(
                      'Bilgiler',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
          sheetBelow: SnappingSheetContent(
            draggable: true,
            sizeBehavior: SheetSizeStatic(size: 250),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: info.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.all(5),
                    child: InfoCard(
                      duration: difference,
                      info: info[index],
                      coefficient: info[index].coefficient,
                    ),
                  ),
                ),
              ),
            ),
          ),
          snappingPositions: [
            SnappingPosition.factor(
              positionFactor: 0.0,
              snappingCurve: Curves.easeOutExpo,
              snappingDuration: Duration(seconds: 1),
              grabbingContentOffset: GrabbingContentOffset.top,
            ),
            SnappingPosition.pixels(
              positionPixels: MediaQuery.of(context).size.height * 2 / 3 - 60,
              snappingCurve: Curves.elasticOut,
              snappingDuration: Duration(milliseconds: 1750),
            ),
            SnappingPosition.factor(
              positionFactor: 0.80,
              snappingCurve: Curves.bounceOut,
              snappingDuration: Duration(seconds: 1),
              grabbingContentOffset: GrabbingContentOffset.bottom,
            ),
          ],
          child: Body(myAppStreamObject: widget.myAppStreamObject, paket: widget.paket!),
        ),

        //Body(myAppStreamObject: widget.myAppStreamObject),
      );
    } else {
      return Text("error");
    }
  }

  showResetDialog(BuildContext context){
    showDialog(context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext){
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              padding: EdgeInsets.only(left: 20,top: 20, right: 20,bottom: 20
              ),
              margin: EdgeInsets.only(top: 45),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.black,offset: Offset(0,10),
                        blurRadius: 10
                    ),
                  ]
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "RESET DATE?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: (){
                      resetDate();
                      Navigator.pop(context);
                    },
                    child: Text("Reset",style: TextStyle(color:Colors.red[700],fontSize: 18),textAlign: TextAlign.center,)
                  ),
                  SizedBox(height: 12,),
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Cancel",style: TextStyle(color:Colors.black,fontSize: 18),textAlign: TextAlign.center,)
                  ),
                ],
              ),
            ),
          );

        }
    );
  }

  Future<void> resetDate() async {
    widget.myAppStreamObject!.registerDate.setValue(DateTime.now().toString());
  }

  AppBar buildCustomAppBar(
      BuildContext context, MyAppStreamObject? myAppStreamObject) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height / 3,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: ClipPath(
        clipper: CustomShape(),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: primaryColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SafeArea(
                child: PreferenceBuilder(
                  preference: myAppStreamObject!.registerDate,
                  builder: (context, String value) {


                    // BURASI COMMENTLI KALSIN
                    registerDate = DateTime.parse(value);

                    timer = Timer.periodic(Duration(seconds: 1), (timer) {
                      now = DateTime.now();
                      difference = now.difference(registerDate);
                      //print(difference.toString());

                      setState(() {
                        timeModel = Time.fromDuration(difference);
                      });
                    });







                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SİGARASIZ GEÇEN",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text("${timeModel.days}", style: TextStyle(fontSize: 55, color: Colors.white),),
                        //     SizedBox(width: 15,),
                        //     Text("GÜN", style: TextStyle(fontSize: 30, color: Colors.white),)
                        //   ],
                        // ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TimeCard("Yıl", timeModel.years),
                            TimeCard("Ay", timeModel.months),
                            TimeCard("Gün", timeModel.days),
                            TimeCard("Saat", timeModel.hours),
                            TimeCard("Dakika", timeModel.minutes),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                    timeModel.seconds.toString(),
                                    style: TextStyle(
                                    color: Colors.black, fontSize: 20)
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text("${timeModel.years} YEARS"),
                        //     Text("${timeModel.months} MONTHS"),
                        //     Text("${timeModel.weeks} WEEKS"),
                        //   ],
                        // ),
                        // SizedBox(height: 20,),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text("${timeModel.days} DAYS"),
                        //     Text("${timeModel.hours} HOURS"),
                        //     Text("${timeModel.minutes} MINUTES"),
                        //     Text("${timeModel.seconds} SECONDS"),
                        //   ],
                        // ),
                        SizedBox(height: 15),
                        Text("Başlangıç: " + registerDate.toString().substring(0,registerDate.toString().lastIndexOf(":")), style: TextStyle(fontSize: 16,color: Colors.white),)
                      ],
                    );
                  },
                ),
              ),

              buildIconButton(),
            ],
          ),
        ),
      ),
    );
  }

  Container buildIconButton() {
    return Container(
      height: MediaQuery.of(context).size.width / 8,
      width: MediaQuery.of(context).size.width / 8,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              spreadRadius: 5,
              blurRadius: 7,
              color: Colors.black.withOpacity(0.3),
            )
          ]),
      child: IconButton(
        splashRadius: 1,
        splashColor: Colors.blue,
        onPressed: () async {
          showResetDialog(context);
          //await resetDate();
        },
        icon: Icon(
          Icons.restore,
          color: Colors.grey[700],
          size: MediaQuery.of(context).size.width / 12,
        ),
      ),
    );
  }
}
