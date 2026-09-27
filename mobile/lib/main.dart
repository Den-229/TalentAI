import 'package:flutter/material.dart';
import 'src/screens/talent_portal_screen.dart';

void main() {
  runApp(const TalentAIApp());
}

class TalentAIApp extends StatelessWidget {
  const TalentAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TalentAI Recruitment Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D0E15),
        cardColor: const Color(0xFF161824),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF8B5CF6),
          secondary: Color(0xFFEC4899),
          surface: Color(0xFF161824),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0D0E15),
          elevation: 0,
        ),
      ),
      home: const TalentPortalScreen(),
    );
  }
}
