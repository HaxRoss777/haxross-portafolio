import 'package:flutter/material.dart';
import 'package:portafolio_app/constants/colors.dart';
import 'package:portafolio_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hayron Rosales - Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: CustomColor.scaffoldBg,
        appBarTheme: const AppBarTheme(
          backgroundColor: CustomColor.scaffoldBg,
          elevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}