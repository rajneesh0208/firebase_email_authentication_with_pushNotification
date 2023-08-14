import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

displayToast(
    String message,
    ) {
  Fluttertoast.showToast(
      msg: message,
      textColor: Colors.white,
      fontSize: 14,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.white,
      timeInSecForIosWeb: 1);
}
