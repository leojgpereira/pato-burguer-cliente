import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patoburguer/models/informacoes.dart';

class Contato extends StatelessWidget {
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
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFFFFFFFF),
          ),
          onPressed: () {},
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
            child: FutureBuilder(
              future:
                  FirebaseFirestore.instance.collection('informacoes').get(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasError || snapshot.data.docs[0] == null) {
                  return Center(
                    child: Text('Erro ao buscar informações!'),
                  );
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Informacoes informacoes = Informacoes(
                    id: snapshot.data.docs[0].id,
                    endereco: snapshot.data.docs[0].get('endereco'),
                    horarioSegSex: snapshot.data.docs[0].get('horarioSegSex'),
                    horarioSab: snapshot.data.docs[0].get('horarioSab'),
                    horarioDomFer: snapshot.data.docs[0].get('horarioDomFer'),
                    whatsapp: snapshot.data.docs[0].get('whatsapp'),
                    facebook: snapshot.data.docs[0].get('facebook'),
                    instagram: snapshot.data.docs[0].get('instagram'),
                  );

                  return ContatoDetalhes(informacoes);
                }

                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ContatoDetalhes extends StatelessWidget {
  final Informacoes item;

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Segunda à Sexta',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFB54B),
                    fontSize: 13.0,
                  ),
                ),
                Text(
                  item.horarioSegSex,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFB54B),
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 32, right: 32),
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sábado',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFB54B),
                    fontSize: 13.0,
                  ),
                ),
                Text(
                  item.horarioSab,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFB54B),
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 32, right: 32),
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Domingo e Feriados',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFB54B),
                    fontSize: 13.0,
                  ),
                ),
                Text(
                  item.horarioDomFer,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFB54B),
                    fontSize: 13.0,
                  ),
                ),
              ],
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
                  item.whatsapp,
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
                  item.facebook,
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
                  item.instagram,
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
