import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monkey_code/CodeHandeler.dart';
import 'Constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = code[Random().nextInt(code.length)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: longestLine(text) * 13 + 50,
              child: CodeHandeler(
                text: text,
                numLines: text.split('\n').length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
