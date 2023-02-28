import 'package:flutter/material.dart';
import './calculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Calculator - Mandeep Singh"),
          ),
          body: MyCalculator()),
    );
  }
}
