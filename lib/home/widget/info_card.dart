import 'package:flutter/material.dart';
import 'package:quit_smoking_app/constants.dart';
import 'package:quit_smoking_app/models/info.dart';
import 'package:percent_indicator/percent_indicator.dart';

class InfoCard extends StatelessWidget {
  final Info? info;
  final Duration? difference;
  final double? coefficient;
  const InfoCard({Key? key, this.info, this.difference, this.coefficient}) : super(key: key);


  get percentageValue{
    late double division;
    if(info!.timeType == "Hour"){
      division = difference!.inHours/coefficient!;
    }
    else if(info!.timeType == "Day"){
      division = difference!.inDays/coefficient!;
    }
    else if(info!.timeType == "Month"){
      division = (difference!.inDays/30)/coefficient!;
    }
    if(division >= 1)
      return 1.0;
    return division;
  }

  get percentageText{
    late double division;
    String text = "";
    if(info!.timeType == "Hour"){
      division = difference!.inHours/coefficient!;
    }
    else if(info!.timeType == "Day"){
      division = difference!.inDays/coefficient!;
    }
    else if(info!.timeType == "Month"){
      division = (difference!.inDays/30)/coefficient!;
    }


    if(division >= 1.0){
      division = 1.0;
    }
    else if(division == 0.0){
      return Text("0" + " %");
    }
    else{
      return Text((division*100).toStringAsFixed(4) + " %");
    }

    return Text("100" + " %");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(info!.text!),
          SizedBox(height: MediaQuery.of(context).size.height / 200),
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
