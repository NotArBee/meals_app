import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/tabs_screen.dart';

final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromARGB(255, 229, 89, 0),
      brightness: Brightness.dark,
    ),
    textTheme: GoogleFonts.latoTextTheme());

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((fn) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
