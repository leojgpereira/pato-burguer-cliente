import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:patoburguer/pato_burguer_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(PatoBurguerApp());
}
