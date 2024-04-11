import 'dart:developer';
import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../helpers/HexColors.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  _Inscription createState() => _Inscription();
}
late SharedPreferences prefs;
TextEditingController txt_login = new TextEditingController();
TextEditingController txt_password = new TextEditingController();
TextEditingController txt_nomprenom = new TextEditingController();
TextEditingController _dateTextController = TextEditingController();
final FocusNode _txt_loginFocusNode = FocusNode();
final FocusNode _txt_passwordFocusNode = FocusNode();
final FocusNode _nomprenomFocusNode = FocusNode();
final FocusNode _birthdateFocusNode = FocusNode();
final scaffoldKey = GlobalKey<ScaffoldState>();
var currentFocus;
String DatNaiss = '';
class _Inscription extends State<Inscription> {
  File? image;
  bool hidden_password = true;
  final _key2 = GlobalKey<FormState>();
  DateTime selection = DateTime.now();


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    unfocus() {
      currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    initState() async {
      final _formkey = GlobalKey<FormState>();
      final scaffoldKey = GlobalKey<ScaffoldState>();
      bool hiddenPassword = true;
      super.initState();
    }

    void dispoe() {
      super.dispose();
    }

    return SafeArea(
      top: true,
      child: GestureDetector(
        onTap: unfocus,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          // key: scaffoldKey,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, h * 0.0, 20, 0),
                child: Form(
                  key: _key2,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: w,
                        height: h * 0.1,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                              const AssetImage('img/undraw_details_8k13.png'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.1), BlendMode.dstOut),
                            )),
                        child: Text(
                          "Crée votre compte",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'BebasNeue-Regular',
                            color: HexColor.fromHex('2F2E41'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ProfileImage(context),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        cursorColor: HexColor.fromHex('01579B'),
                        style: TextStyle(color: HexColor.fromHex('01579B')),
                        focusNode: _nomprenomFocusNode,
                        //autofocus: true,
                        enabled: true,
                        keyboardType: TextInputType.name,
                        // keyboardAppearance: Brightness.light,
                        textInputAction: TextInputAction.next,
                        controller: txt_nomprenom,
                        onTap: () => setState(() {
                          //  FocusScope.of(context).requestFocus(_keyboardfocusnode);
                        }),

                        validator: Validators.compose([
                          Validators.required(' Nom et Prénom est requis'),
                          // Validators.min(5, 'Valeur inférieure à 5 non autorisée')
                        ]),
                        //  autocorrect: false,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.group,
                              color: HexColor.fromHex('01579B'),
                            ),
                            labelText: 'Nom Prénom',
                            hintText: 'Nom Prénom',
                            labelStyle:
                            TextStyle(color: HexColor.fromHex('01579B')),
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: HexColor.fromHex('E6E6E6'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none),
                            )),
                        onFieldSubmitted: (term) {
                          _nomprenomFocusNode.unfocus();
                        },
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
                        focusNode: _txt_loginFocusNode,
                        controller: txt_login,
                        cursorColor: HexColor.fromHex('01579B'),
                        style: TextStyle(color: HexColor.fromHex('01579B')),
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
                            labelStyle:
                            TextStyle(color: HexColor.fromHex('01579B')),
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: HexColor.fromHex('E6E6E6'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none),
                            )),
                        onFieldSubmitted: (term) {
                          _txt_loginFocusNode.unfocus();
                          FocusScope.of(context)
                              .requestFocus(_txt_passwordFocusNode);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        enabled: true,
                        cursorColor: HexColor.fromHex('01579B'),
                        style: TextStyle(color: HexColor.fromHex('01579B')),
                        focusNode: _txt_passwordFocusNode,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        /*  inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp(
                                          r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[*.!@$%^&(){}[]:;<>,.?/~_+-=|\]).{8,32}$')),
                                    ],*/
                        onFieldSubmitted: (term) {
                          _txt_passwordFocusNode.unfocus();
                          //        FocusScope.of(context).requestFocus(_birthdateFocusNode);
                        },
                        controller: txt_password,
                        obscureText: hidden_password,
                        onTap: () => setState(() {}),
                        validator: Validators.compose([
                          Validators.required('mot de passe est requis'),
                          Validators.patternString(
                              r'^(?=.*?[a-zA-Z])(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                              'Mot de passe invalide ')
                        ]),
                        /*
                          Vignesh123! : true
                          Yassine123[!@#\$&*~]: true
                          vignesh123 : false
                          VIGNESH123! : false
                          vignesh@ : false
                          12345678? : false*/
                        /* (Passvalidate) {
                                      if (Passvalidate!.isEmpty) {
                                        return 'Veuillez saisir un mot de passe';
                                      } else if (Passvalidate.length < 8) {
                                        return 'Le mot de passe doit compter au moins 8 caractères';
                                      } else if (Passvalidate.length > 32) {
                                        return 'Le mot de passe doit compter maximum 32 caractères';
                                      }
                                      return null;
                                    },*/
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
                            hintText: 'Exemple : Vignesh123! ',
                            labelStyle:
                            TextStyle(color: HexColor.fromHex('01579B')),
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: HexColor.fromHex('E6E6E6'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DateTimeField(
                        cursorColor: HexColor.fromHex('01579B'),
                        style: TextStyle(color: HexColor.fromHex('01579B')),
                        // focusNode: _birthdateFocusNode,
                        // ignore: body_might_complete_normally_nullable
                        validator: (selectedDateTime) {
                          if (selectedDateTime == null) {
                            return ('Veuillez saisir votre date de naissance.');
                          } else {
                            final now = DateTime(DateTime.now().year,
                                DateTime.now().month, DateTime.now().day);
                            final dateSelected = DateTime(selectedDateTime.year,
                                selectedDateTime.month, selectedDateTime.day);
                            // If the DateTime difference is negative,
                            // this indicates that the selected DateTime is in the past
                            if (dateSelected.compareTo(now) == 0) {
                              AlertDialog(
                                title: Text("Error"),
                                backgroundColor: Colors.red,
                                titleTextStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              );
                              return ('Veuillez saisir votre date de naissance.');
                            } else if (!selectedDateTime
                                .difference(DateTime.now())
                                .isNegative) {
                              return ('Date sélectionnée dans le futur.');
                            } else if (DateTime.now().year -
                                selectedDateTime.year <
                                18) {
                              return ('Veuillez saisir une date de naissance valide.');
                            }
                          }
                        },
                        controller: _dateTextController,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: 16,
                                color: HexColor.fromHex('01579B'),
                                fontStyle: FontStyle.normal),
                            filled: true,
                            fillColor: HexColor.fromHex('E6E6E6'),
                            prefixIcon: Icon(
                              Icons.date_range,
                              color: HexColor.fromHex('01579B'),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: "Entrez votre date de naissance ",
                            labelStyle:
                            TextStyle(color: HexColor.fromHex('01579B')),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none),
                            )),
                        format: DateFormat("yyyy-MM-dd"),
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                        },
                        onChanged: (value) {
                          setState(() {
                            DatNaiss = value.toString();
                          });

                          //Do something when changing the item if you want.
                        },
                        onSaved: (value) {
                          setState(() {
                            DatNaiss = value.toString();
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            _onInscrire(context);
                          },
                          child: Text("Inscription" ,
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
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          child: Text("j'ai deja un compte",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                  color: HexColor.fromHex('01579B'))),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/authentification');
                          }),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );



  }

  Future<void> _onInscrire(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    if (_key2.currentState!.validate()) {
      if (!txt_login.text.isEmpty && !txt_password.text.isEmpty) {
        prefs.setString("login", txt_login.text);
        prefs.setString("password", txt_password.text);
        prefs.setBool("connecte", true);
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      } else {
        // Afficher un message d'erreur
        const snackBar = SnackBar(
          content: Text('Échec de la connexion'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
  Color getColor(Set<MaterialState> states) {
    return HexColor.fromHex('01579B');
  }

  Future pickImage(BuildContext context, ImageSource source) async {
    try {
      final image = await ImagePicker()
          .pickImage(source: source)
          .then((value) => setState(() => this.image = File(value!.path)));
      Navigator.pop(context);
    } on PlatformException catch (e) {
      print('faild to pick image ya looo :$e');
    }
  }

  Future<File> saveImage(String imagePath) async {
    final Directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    image = File('${Directory.path}/$name');
    return File(imagePath).copy(imagePath);
  }

  Widget ProfileImage(BuildContext context) {
    log("************image****************");
    log(image.toString());
    return Center(
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: this.context,
                  builder: ((builder) => bottomSheet(context)));
            },
            child: CircleAvatar(
              radius: 53,
              backgroundImage: image == null
                  ? const AssetImage("img/avatar-placeholder.jpg")
                  : FileImage(image!) as ImageProvider,
            ),
          ),
          Positioned(
              bottom: -1.0,
              right: 1.0,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: this.context,
                      builder: ((builder) => bottomSheet(context)));
                },
                child: Icon(
                  Icons.camera,
                  color: HexColor.fromHex('01579B'),
                  size: 35.0,
                ),
              ))
        ],
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          const Text("Choisir votre photo de profile",
              style: TextStyle(fontSize: 20)),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return HexColor.fromHex('FFFFFF');
                        }
                        return HexColor.fromHex('FFD15B');
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                  onPressed: () {
                    pickImage(context, ImageSource.camera);
                  },
                  icon: Icon(
                    Icons.camera,
                    color: HexColor.fromHex('01579B'),
                  ),
                  label: Text(
                    "Camera",
                    style: TextStyle(color: HexColor.fromHex('01579B')),
                  )),
              const SizedBox(
                height: 10,
                width: 10,
              ),
              ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return HexColor.fromHex('FFFFFF');
                        }
                        return HexColor.fromHex('FFD15B');
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                  onPressed: () {
                    pickImage(context, ImageSource.gallery);
                  },
                  icon: Icon(
                    Icons.image,
                    color: HexColor.fromHex('01579B'),
                  ),
                  label: Text(
                    "Gallerie",
                    style: TextStyle(color: HexColor.fromHex('01579B')),
                  ))
            ],
          )
        ],
      ),
    );
  }

}

