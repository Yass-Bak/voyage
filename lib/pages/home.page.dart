import 'package:flutter/material.dart';
import 'package:voyage/helpers/drawer.widget.dart';

import '../helpers/HexColors.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:	MyDrawer(),
      appBar:  AppBar(
        title: const Text('HOME',style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold)),
        centerTitle: true,
        //backgroundColor: HexColor.fromHex('2F2E41'),
      ),
      body: Center( child: Wrap(
    children: [ InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/meteo');
      },
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black, // You can change the color here
              width: 2, // You can adjust the width of the border
            ),
          ),
          child: Ink.image(
            height: 180,
            width: 180,
            image: AssetImage('img/meteo.png'),
          ),
        ),
    ),
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/meteo');
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black, // You can change the color here
              width: 2, // You can adjust the width of the border
            ),
          ),
          child: Ink.image(
            height: 180,
            width: 180,
            image: AssetImage('img/pays.png'),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/pays');
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black, // You can change the color here
              width: 2, // You can adjust the width of the border
            ),
          ),
          child: Ink.image(
            height: 180,
            width: 180,
            image: AssetImage('img/gallerie.png'),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/parameters');
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black, // You can change the color here
              width: 2, // You can adjust the width of the border
            ),
          ),
          child: Ink.image(
            height: 180,
            width: 180,
            image: AssetImage('img/parameters.png'),
          ),
        ),
      ),
    ],
    ),

    ));
  }

  Future<void> _Deconnexion(BuildContext context) async =>
      Navigator.pushNamedAndRemoveUntil(
          context, '/authentification', (route) => false);
  //_Deconnexion
}
