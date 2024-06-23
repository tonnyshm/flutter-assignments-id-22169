import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          // Display area
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(20),
              child: Text(
                '0', // Placeholder for the display
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Buttons grid
          Expanded(
            flex: 8,
            child: Container(
              color: Colors.grey[200],
              child: GridView.builder(
                itemCount: 16, // Number of buttons
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4 buttons per row
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final label = _getButtonLabel(index); // Get button label
                  return GridTile(
                    child: TextButton(
                      onPressed: () {}, // No functionality
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        label,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getButtonLabel(int index) {
    // Define the labels for the calculator buttons
    const buttons = [
      '7', '8', '9', '/',
      '4', '5', '6', '*',
      '1', '2', '3', '-',
      'C', '0', '=', '+',
    ];
    return buttons[index];
  }
}
