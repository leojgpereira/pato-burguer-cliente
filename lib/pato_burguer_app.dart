import 'package:flutter/material.dart';
import 'package:patoburguer/screens/Contato.dart';
import 'package:patoburguer/screens/item_detalhado.dart';
import 'package:patoburguer/screens/tela_cardapio.dart';
import 'package:patoburguer/screens/tela_de_inicio.dart';

class PatoBurguerApp extends StatelessWidget {
  const PatoBurguerApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pato Burguer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFF9B0D),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => telaDeInicio(),
        '/cardapio': (context) => tela_cardapio(),
        '/contato': (context) => Contato(),
        '/item-detalhado': (context) => ItemDetalhado(),
      },
    );
  }
}
