import 'package:flutter/material.dart';
import 'package:quit_smoking_app/home/widget/data_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 50,
                crossAxisSpacing: 20,
                crossAxisCount: 2,
                childAspectRatio: 1.5,
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) => DataCard(),
            ),
          ),
          Text('Bilgiler'),
        ],
      ),
    );
  }
}
