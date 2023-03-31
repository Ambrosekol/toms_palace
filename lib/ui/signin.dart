import 'package:flutter/material.dart';
import 'package:toms_palace/global_widgets.dart/erroralert.dart';
import 'package:toms_palace/ui/contact_us.dart';
import 'package:toms_palace/ui/homepage.dart';
import 'package:toms_palace/ui/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../util/firebaseinstance.dart';
import '../util/imagedirectory.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController emailController;
  late TextEditingController resetemailController;
  late TextEditingController passwordController;

  //
  bool obscurePwd = true;

  //
  void viewPassword() {
    if (obscurePwd) {
      setState(() {
        obscurePwd = false;
      });
    } else {
      setState(() {
        obscurePwd = true;
      });
    }
  }

  pushpage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Homescreen()),
    );
  }

  confirmreset() {
    globalAlertDialog(context, true,
        alertIcon: Icons.check,
        alertMessage: 'Confirmation Email sent, check your Email');
  }

  submitData() async {
    try {
      await authInstance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      pushpage();
    } on FirebaseAuthException catch (e) {
      // print(e.toString());
      globalAlertDialog(context, false, firebaseErrorCode: e.code);
    }
  } //submit userInfo

  resetpassword() async {
    try {
      await authInstance.sendPasswordResetEmail(
          email: resetemailController.text.trim());
      Navigator.pop;
      confirmreset();
    } on FirebaseAuthException catch (e) {
      // print(e.toString());
      globalAlertDialog(context, false, firebaseErrorCode: e.code);
    }
  }

  //
  @override
  void initState() {
    emailController = TextEditingController();
    resetemailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

//
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    resetemailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: 0.1,
                child: Image.asset(
                  imageLocation(imageName: 'Food welcome image.png'),
                  width: 300.0,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: size.height / 1.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Sign In',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 25.0),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          width: size.width,
                          height: size.height / 5,
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextField(
                                controller: emailController,
                                decoration:
                                    const InputDecoration(labelText: 'Email'),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextField(
                                keyboardType: TextInputType.emailAddress,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                    onPressed: () => viewPassword(),
                                    icon: const Icon(Icons.remove_red_eye),
                                  ),
                                ),
                                obscureText: obscurePwd,
                                obscuringCharacter: 'Θ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: submitData,
                          icon: const Icon(Icons.food_bank),
                          label: Text(
                            'Sign In',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        InkWell(
                          onTap: () =>
                              forgotPassword(), //Forgot Password Function
                          child: Text(
                            'Forgot Password?',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(width: 8.0),
                            InkWell(
                              onTap: () => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUp(),
                                  ),
                                  (route) => false),
                              child: Text(
                                'Sign Up',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Divider(
                          thickness: 5.0,
                        ),
                        Text('2023 Tom\'s Place All Rights Reserved')
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  forgotPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Reset Your Password',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  // SizedBox()
                  TextField(
                    controller: resetemailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.resolveWith(
                            (states) => Size(
                                MediaQuery.of(context).size.width - 10, 30))),
                    onPressed: resetpassword,
                    icon: const Icon(Icons.email),
                    label: Text(
                      'Reset Password',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
