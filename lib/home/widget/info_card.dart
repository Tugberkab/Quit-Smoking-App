import 'package:flutter/material.dart';
import 'package:quit_smoking_app/constants.dart';
import 'package:quit_smoking_app/models/info.dart';
import 'package:percent_indicator/percent_indicator.dart';

class InfoCard extends StatelessWidget {
  final Info? info;
  final Duration? duration;
  final double? coefficient;
  const InfoCard({Key? key, this.info, this.duration, this.coefficient}) : super(key: key);


  get percentageValue{
    return 0.0;
    // if( (duration!./coefficient!) < 0.001 ){
    //   return 0.0;
    // }
    // else if((timeModel!.minutes/coefficient!) >= 1.0){
    //   return 1.0;
    // }
    // else{
    //   return timeModel!.minutes/coefficient!;
    // }
  }

  get percentageText{
    late double division;
    if(info!.timeType == "Hour"){
      division = duration!.inHours/coefficient!;
    }
    else if(info!.timeType == "Day"){
      division = duration!.inDays/coefficient!;
    }
    else if(info!.timeType == "Month"){
      division = (duration!.inDays/30)/coefficient!;
    }
    return Text(division.toStringAsFixed(7));
  }

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
            center: percentageText,
            percent: percentageValue,
            lineHeight: 30,
          ),
        ],
      ),
    );
  }
}
