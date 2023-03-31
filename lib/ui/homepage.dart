import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:toms_palace/models/menu.dart';
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
  late Stream<QuerySnapshot<Map<String, dynamic>>> foodMenuGetter;
  late List<FoodMenu> foodmenu;

  @override
  void initState() {
    userdata = appUser.getuserData();
    //GET MENU ITEMS
    // foodMenuGetter = db.collection('Food Menu').snapshots();
    // foodMenuGetter.forEach((element) {element.docs});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: userdata,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold();
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
