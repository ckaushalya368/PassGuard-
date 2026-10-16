import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const PassGuardApp());
}

class PassGuardApp extends StatelessWidget {
  const PassGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PassGuard',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF101827),
      ),
      home: const HomeScreen(),
    );
  }
}
