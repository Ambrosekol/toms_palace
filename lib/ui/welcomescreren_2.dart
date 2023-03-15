import 'package:flutter/material.dart';
import 'package:toms_palace/global_widgets.dart/elevatedbutton.dart';
import 'package:toms_palace/global_widgets.dart/welcome_card.dart';
import 'package:toms_palace/global_widgets.dart/welcome_roadmap.dart';
import 'package:toms_palace/ui/contact_us.dart';
import 'package:toms_palace/ui/signin.dart';

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Opacity(
            opacity: 0.2,
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
              mainAxisAlignment: MainAxisAlignment.start,
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
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'We Deliver Anytime To Your Location',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 50,
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'When you are too lazy too cook, we are just a click away, We got you every time and anytime',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  child: threeRoadMapProcess(context,
                      imageName1: 'letter.png',
                      title1: 'place Order',
                      imageName2: 'location_marker.png',
                      title2: 'Track Order',
                      imageName3: 'happy_people.png',
                      title3: 'Enjoy Treat'),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // button(
                    //   context,
                    //   callback: () => Navigator.pushAndRemoveUntil(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const SignIn(),
                    //       ),
                    //       (route) => false),
                    //   text: 'Skip',
                    //   customize: true,
                    //   bgcolor: Colors.white,
                    //   txtColor: Theme.of(context).primaryColor,
                    // ),
                    button(context,
                        callback: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ),
                            ModalRoute.withName('/')),
                        text: 'Sign in',
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
