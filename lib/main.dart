import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealsapp/provider/theme_providers.dart';
import 'package:mealsapp/screens/tabs_screen.dart';

final theme = ThemeData(
  useMaterial3: true,

  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: Colors.black87,
  ),

  scaffoldBackgroundColor: const Color(0xFFF6F7FB),

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black87,
    elevation: 0,
  ),

  cardTheme: CardThemeData( // ⭐ fixed
    color: Colors.white,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),

  textTheme: GoogleFonts.latoTextTheme(
    ThemeData.dark().textTheme,
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,

  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.deepPurple,
  ),

  scaffoldBackgroundColor: const Color(0xFF121212),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1E1E1E),
    foregroundColor: Colors.white,
    elevation: 0,
  ),

  cardTheme: CardThemeData(
    color: const Color(0xFF1E1E1E),
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),

  textTheme: GoogleFonts.latoTextTheme(
    ThemeData.dark().textTheme,
  ),
);


void main() {
  runApp(const ProviderScope(
      child: MyApp())
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        themeMode: themeMode,
        theme: theme,        // your light theme
        darkTheme: darkTheme, // your dark theme
        home:TabsScreen()
    );
  }
}
