import 'package:flutter/material.dart';
import 'package:patoburguer/screens/tela_cardapio.dart';

void main() {
  runApp(PatoBurguerApp());
}

class PatoBurguerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:tela_cardapio());
  }
}