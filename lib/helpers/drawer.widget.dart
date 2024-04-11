import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:io';

import 'HexColors.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: HexColor.fromHex('FFFFFF'),
            ),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft + const Alignment(0, 0.3),
                  child: InkWell(
                    //onTap: () => Navigator.of(context).pushNamed("/Profile"),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("img/avatar-placeholder.jpg"),
                      radius: 50.0,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight + const Alignment(0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      _Deconnexion(context);
                    },
                    child: Text(
                      'Déconnecter',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: HexColor.fromHex('01579B')),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return HexColor.fromHex('FFFFFF');
                          }
                          return HexColor.fromHex('FFD15B');
                        }),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(30)))),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home_filled,
              color: HexColor.fromHex('2F88FF'),
              size: 30,
            ),
            title: Text("Home",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Lato-Bold.ttf',
                    color: HexColor.fromHex('2F2E41'))),
            onTap: () {
              Navigator.pushNamed(context, "/home");

              //Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.contacts,
              size: 30,
              color: HexColor.fromHex('2F88FF'),
            ),
            title: Text('Contact',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    fontFamily: 'Lato-Bold.ttf',
                    color: HexColor.fromHex('2F2E41'))),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushNamed(context, "/contact");
              //Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.cloud_rounded,
              size: 30,
              color: HexColor.fromHex('2F88FF'),
            ),
            title: Text('Meteo',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Lato-Bold.ttf',
                    color: HexColor.fromHex('2F2E41'))),
            onTap: () {
              Navigator.pushNamed(context, "/meteo");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.location_on_rounded,
              size: 30,
              color: HexColor.fromHex('2F88FF'),
            ),
            title: Text('Pays',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Lato-Bold.ttf',
                    color: HexColor.fromHex('2F2E41'))),
            onTap: () {
              Navigator.pushNamed(context, "/pays");

              //Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: HexColor.fromHex('2F88FF'),
              size: 30,
            ),
            title: Text("Parameters",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Lato-Bold.ttf',
                    color: HexColor.fromHex('2F2E41'))),
            onTap: () {
              Navigator.pushNamed(context, "/parameters");

              //Navigator.pop(context);
            },
          ),
   ]));
  }
  Future<void> _Deconnexion(BuildContext context) async =>
      Navigator.pushNamedAndRemoveUntil(
          context, '/authentification', (route) => false);
//_Deconnexion
}

