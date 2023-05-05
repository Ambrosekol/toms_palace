import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:toms_palace/global_widgets.dart/app_bar.dart';
import 'package:toms_palace/global_widgets.dart/drawer.dart';
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
  List<FoodMenu> foodmenu = [];

  @override
  void initState() {
    userdata = appUser.getuserData();

    //GET MENU ITEMS
    db.collection('Food Menu').get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        Map<String, dynamic> data = value.docs[i].data();
        foodmenu.add(FoodMenu(
            data['name'], data['category'], data['price'], data['image url']));
      }
    });
    // foodMenuGetter.forEach((element) {element.docs});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: userdata,
      builder: (context, snapshot) {
        if (snapshot.hasData && foodmenu.isNotEmpty) {
          // print(foodmenu[2].name);
          return Scaffold(
            appBar: CustomizedAppBar(centerTitle: true),
            drawer: const CustomizedDrawer(),
          );
        } else {
          Timer(const Duration(seconds: 10), () => setState(() {}));
          return Scaffold(
            body: Center(
              child: SizedBox(
                height: 200,
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
