import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quit_smoking_app/constants.dart';
//COMPONENTS
import 'package:quit_smoking_app/home/components/body.dart';
//WIDGETS
import 'package:quit_smoking_app/home/widget/custom_shape.dart';
//STREAMING OBJECT
import "package:quit_smoking_app/MyAppStreamObject.dart";
import 'package:quit_smoking_app/models/time.dart';
//STREAMING SHARED PREFERENCE
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
        body: Body(myAppStreamObject: widget.myAppStreamObject),
      );
    } else {
      return Text("error");
    }
  }

  Future<void> resetDate() async {
    widget.myAppStreamObject!.registerDate.setValue(DateTime.now().toString());
  }

  Widget InfoContainer(String info, int value){
    return UnconstrainedBox(
      child: Container(
        padding: EdgeInsets.all(5),
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value.toString(), style: GoogleFonts.poppins(color: Colors.black, fontSize: 22),),
            Text(info,style: GoogleFonts.poppins(color: Colors.black, fontSize: 20), )
          ],
        )
      ),
    );
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
                            InfoContainer("Yıl", 0),
                            InfoContainer("Ay", 45),
                            InfoContainer("Gün", 25),
                            InfoContainer("Saat", 35),
                            InfoContainer("Dakika", 25),
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
