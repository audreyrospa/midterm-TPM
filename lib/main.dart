import 'package:flutter/material.dart';
import 'package:uts/datar_screen.dart';

import 'login_screen.dart';
import 'main_screen.dart';
import 'profile_screen.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MIDTERM TPM',
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/main': (context) => MainScreen(),
        '/profile/detail': (context) => const DetailScreen(),
        '/trapesium' : (context) => const TrapesiumScreen(),
        '/tabung' : (context) => const TabungScreen(),
      },
    );
  }
}


