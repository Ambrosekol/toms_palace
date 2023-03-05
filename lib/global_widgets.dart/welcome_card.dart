import 'package:flutter/material.dart';

Widget welcomeCard() {
  return Card(
    child: Row(
      children: [
        Image.asset(
          'assets/images/Food welcome image.png',
          width: 160,
        ),
        Column(),
        Align(
          alignment: Alignment.bottomRight,
          child: Material(
            child: Image.asset(
              'assets/images/basket image.png',
              width: 50,
            ),
          ),
        )
      ],
    ),
  );
}
