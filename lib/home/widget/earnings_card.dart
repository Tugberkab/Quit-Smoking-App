import 'package:flutter/material.dart';
import 'package:quit_smoking_app/constants.dart';
import 'package:quit_smoking_app/models/earnings.dart';
import 'package:quit_smoking_app/models/time.dart';

class EarningsCard extends StatelessWidget {
  final Duration? duration;
  final Earnings? earnings;
  final int? paket;
  EarningsCard({Key? key, this.earnings, this.duration, this.paket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(12),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: secondaryColor,
            gradient: gradientLR,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 4,
                blurRadius: 9,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Align(
            child: Transform.rotate(
              angle: 155,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1, -2),
                      color: Colors.black,
                      blurRadius: 10,
                    )
                  ],
                  color: Colors.black,
                ),
                height: 2,
                width: double.infinity,
              ),
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 20,
          child: Text(
            earnings!.name!,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 40,
          right: 30,
          child: Text(
            (earnings!.increase! * duration!.inDays * paket!).toString(),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Positioned(
          top: 70,
          right: 30,
          child: Text( earnings!.text_right!, textAlign: TextAlign.end, style: TextStyle(color: Colors.white),),
        ),
      ],
    );
  }
}
