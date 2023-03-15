import 'package:flutter/material.dart';

Future alertdialog_forAuth(String errorcode, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  String refMessage() {
    switch (errorcode) {
      case 'unknown':
        return 'Error! check your input';

      // case 'auth/invalid-password':
      // return 'Increase password length';
    }
    return errorcode;
  }

  String refinedMessage = refMessage();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          width: size.width / 2,
          height: size.height / 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                refinedMessage,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const Icon(
                Icons.error_outline,
                size: 100.0,
                color: Colors.red,
              )
            ],
          ),
        ));
      });
}
