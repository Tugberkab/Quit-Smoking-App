import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quit_smoking_app/constants.dart';
import 'package:quit_smoking_app/models/info.dart';
import 'package:percent_indicator/percent_indicator.dart';

class InfoCard extends StatelessWidget {
  final Info? info;
  const InfoCard({Key? key, this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffffedf8),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(info!.text!),
          SizedBox(height: MediaQuery.of(context).size.height / 40),
          LinearPercentIndicator(
            progressColor: secondaryColor,
            animationDuration: 2000,
            animation: true,
            center: Text('%' + (info!.increase! * 100).toString()),
            percent: info!.increase!,
            lineHeight: 30,
            //percent: info!.increase!,
          ),
        ],
      ),
    );
  }
}
