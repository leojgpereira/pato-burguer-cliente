import 'package:flutter/material.dart';
import 'package:patoburguer/screens/Contato.dart';

void main() {
  runApp(PatoBurguerApp());
}

class PatoBurguerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Contato(),
    );
  }
}