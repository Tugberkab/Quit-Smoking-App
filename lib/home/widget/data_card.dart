import 'package:flutter/material.dart';
import 'package:quit_smoking_app/constants.dart';
import 'package:quit_smoking_app/models/earnings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quit_smoking_app/models/time.dart';

class DataCard extends StatelessWidget {
  final Time? time;
  final Earnings? earnings;
  const DataCard({Key? key, this.earnings, this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                      blurRadius: 2,
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
          top: 50,
          left: 10,
          child: Text(
            earnings!.name!,
            style: GoogleFonts.poppins(
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 30,
          right: 20,
          child: Text(
            earnings!.increase!.toString(),
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    );
  }
}
