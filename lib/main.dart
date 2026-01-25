import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealsapp/screens/categoryScreen.dart';
import 'package:mealsapp/screens/tabs_screen.dart';

final theme = ThemeData(
  useMaterial3: true,

  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.black,
    background: Colors.black,
    surface: Colors.black,
    surfaceContainer: Colors.black,
    primary: Colors.deepPurpleAccent
  ),

  scaffoldBackgroundColor: Colors.black,

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    elevation: 0,
  ),

  textTheme: GoogleFonts.latoTextTheme(
    ThemeData.dark().textTheme,
  ),
);


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        home:TabsScreen()
    );
  }
}
