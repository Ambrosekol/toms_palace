import 'package:flutter/material.dart';

import '../models/star_review.dart';

Widget welcomeCard(BuildContext context,
    {required int reviewGiven,
    required String imagename,
    required String title,
    required String subcategory,
    required int price}) {
  ReviewStars review = ReviewStars(reviewGiven);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      color: Color(0xFFFFF3E5),
      borderRadius: BorderRadius.circular(10.0),
      shadowColor: Colors.black,
      elevation: 5.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/$imagename',
            width: 100,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              review.getstars(),
              const SizedBox(height: 5.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    subcategory,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Text('#${price.toString()}.00')
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Color(0xFF736557),
              shape: CircleBorder(),
              child: Image.asset(
                'assets/images/basket image.png',
                width: 10,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
