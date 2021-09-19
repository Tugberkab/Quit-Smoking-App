import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quit_smoking_app/constants.dart';
import 'package:quit_smoking_app/home/components/body.dart';
import 'package:quit_smoking_app/home/widget/custom_shape.dart';
import "package:quit_smoking_app/MyAppStreamObject.dart";
import 'package:quit_smoking_app/home/widget/data_card.dart';
import 'package:quit_smoking_app/home/widget/info_card.dart';
import 'package:quit_smoking_app/home/widget/time_card.dart';
import 'package:quit_smoking_app/models/earnings.dart';
import 'package:quit_smoking_app/models/info.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:quit_smoking_app/models/time.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  final MyAppStreamObject? myAppStreamObject;
  Home({this.myAppStreamObject});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Time timeModel = Time();

  @override
  Widget build(BuildContext context) {
    if (widget.myAppStreamObject != null) {
      return Scaffold(
        appBar: buildCustomAppBar(context, widget.myAppStreamObject),
        body: SnappingSheet(
          lockOverflowDrag: true,
          grabbingHeight: 60,
          grabbing: Padding(
            padding: EdgeInsets.only(top:0),
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
                      style: GoogleFonts.poppins(fontSize: 20),
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
                      info: info[index],
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
              positionPixels: MediaQuery.of(context).size.height*2/3 - 60,
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
          child: Body(myAppStreamObject: widget.myAppStreamObject),
        ),


        //Body(myAppStreamObject: widget.myAppStreamObject),
      );
    } else {
      return Text("error");
    }
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
          padding: EdgeInsets.fromLTRB(15, 40, 15, 15),
          width: MediaQuery.of(context).size.width,
          color: primaryColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  buildIconButton(),
                ],
              ),
              PreferenceBuilder(
                  preference: myAppStreamObject!.registerDate,
                  builder: (context, String value) {
                    String registerDate = value;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SİGARASIZ GEÇEN",
                          style: GoogleFonts.poppins(color: Colors.white, fontSize: 30),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text("${timeModel.days}", style: GoogleFonts.poppins(fontSize: 55, color: Colors.white),),
                        //     SizedBox(width: 15,),
                        //     Text("GÜN", style: GoogleFonts.poppins(fontSize: 30, color: Colors.white),)
                        //   ],
                        // ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TimeCard("Yıl", 0),
                            TimeCard("Ay", 45),
                            TimeCard("Gün", 25),
                            TimeCard("Saat", 35),
                            TimeCard("Dakika", 25),
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
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],

                              ),
                              child: Center(child: Text("57",style: GoogleFonts.poppins(color: Colors.black, fontSize: 20)),),
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

                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Container buildIconButton() {
    return Container(
      padding: EdgeInsets.all(0),
      height: 45,
      width: 45,
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
          await resetDate();
        },
        icon: Icon(
          Icons.restore,
          color: Colors.grey[700],
          size: 30,
        ),
      ),
    );
  }
}
