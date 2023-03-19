import 'package:flutter/material.dart';

Future globalAlertDialog(BuildContext context, bool otherAlert,
    {String? alertMessage, IconData? alertIcon, String? firebaseErrorCode}) {
  Size size = MediaQuery.of(context).size;
  String? errMessage() {
    switch (firebaseErrorCode) {
      case 'unknown':
        return 'Error! check your input';

      // case 'auth/invalid-password':
      // return 'Increase password length';
    }
    return firebaseErrorCode;
  }

  String checknull(String? message) {
    if (message != null) {
      return message;
    } else {
      return 'No Frontend Message';
    }
  }

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
                otherAlert ? checknull(alertMessage) : checknull(errMessage()),
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              otherAlert
                  ? Icon(
                      alertIcon,
                      size: 100.0,
                      color: Colors.green,
                    )
                  : const Icon(Icons.error_outline,
                      size: 100.0, color: Colors.red),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Close',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      width: 2.0,
                    ),
                    const Icon(Icons.close, size: 20.0),
                  ],
                ),
              ),
            ],
          ),
        ));
      });
}
