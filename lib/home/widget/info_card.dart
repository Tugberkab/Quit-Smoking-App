import 'package:flutter/material.dart';
import 'package:quit_smoking_app/models/info.dart';

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
          Container(
            height: 30,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text('%${info!.increase!} tamamlandı.'),
            ),
          ),
        ],
      ),
    );
  }
}
