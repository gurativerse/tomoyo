import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tomoyo/shared/splash.dart';
import 'theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print(e);
  }
  await dotenv.load(fileName: ".env");
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
