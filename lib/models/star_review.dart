import 'package:flutter/material.dart';

class ReviewStars {
  ReviewStars(this.noOfGoodStars);
  final int noOfGoodStars;
  List<Widget> stars = [];
  Icon goodIcon = const Icon(
    Icons.star,
    color: Colors.yellow,
    size: 10.0,
  );
  Icon otherIcon = const Icon(
    Icons.star,
    color: Color.fromARGB(255, 171, 166, 166),
    size: 10.0,
  );

  Widget getstars() {
    for (int i = 0; i < 5; i++) {
      if (i < noOfGoodStars) {
        stars.add(goodIcon);
      } else {
        stars.add(otherIcon);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: stars,
      ),
    );
  }
}
