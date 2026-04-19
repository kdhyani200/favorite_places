import 'package:favorite_places/screens/places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

// 1. Shared Seed Color (Sky Blue)
const kSkyBlue = Color.fromARGB(255, 54, 174, 255);

// 2. Light Theme (Sky Blue & White)
final lightColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: kSkyBlue,
  surface: Colors.white,
);

final lightTheme = ThemeData().copyWith(
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: const Color.fromARGB(255, 245, 252, 255), // Very light blue-white
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleLarge: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold, color: Colors.blue[900]),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: kSkyBlue,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
);

// 3. Dark Theme (Sky Blue & Black)
final darkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: kSkyBlue,
  surface: const Color.fromARGB(255, 20, 20, 20), // Deep charcoal/black
);

final darkTheme = ThemeData().copyWith(
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: Colors.black, // True black background
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleLarge: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold, color: kSkyBlue),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 15, 15, 15),
    foregroundColor: kSkyBlue,
    elevation: 0,
  ),
);

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Great Places',
      // Provide both themes here
      theme: lightTheme,
      darkTheme: darkTheme,
      // themeMode: ThemeMode.system, // This is default; follows device settings
      home: const PlacesScreen(),
    );
  }
}