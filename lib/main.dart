import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/pages/authentification.page.dart';
import 'package:voyage/helpers/drawer.widget.dart';
import 'package:voyage/pages/contact.page.dart';
import 'package:voyage/pages/gallerie.page.dart';
import 'package:voyage/pages/home.page.dart';
import 'package:voyage/pages/inscription.page.dart';
import 'package:voyage/pages/meteo.page.dart';
import 'package:voyage/pages/parameters.page.dart';
import 'package:voyage/pages/pays.page.dart';

final routes = {
  '/inscription': (context) => Inscription(),
  '/home': (context) => Home(),
  '/authentification': (context) => authentification(),
  '/MyDrawer': (context) => MyDrawer(),
  '/contact': (context) => contact(),
  '/gallerie': (context) => gallerie(),
  '/meteo': (context) => meteo(),
  '/pays': (context) => pays(),
  '/parameters': (context) => parameters(),
};
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      home: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              bool conn = snapshot.data?.getBool('connecte') ?? false;
              if (conn) return Home();
            }
            return authentification();
          }),
      debugShowCheckedModeBanner: false,
    );
  }
}
