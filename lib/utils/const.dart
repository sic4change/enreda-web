import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  // Name
  static String appName = "e-Learning";

  static Color white = Color(0xffffffff);

  // Material Design Color
  static Color lightPrimary = Color(0xfffcfcff);
  static Color lightAccent = Color(0xFFF18C8E);
  static Color lightBackground = Color(0xfffcfcff);

  static Color grey = Color(0xff707070);
  static Color textPrimary = Color(0xFF486581);
  static Color textDark = Color(0xFF305F72);

  // Salmon
  static Color salmonMain = Color(0xFFF18C8E);
  static Color salmonDark = Color(0xFFBB7F87);
  static Color salmonLight = Color(0xFFF19895);

  // Blue
  static Color blueMain = Color(0xFF579ACA);
  static Color blueDark = Color(0xFF4E92B1);
  static Color blueLight = Color(0xFF5AA6C8);
  static Color blueDarker = Color(0xFF2C5F73);

  // Pink
  static Color lightPink = Color(0xFFFAE4F4);

  // Yellow
  static Color lightYellow = Color(0xFFFFF5E5);

  // Violet
  static Color lightViolet = Color(0xFFFBF5FF);
  static const Color lilac = Color(0xFFA0A5D2);

  // Red
  static Color alertRed = Color(0xFFD32F2F);
  static Color textRed = Color(0xFFFDE934);

  static Color lightGreen = Color(0xFFD6FFED);

  static ThemeData lighTheme(BuildContext context) {
    return ThemeData(
      shadowColor: lightBackground,
      primaryColor: lightPrimary,
      colorScheme: Theme.of(context).colorScheme.copyWith(
        secondary: lightAccent,
      ),
      scaffoldBackgroundColor: lightBackground,
      textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.latoTextTheme(Theme.of(context).textTheme).titleMedium,
        toolbarTextStyle: GoogleFonts.latoTextTheme(Theme.of(context).textTheme).bodyMedium,
        iconTheme: IconThemeData(
          color: lightAccent,
        ),
      ),
    );
  }

  static double headerHeight = 228.5;
  static double mainPadding = 20.0;
}
