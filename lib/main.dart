import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _input = ""; // user input
  String _result = ""; // result display

  void _buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        _input = "";
        _result = "";
      } else if (value == "=") {
        try {
          // simple expression evaluation
          _result = _calculate(_input).toString();
        } catch (e) {
          _result = "Error";
        }
      } else {
        _input += value;
      }
    });
  }

  // Very simple calculation logic
  double _calculate(String input) {
    // Split numbers and operator (assume one operator only)
    if (input.contains('+')) {
      var parts = input.split('+');
      return double.parse(parts[0]) + double.parse(parts[1]);
    } else if (input.contains('-')) {
      var parts = input.split('-');
      return double.parse(parts[0]) - double.parse(parts[1]);
    } else if (input.contains('*')) {
      var parts = input.split('*');
      return double.parse(parts[0]) * double.parse(parts[1]);
    } else if (input.contains('/')) {
      var parts = input.split('/');
      return double.parse(parts[0]) / double.parse(parts[1]);
    } else {
      return double.parse(input);
    }
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(text),
          child: Text(text, style: const TextStyle(fontSize: 24)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ကိန်းဂဏန်း ကိန်းဂဏန်း"), // Calculator in Burmese
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _input,
                  style: const TextStyle(fontSize: 32, color: Colors.black54),
                ),
                const SizedBox(height: 10),
                Text(
                  _result,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    _buildButton("7"),
                    _buildButton("8"),
                    _buildButton("9"),
                    _buildButton("/"),
                  ],
                ),
                Row(
                  children: [
                    _buildButton("4"),
                    _buildButton("5"),
                    _buildButton("6"),
                    _buildButton("*"),
                  ],
                ),
                Row(
                  children: [
                    _buildButton("1"),
                    _buildButton("2"),
                    _buildButton("3"),
                    _buildButton("-"),
                  ],
                ),
                Row(
                  children: [
                    _buildButton("0"),
                    _buildButton("C"),
                    _buildButton("="),
                    _buildButton("+"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
