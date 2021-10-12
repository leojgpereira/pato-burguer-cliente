import 'package:flutter/material.dart';
import 'package:patoburguer/models/contato_info.dart';

class Contato extends StatelessWidget {
  final ContatoInfo item;

  Contato(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contato',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Color(0xFFFFFFFF),
            fontSize: 24.0,
          ),
        ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, color: Color(0xFFFFFFFF),),
            onPressed: () {
            },
          ),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 44.0,
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.only(top: 15.0, bottom: 106.0),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.0),
                topLeft: Radius.circular(15.0),
              ),
            ),
            child: ContatoDetalhes(item),
          ),
        ),
      ),
    );
  }
}

class ContatoDetalhes extends StatelessWidget {
  final ContatoInfo item;

  ContatoDetalhes(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 32, right: 32),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Endereço:',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Color(0xFFFFB54B),
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 32, right: 32),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              item.endereco,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFFFFB54B),
                fontSize: 13.0,
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 1,
          color: Color(0xFFC4C4C4),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 32, right: 32),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Horário de Funcionamento:',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Color(0xFFFFB54B),
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 32, right: 32),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              item.hora1,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFFFFB54B),
                fontSize: 13.0,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 32, right: 32),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              item.hora2,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFFFFB54B),
                fontSize: 13.0,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 32, right: 32),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              item.hora3,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFFFFB54B),
                fontSize: 13.0,
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 1,
          color: Color(0xFFC4C4C4),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 32, right: 32),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Faça seu pedido em:',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Color(0xFFFFB54B),
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 32, right: 32),
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset('assets/imagens/Whats.png'),
                ),
                Text(
                item.numero,
                style: TextStyle(
                  fontWeight: FontWeight.w500, 
                  color: Color(0xFFFFB54B), 
                  fontSize: 15.0,
                ),
              ),
              ],
            ), 
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 32, right: 32),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Redes Sociais:',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Color(0xFFFFB54B),
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 32, right: 32),
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset('assets/imagens/Facebook.png'),
                ),
                Text(
                  item.social1,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFB54B),
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 32, right: 32),
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset('assets/imagens/Instagram.png'),
                ),
                Text(
                  item.social2,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFB54B),
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}