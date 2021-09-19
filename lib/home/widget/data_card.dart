import 'package:flutter/material.dart';
import 'package:quit_smoking_app/constants.dart';
import 'package:quit_smoking_app/models/earnings.dart';

class DataCard extends StatelessWidget {
  final Earnings? earnings;
  const DataCard({Key? key, this.earnings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: secondaryColor,
              gradient: gradientLR,
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
            top: 70,
            left: 10,
            child: Text(
              earnings!.name!,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
