import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/drawer.widget.dart';

class contact extends StatelessWidget {
  const contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:	MyDrawer(),
      appBar: AppBar(
        title: Text("contact"),
      ),
      body:
      Text("contact"),
    );
  }
}
