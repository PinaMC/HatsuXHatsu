import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme_killua.dart';

ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: MaterialTheme.lightScheme(),
    textTheme: GoogleFonts.latoTextTheme(),
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: MaterialTheme.darkScheme(),
    textTheme: GoogleFonts.latoTextTheme(),
  );
}