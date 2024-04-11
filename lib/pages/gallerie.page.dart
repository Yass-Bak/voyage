import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/drawer.widget.dart';

class gallerie extends StatelessWidget {
  const gallerie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:	MyDrawer(),
      appBar: AppBar(
        title: Text("gallerie"),
      ),
      body:
      Text("gallerie"),
    );
  }
}
