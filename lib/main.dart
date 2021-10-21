import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:patoburguer/screens/tela_de_inicio.dart';
String _title = "Pato Burguer";

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PatoBurguerApp());
}

class PatoBurguerApp extends StatelessWidget {
  const PatoBurguerApp({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: _title,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: telaDeInicio()
      );
  }
}



