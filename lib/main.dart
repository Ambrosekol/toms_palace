import 'package:flutter/material.dart';
import 'package:toms_palace/ui/welcomescreen.dart';
import 'package:toms_palace/util/themedata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appThemeData,
      home: WelcomeScreen(),
    );
  }
}
