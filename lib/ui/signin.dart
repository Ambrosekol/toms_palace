import 'package:flutter/material.dart';
import 'package:toms_palace/ui/signup.dart';

import '../util/imagedirectory.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController emailController;
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

  submitData() {} //submit userInfo

  //
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

//
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

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
                          onTap: () => null, //Forgot Password Function
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
}
