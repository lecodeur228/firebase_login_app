import 'package:flutter/material.dart';

class Constants {
  static Color primaryColor = const Color(0xffF25041);
  static Color containerColor = const Color(0xffFEC56E);
  static Color bgColor = const Color(0xffEDEDF5);

  static double getScreenHeigth(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }
}
