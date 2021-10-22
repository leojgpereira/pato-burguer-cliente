import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:patoburguer/screens/item_detalhado.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(PatoBurguerApp());
}

class PatoBurguerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFFF9B0D),
      ),
      home: ItemDetalhado('BzYRcK2dl5DidzkVZEpD'),
    );
  }
}
