import 'package:flutter/material.dart';

// colors

const white1 = Color(0xfffbfcfa);
const white2 = Color(0xfff6f6f7);
const dark = Color(0xff040405);
const orange = Color(0xffff7c17);
const blue = Color(0xff4a86f7);
const blue1 = Color(0xff0953ff);

const purple = Color(0xff7371ff);
const darkBlue = Color(0xff1c233c);
const dark2 = Color(0xff21262d);
const dark3 = Color(0xff3a3b41);
const dark4 = Color(0xff08080a);

// theme
theme(context) {
  return ThemeData(
    scaffoldBackgroundColor: white2,
    primaryColor: blue,
    canvasColor: blue,
    shadowColor: blue,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: blue),
  );
}

// text style
TextStyle style(BuildContext context) {
  return TextStyle(
      fontFamily: 'Poppins', fontSize: kPad(context) * 0.035, color: dark);
}

// padding
double kPad(context) {
  return MediaQuery.of(context).size.width;
}
