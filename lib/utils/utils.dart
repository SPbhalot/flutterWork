import 'package:flutter/material.dart';

double vw(double p, BuildContext context) {
  return p / 100 * MediaQuery.of(context).size.width;
}

double vh(double p, BuildContext context) {
  return p / 100 * MediaQuery.of(context).size.height;
}

String formatTime(int seconds) {
  //return '';
  return "${(seconds ~/ 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, "0")}";
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
