
import 'package:assignment_2/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
         darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            elevation: 0.0

        ),
      ),
      themeMode: ThemeMode.dark,
      routes: {
        "/":(context) => const HomePage()
      },
    );
  }
}

