import 'package:flutter/material.dart';
import 'package:patoburguer/models/item_cardapio.dart';

Color corTexto = const Color(0xFF434343);

class ItemDetalhado extends StatelessWidget {
  //final ItemCardapio item;

  //ItemDetalhado(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(" sei la"),)
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