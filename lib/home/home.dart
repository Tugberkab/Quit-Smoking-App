import 'package:flutter/material.dart';
import 'package:quit_smoking_app/constants.dart';
//COMPONENTS
import 'package:quit_smoking_app/home/components/body.dart';
//WIDGETS
import 'package:quit_smoking_app/home/widget/custom_shape.dart';
//STREAMING OBJECT
import "package:quit_smoking_app/MyAppStreamObject.dart";
import 'package:quit_smoking_app/home/widget/data_card.dart';
import 'package:quit_smoking_app/home/widget/info_card.dart';
import 'package:quit_smoking_app/models/earnings.dart';
import 'package:quit_smoking_app/models/info.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
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
        body: SnappingSheet(
          lockOverflowDrag: true,
          grabbingHeight: 60,
          grabbing: Padding(
            padding: EdgeInsets.only(top: 10),
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
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
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
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
          ),
          sheetAbove: SnappingSheetContent(
            draggable: false,
            sizeBehavior: SheetSizeFill(),
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
            ),
          ),
          sheetBelow: SnappingSheetContent(
            draggable: true,
            sizeBehavior: SheetSizeStatic(size: 250),
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
          snappingPositions: [
            SnappingPosition.factor(
              positionFactor: 0.0,
              snappingCurve: Curves.easeOutExpo,
              snappingDuration: Duration(seconds: 1),
              grabbingContentOffset: GrabbingContentOffset.top,
            ),
            SnappingPosition.pixels(
              positionPixels: 300,
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
          child: Body(myAppStreamObject: myAppStreamObject),
        ),
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
