import 'package:flutter/material.dart';

class DropDownBtn extends StatefulWidget {
  const DropDownBtn({Key? key}) : super(key: key);

  @override
  _DropDownBtnState createState() => _DropDownBtnState();
}

class _DropDownBtnState extends State<DropDownBtn> {
  final items = ['1', '2', '3', '4', '5'];
  String? value;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text('1'),
      iconSize: 30,
      underline: SizedBox(),
      isExpanded: true,
      value: value,
      items: items.map(buildMenuItem).toList(),
      onChanged: (value) => setState(() => this.value = value),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      );
}
