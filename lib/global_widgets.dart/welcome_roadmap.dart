import 'package:flutter/material.dart';

Widget threeRoadMapProcess(BuildContext context,
    {required String imageName1,
    required String title1,
    required String imageName2,
    required String title2,
    required String imageName3,
    required String title3}) {
  return Container(
    height: 80,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title1,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 5.0),
            Material(
                // borderRadius: BorderRadius.circular(20.0),
                elevation: 4.0,
                color: Theme.of(context).primaryColor,
                shape: CircleBorder(),
                child: Center(
                  child: Image.asset(
                    'assets/images/$imageName1',
                    width: 30.0,
                  ),
                ))
          ],
        ),
        Text(
          '______',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        // Column(
        //   children: [],
        // ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title2,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 5.0),
            Material(
                // borderRadius: BorderRadius.circular(20.0),
                elevation: 4.0,
                color: Theme.of(context).primaryColor,
                shape: CircleBorder(),
                child: Center(
                  child: Image.asset(
                    'assets/images/$imageName2',
                    width: 30.0,
                  ),
                ))
          ],
        ),
        /////
        ///
        ///
        ///
        Text(
          '______',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title3,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 5.0),
            Material(
                // borderRadius: BorderRadius.circular(20.0),
                elevation: 4.0,
                color: Theme.of(context).primaryColor,
                shape: CircleBorder(),
                child: Center(
                  child: Image.asset(
                    'assets/images/$imageName3',
                    width: 30.0,
                  ),
                ))
          ],
        ),
      ],
    ),
  );
}
