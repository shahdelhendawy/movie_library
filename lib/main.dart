import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF00AEEF);
    const darkBlue = Color(0xFF24324B);
    const pink = Color(0xFFEF6B9A);
    const background = Color(0xFFF2F5FB);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cartoon Network',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryBlue,
          brightness: Brightness.light,
          primary: primaryBlue,
          secondary: pink,
          surface: Colors.white,
          onSurface: darkBlue,
        ),
        scaffoldBackgroundColor: background,
        fontFamily: 'Arial',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF24324B),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.3,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 3,
          shadowColor: const Color(0xFF24324B).withValues(alpha: 0.12),
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
            side: const BorderSide(color: Color(0xFFE0E7F1)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          hintStyle: const TextStyle(color: Color(0xFF8293A7), fontSize: 14),
          prefixIconColor: primaryBlue,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFFD8E3F0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: primaryBlue, width: 2),
          ),
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: darkBlue,
            fontWeight: FontWeight.w900,
          ),
          titleMedium: TextStyle(color: darkBlue, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(color: Color(0xFF334155)),
          bodySmall: TextStyle(color: Color(0xFF64748B)),
        ),
      ),
      home: const HomePage(),
    );
  }
}
