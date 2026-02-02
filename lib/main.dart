import 'package:flutter/material.dart';

var data = "I am writing flutter program";
var myText = Text(
  data,

  style: TextStyle(
    backgroundColor: Colors.green,
    fontSize: 40,
    color: Colors.red,
    fontStyle: FontStyle.italic,
  ),
);

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Hello World");
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: const Text('My First Flutter App')),
//         body: const Center(
//           child: Text('Hello hello 👋', style: TextStyle(fontSize: 26)),
//         ),
//       ),
//     );
//   }}
