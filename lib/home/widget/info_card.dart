import 'package:flutter/material.dart';
import 'package:quit_smoking_app/models/info.dart';
import 'package:percent_indicator/percent_indicator.dart';

class InfoCard extends StatelessWidget {
  final Info? info;
  const InfoCard({Key? key, this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            info!.text!,
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 20,
            lineHeight: 30,
            //percent: info!.increase!,
          ),
        ],
      ),
    );
  }
}
