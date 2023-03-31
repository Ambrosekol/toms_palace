import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:toms_palace/models/user.dart';
import 'package:toms_palace/util/firebaseinstance.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  AppUser appUser = AppUser();
  late Stream<DocumentSnapshot<Map<String, dynamic>>> userdata;

  @override
  void initState() {
    userdata = appUser.getuserData();
    // foodMenu = db.collection('Food Menu').snapshots().
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: userdata,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: LoadingIndicator(
                  strokeWidth: 10,
                  // pathBackgroundColor: Colors.red,
                  colors: [
                    Colors.teal,
                    Colors.tealAccent,
                    Theme.of(context).primaryColor,
                    Theme.of(context).secondaryHeaderColor,
                  ],
                  indicatorType: Indicator.ballSpinFadeLoader,
                  // backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: LoadingIndicator(
                  strokeWidth: 1.0,
                  // pathBackgroundColor: Colors.red,
                  colors: [
                    Colors.teal,
                    Colors.tealAccent,
                    Theme.of(context).primaryColor,
                    Theme.of(context).secondaryHeaderColor,
                  ],
                  indicatorType: Indicator.ballGridPulse,
                  // backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
