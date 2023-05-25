
import 'package:flutter/material.dart';
import 'package:flutter_fight_club/pages/main_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme:
            GoogleFonts.pressStart2pTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
