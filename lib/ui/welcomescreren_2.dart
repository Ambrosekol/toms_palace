import 'package:flutter/material.dart';
import 'package:toms_palace/global_widgets.dart/welcome_card.dart';

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            welcomeCard(),
            welcomeCard(),
          ],
        ),
      ),
    );
  }
}
