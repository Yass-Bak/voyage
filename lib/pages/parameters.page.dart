import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/drawer.widget.dart';

class parameters extends StatelessWidget {
  const parameters({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:	MyDrawer(),
      appBar: AppBar(
        title: Text("parameters"),
      ),
      body:
      Text("parameters"),
    );
  }
}
