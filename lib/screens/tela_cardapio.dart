import 'package:flutter/material.dart';

class tela_cardapio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          elevation: 0,
          bottom: const TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.white,
            labelColor: Colors.yellow,
            tabs: [
              Tab(
                text: "PROMOÇÕES",
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
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
          ),
          child: TabBarView(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
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
                          ],),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                            shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () {},
                          child: Column(
                            children: [
                              IconButton(
                                icon: Image.asset("assets/images/guarana.png"),
                                iconSize: 120,
                                onPressed: () {},
                              ),
                              Text(
                                "Guaraná Lata",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
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
                          ],),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                            shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () {},
                          child: Column(
                            children: [
                              IconButton(
                                icon: Image.asset("assets/images/coca.png"),
                                iconSize: 120,
                                onPressed: () {},
                              ),
                              Text(
                                "Coca-Cola Lata",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text("CARNE"),
              Text("FRANGO"),
              Text("COMBOS"),
              Text("BEBIDAS"),
            ],
          ),

        ),
      ),
    );
  }
}
