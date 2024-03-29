import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toms_palace/global_widgets.dart/erroralert.dart';
import 'package:toms_palace/models/user.dart';
import 'package:toms_palace/ui/contact_us.dart';
import 'package:toms_palace/ui/homepage.dart';
import 'package:toms_palace/ui/signin.dart';
import 'package:toms_palace/util/firebaseinstance.dart';
import 'package:toms_palace/util/imagedirectory.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmation;
  late TextEditingController addressController;
  late TextEditingController cityController;
  late TextEditingController phoneController;

  String gender = 'Gender';
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

  submitData() async {
    if (passwordController.text == passwordConfirmation.text) {
      try {
        await authInstance
            .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        )
            .then((value) {
          AppUser appUser = AppUser.inituser(
            nameController.text,
            emailController.text,
            gender,
            addressController.text,
            phoneController.text,
            passwordController.text,
            value.user!.uid,
            <CartItems>[],
            cityController.text,
          );
          db.collection('Users').doc(value.user!.uid).set(appUser.tojson());
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Homescreen(),
            ),
          );
        });

        /* 
      HERE IS THE PLACE TO INITIALIZE FIREBASE STORAGE
      TO STORE USER INFO
     */

      } on FirebaseAuthException catch (e) {
        globalAlertDialog(context, false, firebaseErrorCode: e.code);
      }
    } else {
      globalAlertDialog(context, true,
          alertMessage: "Password dont match", alertIcon: Icons.error);
    }
  } //submit userInfo

  //
  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmation = TextEditingController();
    addressController = TextEditingController();
    cityController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

//
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmation.dispose();
    addressController.dispose();
    cityController.dispose();
    phoneController.dispose();
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
                  Text(
                    'Sign Up',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 25.0),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    width: size.width,
                    height: size.height / 1.5,
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextField(
                          keyboardType: TextInputType.name,
                          controller: nameController,
                          decoration:
                              const InputDecoration(labelText: 'Full name'),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: const InputDecoration(labelText: 'Email'),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextField(
                          keyboardType: TextInputType.streetAddress,
                          controller: addressController,
                          decoration:
                              const InputDecoration(labelText: 'Address'),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextField(
                          keyboardType: TextInputType.streetAddress,
                          controller: cityController,
                          decoration: const InputDecoration(labelText: 'City'),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextField(
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          decoration:
                              const InputDecoration(labelText: 'Phone Number'),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        // TextField(
                        //   controller: genderController,
                        //   decoration:
                        //       const InputDecoration(labelText: 'Gender'),
                        //   style: Theme.of(context).textTheme.bodySmall,
                        // ),
                        InkWell(
                          onTap: () => genderSelector(),
                          child: Container(
                            height: 50.0,
                            width: size.width,
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.4),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  gender,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),

                        TextField(
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
                        TextField(
                          controller: passwordConfirmation,
                          decoration: const InputDecoration(
                              labelText: 'Confirm Password'),
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
                      'Sign Up',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 8.0),
                      InkWell(
                        onTap: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ),
                            (route) => false),
                        child: Text(
                          'Sign in',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
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

  Future genderSelector() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (() {
                      setState(() {
                        gender = 'Male';
                      });
                      Navigator.pop(context);
                    }),
                    child: Container(
                      alignment: Alignment.center,
                      color: Theme.of(context).colorScheme.surface,
                      height: 50.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      padding: const EdgeInsets.all(8.0),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Male',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 15.0),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (() {
                      setState(() {
                        gender = 'Female';
                      });
                      Navigator.pop(context);
                    }),
                    child: Container(
                      alignment: Alignment.center,
                      color: Theme.of(context).colorScheme.surface,
                      height: 50.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      padding: const EdgeInsets.all(8.0),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Female',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 15.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
