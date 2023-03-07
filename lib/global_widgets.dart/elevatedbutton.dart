import 'package:flutter/material.dart';

Widget button(BuildContext context,
    {required Function() callback,
    required String text,
    required bool customize,
    required Color? bgcolor,
    required Color? txtColor}) {
  return ElevatedButton(
    onPressed: callback,
    style: ButtonStyle(
      backgroundColor: customize
          ? MaterialStateProperty.resolveWith((states) => bgcolor)
          : Theme.of(context).elevatedButtonTheme.style!.backgroundColor,
    ),
    child: Text(
      text,
      style: customize ? TextStyle(color: txtColor) : null,
    ),
  );
}
