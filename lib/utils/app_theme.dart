import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const playerPageIconsSize = 27.0;
  static const playerPageHorizontalPadding = 30.0;

  static const pink = Color(0xfff7b4c3);
  static const black = Color(0xff000000);
  static const darkGrey = Color(0xff252526);
  static const onBackground = Color(0xfff0ebef);

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: pink,
      brightness: Brightness.dark,
      onBackground: onBackground,
      primary: pink,
      onPrimary: black,
      background: darkGrey,
    ),
    textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
    scaffoldBackgroundColor: black,
    appBarTheme: const AppBarTheme(
      backgroundColor: black,
      surfaceTintColor: black,
      shadowColor: Colors.transparent,
      scrolledUnderElevation: 0,
    ),
    dividerTheme: const DividerThemeData(
      space: 1,
      thickness: 1,
    ),
  );
}
