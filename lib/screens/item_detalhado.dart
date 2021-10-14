import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patoburguer/models/item_cardapio.dart';

Color corTexto = const Color(0xFF434343);

class ItemDetalhado extends StatelessWidget {
  final String documentId;

  ItemDetalhado(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference produtos =
        FirebaseFirestore.instance.collection('produtos');

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Cardápio',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder(
        future: produtos.doc(documentId).get(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError ||
              (snapshot.hasData && !snapshot.data!.exists)) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: (MediaQuery.of(context).size.height * 0.6),
                padding: EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                  color: Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.report,
                      size: 48.0,
                    ),
                    Text('Erro ao encontrar o item selecionado!')
                  ],
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            final ItemCardapio produto = ItemCardapio(
              data['imagem'],
              data['nome'],
              data['detalhes'],
              data['ingredientes'],
              data['preco'],
            );

            return Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: (MediaQuery.of(context).size.height * 0.6),
                    padding: EdgeInsets.only(
                      top: 105.96,
                      left: 25.0,
                      right: 25.0,
                      bottom: 25.0,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: DetalhesItem(produto),
                  ),
                ),
                Positioned(
                  top: 74.96,
                  left: 0,
                  right: 0,
                  bottom:
                      (MediaQuery.of(context).size.height * 0.5960 - 105.96),
                  child: Image.asset(data['imagem']),
                ),
              ],
            );
          }

          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: (MediaQuery.of(context).size.height * 0.6),
              padding: EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                color: Color(0xFFF3F3F3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetalhesItem extends StatelessWidget {
  final ItemCardapio item;

  DetalhesItem(this.item);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.nome,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              color: corTexto,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
            child: Text(
              'Detalhes',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
                color: corTexto,
              ),
            ),
          ),
          Text(
            item.detalhes,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: corTexto.withOpacity(0.6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
            child: Text(
              'Ingredientes',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
                color: corTexto,
              ),
            ),
          ),
          Text(
            item.ingredientes,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: corTexto.withOpacity(0.6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Row(
              children: [
                Text(
                  'R\$ ',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFF9B0D),
                  ),
                ),
                Text(
                  item.preco.toStringAsFixed(2).replaceAll('.', ','),
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    color: corTexto,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
