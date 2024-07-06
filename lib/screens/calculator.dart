import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0'; // Holds the display value
  String _operator = ''; // Current operator (+, -, *, /)
  double _firstOperand = 0; // First operand
  double _secondOperand = 0; // Second operand
  bool _isNewEntry = true; // Tracks if a new entry is started

  // Handles number button presses
  void _onNumberPressed(String number) {
    setState(() {
      if (_isNewEntry) {
        _display = number;
        _isNewEntry = false;
      } else {
        _display = _display == '0' ? number : _display + number;
      }
    });
  }

  // Handles operator button presses
  void _onOperatorPressed(String operator) {
    setState(() {
      _firstOperand = double.tryParse(_display) ?? 0;
      _operator = operator;
      _isNewEntry = true;
    });
  }

  // Handles equals button press
  void _onEqualsPressed() {
    setState(() {
      _secondOperand = double.tryParse(_display) ?? 0;
      double result = 0;

      switch (_operator) {
        case '+':
          result = _firstOperand + _secondOperand;
          break;
        case '-':
          result = _firstOperand - _secondOperand;
          break;
        case '*':
          result = _firstOperand * _secondOperand;
          break;
        case '/':
          if (_secondOperand != 0) {
            result = _firstOperand / _secondOperand;
          } else {
            result = 0;
            _display = "Error";
          }
          break;
      }

      _display = result.toString();
      _isNewEntry = true; // Reset for new input
      _operator = ''; // Clear the operator
    });
  }

  // Handles clear button press
  void _onClearPressed() {
    setState(() {
      _display = '0';
      _firstOperand = 0;
      _secondOperand = 0;
      _operator = '';
      _isNewEntry = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  _display,
                  style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildButton('7', _onNumberPressed),
                _buildButton('8', _onNumberPressed),
                _buildButton('9', _onNumberPressed),
                _buildButton('/', _onOperatorPressed),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildButton('4', _onNumberPressed),
                _buildButton('5', _onNumberPressed),
                _buildButton('6', _onNumberPressed),
                _buildButton('*', _onOperatorPressed),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildButton('1', _onNumberPressed),
                _buildButton('2', _onNumberPressed),
                _buildButton('3', _onNumberPressed),
                _buildButton('-', _onOperatorPressed),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildButton('0', _onNumberPressed),
                _buildButton('C', (val) => _onClearPressed()),
                _buildButton('=', (val) => _onEqualsPressed()),
                _buildButton('+', _onOperatorPressed),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build calculator buttons
  Widget _buildButton(String label, Function(String) onTap) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => onTap(label),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20.0),
            textStyle: TextStyle(fontSize: 24),
          ),
          child: Text(label),
        ),
      ),
    );
  }
}
