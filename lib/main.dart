import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _num1 = "";
  String _num2 = "";
  String _operation = "";
  String _result = "";

  void _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _num1 = "";
      _num2 = "";
      _operation = "";
      _result = "";
    } else if (buttonText == "+" || buttonText == "-") {
      _num1 = _result;
      _operation = buttonText;
      _result = "";
    } else if (buttonText == "=") {
      _num2 = _result;
      if (_operation == "+") {
        _result = (double.parse(_num1) + double.parse(_num2)).toString();
      } else if (_operation == "-") {
        _result = (double.parse(_num1) - double.parse(_num2)).toString();
      }
      _num1 = "";
      _num2 = "";
      _operation = "";
    } else {
      _result += buttonText;
    }

    setState(() {});
  }

  Widget _buildButton(String buttonText, Color buttonColor) {
    return Expanded(
      child: MaterialButton(
        padding: EdgeInsets.all(24.0),
        child: Text(buttonText, style: TextStyle(fontSize: 24.0)),
        color: buttonColor,
        onPressed: () => _buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    _result,
                    style: TextStyle(fontSize: 64.0),
                  ),
                ),
              ),
              Row(
                children: [
                  _buildButton("7", Colors.grey),
                  _buildButton("8", Colors.grey),
                  _buildButton("9", Colors.grey),
                  _buildButton("-", Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton("4", Colors.grey),
                  _buildButton("5", Colors.grey),
                  _buildButton("6", Colors.grey),
                  _buildButton("+", Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton("1", Colors.grey),
                  _buildButton("2", Colors.grey),
                  _buildButton("3", Colors.grey),
                  _buildButton("C", Colors.red),
                ],
              ),
              Row(
                children: [
                  _buildButton("0", Colors.grey),
                  _buildButton(".", Colors.grey),
                  _buildButton("=", Colors.orange),
                  _buildButton("", Colors.white),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
