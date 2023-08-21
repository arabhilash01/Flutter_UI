import 'package:flutter/material.dart';
import 'package:flutter_ui/screens/rhythm.dart';
// import 'package:flutter_ui/screens/rhythm.dart';
// import 'package:flutter_ui/screens/design_palette.dart';
// import 'package:flutter_ui/screens/wanderer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Rhythm(),
    );
  }
}
