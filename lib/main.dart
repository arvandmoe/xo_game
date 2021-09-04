import 'package:flutter/material.dart';
import 'package:xo_game/values/colors.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XO Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: MColors.background
      ),
      home: HomeScreen(),
    );
  }
}
