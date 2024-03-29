import 'package:flutter/material.dart';
import 'package:toms_palace/global_widgets.dart/elevatedbutton.dart';
import 'package:toms_palace/ui/signin.dart';
import 'package:toms_palace/ui/welcomescreren_2.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'The Best Resturant in your Home',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 10.0),
                  Text('Delicious recipes made using high-quality ingredients',
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/Food welcome image.png',
                      width: 160,
                    )
                  ],
                ),
                SizedBox(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      welcomeTags(
                          'Menus featuring Proteins, carbohydrates, vitamins and all the classes of food.',
                          'assets/images/backet_icon.png',
                          context),
                      welcomeTags(
                          'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis',
                          'assets/images/delicious_icon.png',
                          context),
                      welcomeTags(
                          'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis ',
                          'assets/images/backet_icon.png',
                          context)
                    ],
                  ),
                ),
              ],
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 15.0),
            //       child: Text(
            //         'Category',
            //         style: Theme.of(context)
            //             .textTheme
            //             .bodyLarge!
            //             .apply(color: Colors.black),
            //         textAlign: TextAlign.left,
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.all(15.0),
            //       child: Text(
            //         'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium At vero eos et',
            //         style: Theme.of(context)
            //             .textTheme
            //             .bodyLarge!
            //             .copyWith(fontSize: 14),
            //         textAlign: TextAlign.left,
            //       ),
            //     ),
            //   ],
            // ),
            Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 150,
                    width: 150.0,
                    decoration: BoxDecoration(
                        color: const Color(0xFFC3A995),
                        borderRadius: BorderRadius.circular(13.15)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: const EdgeInsets.only(top: 15.0),
                          child: foodDisplay(250.7, 154.57,
                              'assets/images/displayImage1.png', 'Jollof Rice'),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          foodDisplay(150.7, 150.7,
                              'assets/images/displayImage2.png', 'Egusi Soup'),
                          const SizedBox(
                            height: 10.0,
                          ),
                          foodDisplay(150.7, 150.7,
                              'assets/images/displayImage3.png', 'Okro Soup')
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                button(
                  context,
                  callback: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignIn(),
                    ),
                  ),
                  text: 'Skip',
                  customize: true,
                  bgcolor: const Color.fromARGB(255, 255, 255, 255),
                  txtColor: const Color(0xFF736557),
                ),
                button(
                  context,
                  callback: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeScreen2())),
                  text: 'Next',
                  customize: false,
                  bgcolor: const Color.fromARGB(255, 255, 255, 255),
                  txtColor: const Color(0xFF736557),
                ),
              ],
            ),

            // foodDisplay(281.7, 174.57, 'assets/images/displayImage1.png',
            //     'Jollof Rice'),
          ],
        ),
      ),
    );
  }

  Widget foodDisplay(double height, double width, String bg, String text) {
    return Container(
        // color: Colors.black,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                bg,
              ),
            )),
        height: height,
        width: width,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Material(
            borderRadius: BorderRadius.circular(5),
            child: Text(text),
          ),
        ));
  }

  Widget welcomeTags(String text, String imageIconPath, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0),
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Colors.white, Colors.white]),
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: const [
          BoxShadow(
              color: Colors.transparent,
              blurStyle: BlurStyle.outer,
              blurRadius: 2.0),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(imageIconPath, height: 25.0),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 12.0, fontFamily: 'Ubuntu', color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
