import 'package:flutter/material.dart';
import 'package:quit_smoking_app/home/widget/data_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NeverScrollableScrollPhysics physics = NeverScrollableScrollPhysics();
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              physics: physics,
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
          Divider(thickness: 2),
          Expanded(
            child: Column(
              children: [
                Text('Bilgiler'),
                Text('Bilgiler'),
                Text('Bilgiler'),
                Text('Bilgiler'),
                Text('Bilgiler'),
                Text('Bilgiler'),
                Text('Bilgiler'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
