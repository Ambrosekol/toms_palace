import 'package:flutter/material.dart';
import 'package:toms_palace/ui/contact_us.dart';
import 'package:toms_palace/ui/welcomescreen.dart';
import 'package:toms_palace/util/firebaseinstance.dart';
import 'package:toms_palace/util/themedata.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const AuthConfirm(),
      },
      title: 'Flutter Demo',
      theme: appThemeData,
      // home: AuthConfirm(),
    );
  }
}

class AuthConfirm extends StatefulWidget {
  const AuthConfirm({super.key});

  @override
  State<AuthConfirm> createState() => _AuthConfirmState();
}

class _AuthConfirmState extends State<AuthConfirm> {
  // late bool loggedIn;

  // ///
  // @override
  // void initState() {
  //   super.initState();
  //   authInstance.authStateChanges().listen((user) {
  //     if (user == null) {
  //       loggedIn = false;
  //     } else {
  //       loggedIn = true;
  //     }
  //   });
  // }

/////
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: authInstance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const WelcomeScreen();
          } else {
            return const ContactUsPage();
          }
        });
  }
}
