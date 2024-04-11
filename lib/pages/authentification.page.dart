import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../helpers/HexColors.dart';
import 'inscription.page.dart';

class authentification extends StatefulWidget {
  const authentification({Key? key}) : super(key: key);

  @override
  _authentification createState() => _authentification();
}
  late SharedPreferences prefs;
  // ignore: non_constant_identifier_names
  bool hidden_password = true;
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final TextEditingController txt_login = TextEditingController();
  final TextEditingController txt_password = TextEditingController();

class _authentification extends State<StatefulWidget> {
  final _key1 = GlobalKey<FormState>();

  TextEditingController get passwordTextController {
    return txt_password;
  }

  TextEditingController get emailTextController {
    return txt_login;
  }

  void dispoe() {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
   /* return Scaffold(
      appBar: AppBar(
        title: Text("authentification"),
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: txt_login,
                decoration: InputDecoration(
                    hintText: "Login",
                    prefix: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1))),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                controller: txt_password,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefix: Icon(Icons.password),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _onAuthentifier(context);
              },
              child: Text("connecter"),
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextButton(
              child: Text("nouvel utilisateur"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/inscription');
              },
            ),
          )
        ],
      ),
    );*/
    setState(() {});
    var currentFocus;
    unfocus() {
      currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
          return SafeArea(
            child: GestureDetector(
              onTap: unfocus,
              child: Form(
                key: _key1,
                child: Scaffold(
                    backgroundColor: Colors.white,
                    body: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, h * 0.0, 20, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: w,
                                height: h * 0.3,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'img/undraw_Ask_me_anything_re_x7pm.png'),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "IN-TRAVEL",
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor.fromHex('2F2E41'),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                /*  inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(RegExp(
                                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")),
                                      ],*/
                                enabled: true,
                                textInputAction: TextInputAction.next,
                                focusNode: _emailFocusNode,
                                controller: txt_login,
                                cursorColor: HexColor.fromHex('01579B'),
                                style: TextStyle(
                                    color: HexColor.fromHex('01579B')),
                                onTap: () => setState(() {}),
                                // keyboardType: TextInputType.emailAddress,
                                validator: Validators.compose([
                                  Validators.email('adresse email non valide'),
                                  Validators.required('Mail est requis')
                                ]),
                                autocorrect: false,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: HexColor.fromHex('01579B'),
                                    ),
                                    labelText: 'Email',
                                    hintText: 'example@domain.com',
                                    labelStyle: TextStyle(
                                        color: HexColor.fromHex('01579B')),
                                    filled: true,
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                    fillColor: HexColor.fromHex('E6E6E6'),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: const BorderSide(
                                          width: 0, style: BorderStyle.none),
                                    )),
                                onFieldSubmitted: (term) {
                                  _emailFocusNode.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(_passwordFocusNode);
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                cursorColor: HexColor.fromHex('01579B'),
                                style: TextStyle(
                                    color: HexColor.fromHex('01579B')),
                                focusNode: _passwordFocusNode,
                                controller: txt_password,
                                obscureText: hidden_password,
                                onTap: () => setState(() {
                                  FocusScope.of(context).unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(_passwordFocusNode);
                                }),
                                // ignore: non_constant_identifier_names
                                validator: Validators.compose([
                                  Validators.required(
                                      'mot de passe est requis'),
                                  /*   Validators.patternString(
                                      r'^(?=.*?[a-zA-Z])(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                                      'Mot de passe invalide ')*/
                                ]),
                                autocorrect: false,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.visibility,
                                          color: HexColor.fromHex('01579B')),
                                      onPressed: () => setState(() {
                                        hidden_password = !hidden_password;
                                      }),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      color: HexColor.fromHex('01579B'),
                                    ),
                                    labelText: 'Mot de passe',
                                    hintText: 'Mot de passe',
                                    labelStyle: TextStyle(
                                        color: HexColor.fromHex('01579B')),
                                    filled: true,
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                    fillColor: HexColor.fromHex('E6E6E6'),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: const BorderSide(
                                          width: 0, style: BorderStyle.none),
                                    )),
                                onFieldSubmitted: (term) async {

                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                  child: Text('Réinitialiser mot de passe',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.normal,
                                          color: HexColor.fromHex('01579B'))),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Inscription()));
                                  }),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                  child: Text('Crée Une Compte',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.normal,
                                          color: HexColor.fromHex('01579B'))),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const Inscription()));
                                  }),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 40,
                                width: 200,
                                alignment: Alignment.center,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    InkWell(
                                        child: Image.asset(
                                            "img/icons8-gmail-48.png",
                                            height: 40,
                                            width: 40),
                                        onTap: () async {

                                        }),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    InkWell(
                                        child: Image.asset(
                                            "img/icons8-microsoft-48.png",
                                            height: 40,
                                            width: 40),
                                        onTap: () {}),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    _onAuthentifier(context);
                                  },
                                  child: Text("Se connecter" ,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor.fromHex('01579B'))),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                                        if (states.contains(MaterialState.pressed)) {
                                          return HexColor.fromHex('01579B');
                                        }
                                        return HexColor.fromHex('FFD15B');
                                      }),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30)))),
                                ),
                              ),

                            ],
                          ),
                        ))),
              ),
            ),
          );
  }

  Future<void> _onAuthentifier(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    if (_key1.currentState!.validate()) {
    if (!txt_login.text.isEmpty && !txt_password.text.isEmpty) {
      String log = prefs.getString("login@login.com") ?? "";
      String psw = prefs.getString("password") ?? "";
      prefs.setBool("connecte", true);
      print(txt_password.text);
      if (txt_login.text == log && txt_password.text == psw) {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      }
    } else {
      const snackBar = SnackBar(
        content: Text('Échec de la connexion'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    }
  }
}
