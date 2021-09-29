import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeCard extends StatelessWidget {
  String? info;
  int? value;
  TimeCard(this.info, this.value);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
          padding: EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height / 8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value!.toString(),
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
              Text(
                info!,
                style: TextStyle(color: Colors.black, fontSize: 20),
              )
            ],
          )),
    );
  }
}
