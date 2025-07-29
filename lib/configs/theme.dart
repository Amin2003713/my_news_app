import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  // brightness: Brightness.dark,
  colorSchemeSeed: const Color.fromARGB(255, 63, 151, 201),
  textTheme: GoogleFonts.mulishTextTheme(TextTheme()),
  appBarTheme: AppBarTheme(centerTitle: true, elevation: 0),
);
