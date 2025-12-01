import 'dart:ui';

abstract class AppColors {
  static const Color primary = Color(0xff722E85);
  static const Color primaryColorLight = Color(0xff32B0E5);
  static const Color secondary = Color(0xffFF9C65);
  static const Color white = Color(0xffFFFFFF);
  static const Color lightGrey = Color(0xffDFDFE0);
  static const Color black = Color(0xff000000);
  static const Color greyColor = Color(0xff3B3B3B);
  static const Color redColor = Color(0xffFF4B4B);
  //* light theme colors
  static const Color mainLight = Color(0xff09051C); // primary
  static const Color lightBackground = Color(0xffFFFFFF); // background
  static const Color secondryLight = Color(0xffFEF6ED); // secondary
  static const Color onSecondaryLight = Color(0xffF0BB97); // on secondary
  static const Color primaryLight = Color(0xffEAFAF2); // on primary
  static const Color onSurfaceLight = Color.fromARGB(255, 214, 210, 210);
  //* dark theme colors
  static const Color mainDark = Color(0xffFFFFFF); // primary
  static const Color darkBackground = Color(0xff000000); // background
  static const Color secondryDark = Color(0xff252525); // secondary
  static const Color onSecondaryDark = Color(0xff777777); // on secondary
  static const Color primaryDark = Color(0xff25362E); // on primary
  static const Color onSurfaceDark = Color(0xff252525);
}
