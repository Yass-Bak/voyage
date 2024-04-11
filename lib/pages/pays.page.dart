import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/drawer.widget.dart';

class pays extends StatelessWidget {
  const pays({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:	MyDrawer(),
      appBar: AppBar(
        title: Text("pays"),
      ),
      body:
         Text("Deconnexion"),
        );
  }
}
