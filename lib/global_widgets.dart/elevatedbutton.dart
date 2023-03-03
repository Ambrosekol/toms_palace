import 'package:flutter/material.dart';

Widget button(
    {required Function callback,
    required String text,
    required bool customize,
    required Color bgcolor,
    required Color txtColor}) {
  return ElevatedButton(
    onPressed: () => callback,
    style: ButtonStyle(
      backgroundColor: customize
          ? MaterialStateProperty.resolveWith((states) => bgcolor)
          : null,
    ),
    child: Text(
      text,
      style: customize ? TextStyle(color: txtColor) : null,
    ),
  );
}
