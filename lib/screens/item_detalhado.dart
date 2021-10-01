import 'package:flutter/material.dart';
import 'package:patoburguer/models/item_cardapio.dart';

Color corTexto = const Color(0xFF434343);

class ItemDetalhado extends StatelessWidget {
  final ItemCardapio item;

  ItemDetalhado(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: double.infinity,
              height: (MediaQuery.of(context).size.height * 0.5960),
              padding: const EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                color: Color(0xFFF3F3F3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: DetalhesItem(item),
            ),
          ),
          Positioned(
            top: 74.96,
            left: 0,
            right: 0,
            bottom: (MediaQuery.of(context).size.height * 0.5960 - 105.96),
            child: Image.asset(item.imagemSrc),
          ),
        ],
      ),
    );
  }
}

class DetalhesItem extends StatelessWidget {
  final ItemCardapio item;

  DetalhesItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80.96,
        ),
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
    );
  }
}
