import 'package:flutter/material.dart';
import 'package:toms_palace/util/imagedirectory.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String gender = 'Gender';
  //
  bool obscurePwd = false;

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

  //
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.2,
              child: Image.asset(
                imageLocation(imageName: 'Food welcome image.png'),
                width: 300.0,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Sign Up',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 25.0),
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: 70.0),
                    width: size.width,
                    height: size.height / 2,
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextField(
                          controller: nameController,
                          decoration:
                              const InputDecoration(labelText: 'Full name'),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(labelText: 'Email'),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextField(
                          controller: addressController,
                          decoration:
                              const InputDecoration(labelText: 'Address'),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextField(
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
                              border: Border.all(width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  gender,
                                  style: Theme.of(context).textTheme.bodyMedium,
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
                              icon: const Icon(Icons.password),
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
                ),
              ],
            ),
          ],
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
                  GestureDetector(
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
                  GestureDetector(
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
