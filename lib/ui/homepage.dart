import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
            body: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
