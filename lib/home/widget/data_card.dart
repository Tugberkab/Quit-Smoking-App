import 'package:flutter/material.dart';
import 'package:quit_smoking_app/constants.dart';

class DataCard extends StatelessWidget {
  const DataCard({Key? key}) : super(key: key);

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
                  height: 2,
                  width: double.infinity,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
