import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/drawer.widget.dart';

class meteo extends StatelessWidget {
  const meteo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:	MyDrawer(),
      appBar: AppBar(
        title: Text("meteo"),
      ),
      body:
      Text("meteo"),
    );
  }
}
