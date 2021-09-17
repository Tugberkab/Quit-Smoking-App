import 'package:flutter/material.dart';
import 'package:quit_smoking_app/constants.dart';
//COMPONENTS
import 'package:quit_smoking_app/home/components/body.dart';
//WIDGETS
import 'package:quit_smoking_app/home/widget/custom_shape.dart';
//STREAMING OBJECT
import "package:quit_smoking_app/MyAppStreamObject.dart";
//STREAMING SHARED PREFERENCE
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  final MyAppStreamObject? myAppStreamObject;
  Home({this.myAppStreamObject});

  @override
  Widget build(BuildContext context) {
    if (myAppStreamObject != null) {
      return Scaffold(
        appBar: buildCustomAppBar(context, myAppStreamObject),
        body: Body(myAppStreamObject: myAppStreamObject),
      );
    } else {
      return Text("error");
    }
  }

  Future<void> resetDate() async {
    myAppStreamObject!.registerDate.setValue(DateTime.now().toString());
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
          padding: EdgeInsets.fromLTRB(15, 30, 15, 15),
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
                    return Text("asdasd");
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
