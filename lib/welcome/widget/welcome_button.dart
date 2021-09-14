import 'package:flutter/material.dart';
import 'package:quit_smoking_app/constants.dart';
import 'package:quit_smoking_app/home/home.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: secondaryColor,
            blurRadius: 2,
            offset: Offset(-1, 2),
          ),
          BoxShadow(
            color: secondaryColor,
            blurRadius: 2,
            offset: Offset(1, -2),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: secondaryColor,
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Home()));
        },
        child: Text(
          'hadi başlayalım!'.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
