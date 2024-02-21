import 'package:flutter/material.dart';
import 'package:tomoyo/shared/splash.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tomoyo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          background: Color(ColorPalatte.color['base']!),
          primary: Color(ColorPalatte.color['button']!),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Color(ColorPalatte.color['base']!),
      ),
      home: Splash(),
    );
  }
}
