import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final VoidCallback selectHandler;
  String btnTitle;

  CalculatorButton(this.selectHandler, this.btnTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: selectHandler,
          child: Text(btnTitle),
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.blue),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
        ));
  }
}
