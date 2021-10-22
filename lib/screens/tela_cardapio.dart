import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patoburguer/models/produto.dart';

class tela_cardapio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size(0, 90.0),
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.white,
              labelColor: Colors.orange,
              indicatorColor: Colors.transparent,
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              indicator: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                color: Colors.white,
              ),
              tabs: [
                Tab(
                  text: 'PROMOÇÕES',
                ),
                Tab(
                  text: "CARNE",
                ),
                Tab(
                  text: "FRANGO",
                ),
                Tab(
                  text: "COMBOS",
                ),
                Tab(
                  text: "BEBIDAS",
                ),
              ],
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange,
          title: Text('Cardápio',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              )),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 32, right: 20, left: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
          ),
          child: TabBarView(
            children: [
              TabContent('promocao'),
              TabContent('carne'),
              TabContent('frango'),
              TabContent('combo'),
              TabContent('bebida'),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCardapio extends StatelessWidget {
  final Produto produto;

  ItemCardapio(this.produto);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: 135,
        height: 168,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
          gradient: SweepGradient(
            startAngle: 0.0,
            endAngle: 31.45,
            stops: [
              0.1,
              0.1,
            ],
            colors: [Color(0xFFFFFFFF), Color(0xFFFFCB82)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0.9,
              blurRadius: 1,
              offset: Offset(0, 3.5),
            ),
          ],
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            print(produto.documentId);
          },
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                height: 80,
                child: FittedBox(
                  alignment: AlignmentDirectional.center,
                  fit: BoxFit.cover,
                  child: Image.network(
                    produto.imagem,
                    width: 1000,
                    height: 80,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                produto.nome,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                (produto.promocao)
                    ? 'R\$ ${produto.precoPromocional.toStringAsFixed(2).replaceAll('.', ',')}'
                    : 'R\$ ${produto.preco.toStringAsFixed(2).replaceAll('.', ',')},',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TabContent extends StatelessWidget {
  final String categoria;

  const TabContent(this.categoria, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 25.0),
      child: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('produtos')
            .where('categorias', arrayContains: categoria)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError ||
              (snapshot.hasData && snapshot.data.docs.length == 0)) {
            return Center(
              child: Text(
                'Não há itens desta categoria neste momento!',
                textAlign: TextAlign.center,
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            List<Widget> produtos = [];

            snapshot.data.docs.forEach((doc) {
              Produto produto = Produto(
                doc.id,
                doc.get('imagem'),
                doc.get('nome'),
                doc.get('detalhes'),
                doc.get('ingredientes'),
                doc.get('preco'),
                doc.get('promocao'),
                doc.get('promocao')
                    ? doc.get('precoPromocional')
                    : doc.get('preco'),
              );

              produtos.add(ItemCardapio(produto));
            });

            return Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 32,
              children: produtos,
            );
          }

          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        },
      ),
    );
  }
}
