import 'package:flutter/material.dart';
import 'views/home_page.dart';

void main() {
  runApp(const KuisPintarApp());
}

class KuisPintarApp extends StatelessWidget {
  const KuisPintarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis Pintar',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.blue,

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF356AE6),
        ),

        scaffoldBackgroundColor:
            const Color(0xFFF5F7FC),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF5F7FC),
          foregroundColor: Color(0xFF17233D),
          elevation: 0,
        ),
      ),

      home: const HomePage(),
    );
  }
}