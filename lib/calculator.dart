import 'package:flutter/material.dart';
import './calculatorbutton.dart';
import './utils.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MyCalculatorState();
  }
}

class _MyCalculatorState extends State<MyCalculator> {
  double _output = 0.0;
  String _input = "0";
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operand = "";

  void btnOperandPressed(String clickedBtnText) {
    if (clickedBtnText == Operand.clear.name) {
      _operand = "";
      _num1 = 0.0;
      _num2 = 0.0;
      _output = 0.0;
      _input = "0";
    } else if (clickedBtnText == Operand.plus.name ||
        clickedBtnText == Operand.minus.name ||
        clickedBtnText == Operand.multiply.name ||
        clickedBtnText == Operand.divide.name) {
      _num1 = double.parse(_input);
      _operand = clickedBtnText;
      _output = 0.0;
      _input = "0";
    } else if (clickedBtnText == Operand.dot.name) {
      if (_input.contains(".")) {
        print("Already contains a decimals");
        return;
      } else {
        _input = _input + ".";
      }
    } else if (clickedBtnText == Operand.equal.name) {
      _num2 = double.parse(_input);
      if (_operand == Operand.plus.name)
        _input = (_num1 + _num2).toStringAsFixed(2);
      if (_operand == Operand.minus.name)
        _input = (_num1 - _num2).toStringAsFixed(2);
      if (_operand == Operand.multiply.name)
        _input = (_num1 * _num2).toStringAsFixed(2);
      if (_operand == Operand.divide.name)
        _input = (_num1 / _num2).toStringAsFixed(2);

      _operand = "";
      _num1 = 0.0;
      _num2 = 0.0;
      // _input= 0.0;
    } else if (clickedBtnText == Operand.backspace.name) {
      if (_input.length == 1)
        _input = "0";
      else {
        _input = _input.substring(0, _input.length - 1);
      }
    } else {
      _input = _input + clickedBtnText;
    }

    setState(() {
      _output = double.parse(_input);
      // if (clickedBtnText == Operand.equal.name) _input = "0";
    });
    print("*******************************************");
    print("Output: " + _output.toString());
    print("Input: " + _input.toString());
    print("Operand: " + _operand.toString());
    print("Number 1: " + _num1.toString());
    print("Number 2: " + _num2.toString());
    print("*******************************************");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 12.0),
                child: Text(
                  _output.toString(),
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: const <Widget>[
              Expanded(
                child: Divider(),
              )
            ],
          ),
          Row(
            children: <Widget>[
              CalculatorButton(() => btnOperandPressed("7"), "7"),
              CalculatorButton(() => btnOperandPressed("8"), "8"),
              CalculatorButton(() => btnOperandPressed("9"), "9"),
              CalculatorButton(
                  () => btnOperandPressed(Operand.multiply.name), "*")
            ],
          ),
          Row(
            children: <Widget>[
              CalculatorButton(() => btnOperandPressed("4"), "4"),
              CalculatorButton(() => btnOperandPressed("5"), "5"),
              CalculatorButton(() => btnOperandPressed("6"), "6"),
              CalculatorButton(
                  () => btnOperandPressed(Operand.divide.name), "/")
            ],
          ),
          Row(
            children: <Widget>[
              CalculatorButton(() => btnOperandPressed("1"), "1"),
              CalculatorButton(() => btnOperandPressed("2"), "2"),
              CalculatorButton(() => btnOperandPressed("3"), "3"),
              CalculatorButton(() => btnOperandPressed(Operand.minus.name), "-")
            ],
          ),
          Row(
            children: <Widget>[
              CalculatorButton(() => btnOperandPressed(Operand.dot.name), "."),
              CalculatorButton(() => btnOperandPressed("0"), "0"),
              CalculatorButton(() => btnOperandPressed("00"), "00"),
              CalculatorButton(() => btnOperandPressed(Operand.plus.name), "+")
            ],
          ),
          Row(
            children: <Widget>[
              CalculatorButton(
                  () => btnOperandPressed(Operand.clear.name), "CLEAR"),
              CalculatorButton(
                  () => btnOperandPressed(Operand.equal.name), "="),
              CalculatorButton(
                  () => btnOperandPressed(Operand.backspace.name), "<-"),
            ],
          )
        ],
      ),
    );
  }
}
