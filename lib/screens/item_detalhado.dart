import 'package:flutter/material.dart';

class ItemDetalhado extends StatelessWidget {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80.96,
                  ),
                  Text(
                    'X-Pato Bacon',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF434343),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                    child: Text(
                      'Detalhes',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF434343),
                      ),
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipisci elit. Morbi ultricies ipsum justo, at molestie risus mollis a. ',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0x3C434343),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                    child: Text(
                      'Ingredientes',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF434343),
                      ),
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipisci elit. Morbi ultricies ipsum justo, at molestie risus mollis a. ',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0x3C434343),
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
                          '0,00',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF434343),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 74.96,
            left: 0,
            right: 0,
            bottom: (MediaQuery.of(context).size.height * 0.5960 - 105.96),
            child: Image.asset('assets/images/pato-bacon_solo.png'),
          ),
        ],
      ),
    );
  }
}
