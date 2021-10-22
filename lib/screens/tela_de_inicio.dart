import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patoburguer/assets/icons.dart';
import 'package:patoburguer/models/item_cardapio.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'item_detalhado.dart';

final String assetName = 'assets/Images/noun_Hamburger_2077474 (1).svg';

class telaDeInicio extends StatelessWidget {
  const telaDeInicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
            toolbarHeight: 70,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pato ",
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 24,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  "Burguer",
                  style: TextStyle(
                      color: Color(0xFFFF9B0D),
                      fontSize: 24,
                      fontWeight: FontWeight.w900),
                )
              ],
            ),
            backgroundColor: Color(0xFFFFFFFF)),
        body: SafeArea(
          child: Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Promoção",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w900)),
                                  Text(
                                    "Semanal",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w900),
                                  )
                                ],
                              ))),
                      SizedBox(
                        height: 30,
                      ),
                      FutureBuilder(
                          future: FirebaseFirestore.instance
                              .collection('produtos')
                              .where('promocao', isEqualTo: true)
                              .limit(2)
                              .get(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              //return item_em_promocao();
                              List<Widget> promocoes = [];
                              snapshot.data.docs.forEach((doc) {
                                promocoes.add(item_em_promocao(
                                    doc.id,
                                    doc.get('nome'),
                                    doc.get('imagem'),
                                    doc.get('preco'),
                                    doc.get('precoPromocional'),
                                ));
                                promocoes.add(SizedBox(height: 70));
                              });
                              return Column(children: promocoes);
                              //return Text();
                            }
                            return Container();
                          }),
                      //item_em_promocao(),

                      //SizedBox(height: 70,),
                      /*Stack(
                                clipBehavior: Clip.none,
                                children:[
                                  Align(
                                      alignment: Alignment(-0.6, 0.5),
                                      child:ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xFFFFFFFF),
                                          fixedSize: Size(250.54,98.0),
                                        ),
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child:  Column(
                                              children:[
                                                Padding(
                                                  padding: const EdgeInsets.only(right:145, bottom: 7, top:10),
                                                  child: Text("X-Calabresa",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      //
                                                      fontSize: 12.0,
                                                      color: Color(0xFF434343),
                                                      fontStyle: FontStyle.normal,
                                                    ),
                                                  ),),
                                                Padding(
                                                    padding: const EdgeInsets.only(right: 118,bottom: 7),
                                                    child:Text("15% de Desconto",
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                          color: Color(0xFF434343),
                                                          fontStyle: FontStyle.normal,
                                                        ))
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(bottom: 5),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "R\$ 0,00 ",
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                              fontSize: 20.0,
                                                              color: Colors.black,
                                                              fontStyle: FontStyle.normal
                                                          ),
                                                        ),
                                                        Text(
                                                            "0,00",
                                                            style: TextStyle(
                                                              decoration: TextDecoration.lineThrough,
                                                              decorationColor: Colors.red,
                                                            )
                                                        ),
                                                      ],
                                                    )
                                                )

                                              ]),
                                        ), onPressed: () {
                                        /*Navigator.push(context,
                        MaterialPageRoute(
                        builder: (context) => ItemDetalhado(ItemCardapio(),);
                      )
                    );
                    */
                                      },
                                      )
                                  ),
                                  Positioned(
                                      right: 15,
                                      top: -125,
                                      child:Container(
                                          child: Image.asset('assets/images/pato-bacon_solo.png',
                                            width: 250,
                                            height: 350,
                                          )
                                      )
                                  )

                                ]
                            ),*/
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, top: 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFFFFFFFF),
                                        fixedSize: Size(150, 190),
                                      ),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 0),
                                              child: Icon(
                                                  Hamburguer.HamburguerIcon,
                                                  size: 100,
                                                  color: Color(0xFFFF9B0D)),
                                              //Icon(Icons.fastfood, size: 70, color: Color(0xFFFF9B0D)),
                                            ),
                                            Text("Cardápio",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color(0xFFFF9B0D),
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ]),
                                      onPressed: () {}),
                                )),
                            Padding(
                                padding:
                                    const EdgeInsets.only(right: 30, top: 0),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xFFFFFFFF),
                                          fixedSize: Size(150, 190),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 20),
                                                child: Icon(Icons.phone,
                                                    size: 70,
                                                    color: Color(0xFFFF9B0D))),
                                            Text("Contato",
                                                style: TextStyle(
                                                  color: Color(0xFFFF9B0D),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ],
                                        ),
                                        onPressed: () {}))),
                          ])
                    ]),
              ),
            ),


          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            /*if(index==0){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ItemDetalhado()));
            };*/
            switch (index) {
              /*case 1:
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => //tela de laches);
                break;*/
              /*case 2:
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => //tela de bebidas;
                break;
              case 3:
                    Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => // tela de combos;
                    break;
                }*/
            }
          },
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                title: Text("Home",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontStyle: FontStyle.normal)),
                icon: Icon(Home_icon.HomeIcon,
                    color: Color(0xFFFFFFFF), size: 35)),
            BottomNavigationBarItem(
                title: Text("Lanches",
                    style: TextStyle(
                        color: Color(0xCCF7F7F7),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal)),
                icon: Icon(
                  Hamburguer.HamburguerIcon,
                  color: Color(0xCCF7F7F7),
                  size: 35,
                )),
            BottomNavigationBarItem(
                title: Text("Bebidas",
                    style: TextStyle(
                        color: Color(0xCCF7F7F7),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal)),
                icon: Icon(Bebidas_icon.BebidasIcon,
                    color: Color(0xCCF7F7F7), size: 35)),
            BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              icon: Icon(Combos_icon.CombosIcon,
                  color: Color(0xCCF7F7F7), size: 35),
              title: Text("Combos",
                  style: TextStyle(
                      color: Color(0xCCF7F7F7),
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal)),
            ),
          ],
          backgroundColor: Theme.of(context).primaryColor,
        )


        );
  }
}

class item_em_promocao extends StatelessWidget {
  final String nome;
  final String imagem;
  final double preco;
  final double preco_promocional;
  final String id;
  item_em_promocao(this.id, this.nome, this.imagem, this.preco, this.preco_promocional);

  @override
  Widget build(BuildContext context) {
    double porcentagem =  (preco - preco_promocional)/preco * 100;

    return Stack(clipBehavior: Clip.none, children: [
      Align(
          alignment: Alignment(-0.6, 0.5),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFFFFFFF),
              fixedSize: Size(250.54, 98.0),
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                Padding(
                  padding:
                      const EdgeInsets.only(right: 0, bottom: 7, top: 10),
                  child: Text(
                    nome,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      //
                      fontSize: 12.0,
                      color: Color(0xFF434343),
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 0, bottom: 7),
                    child: Text("${porcentagem.toStringAsFixed(0)}% de Desconto",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFF434343),
                          fontStyle: FontStyle.normal,
                        ))),
                Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          "R\$ ${preco_promocional.toStringAsFixed(2).replaceAll(".", ",")}  ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontStyle: FontStyle.normal),
                        ),
                        Text(
                            "${preco.toStringAsFixed(2).replaceAll(".", ",")}",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.red,
                            )),
                      ],
                    ))
              ]),
            ),
            //Positioned(),
            onPressed: () {
              /*Navigator.push(context,
                                            MaterialPageRoute(
                                              builder: (context) => ItemDetalhado(ItemCardapio(),);
                                            )    */
            },
          )),
      Positioned(
          right: 55,
          top: -75,
          child: Image.asset(
            imagem,
            width: 150,
            height: 250,
          ))
    ]);
  }
}
