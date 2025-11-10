import 'package:eventory/screens/home/home.dart';
import 'package:eventory/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(theme: primaryTheme, home: Home()));
}

//this sandbox widget is used to test ideas without affecting the main code
class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Eventory'),
        backgroundColor: Colors.grey,
      ),
      body: const Text('sandbox'),
    );
  }
}
