import 'package:flutter/material.dart';
import 'package:toms_palace/global_widgets.dart/elevatedbutton.dart';
import 'package:toms_palace/global_widgets.dart/welcome_card.dart';

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Opacity(
            opacity: 0.7,
            child: Image.asset(
              'assets/images/deliverypack.png',
              width: 300.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'We Offer Top Recipies',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                welcomeCard(context,
                    reviewGiven: 4,
                    imagename: 'Food welcome image.png',
                    title: 'Jollof Rice',
                    subcategory: 'Rice',
                    price: 2000),
                welcomeCard(context,
                    reviewGiven: 4,
                    imagename: 'spag.png',
                    title: 'Spaghetti',
                    subcategory: 'Noodles',
                    price: 2500),
                welcomeCard(context,
                    reviewGiven: 5,
                    imagename: 'fried chicken.png',
                    title: 'Jollof Rice',
                    subcategory: 'Meat',
                    price: 2000),
                welcomeCard(context,
                    reviewGiven: 4,
                    imagename: 'white rice.png',
                    title: 'White Rice',
                    subcategory: 'Rice',
                    price: 1500),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    button(context,
                        callback: () => print('Next page'),
                        text: 'Next',
                        customize: false,
                        bgcolor: null,
                        txtColor: null),
                    button(context,
                        callback: () => print('Next page'),
                        text: 'Next',
                        customize: false,
                        bgcolor: null,
                        txtColor: null),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
