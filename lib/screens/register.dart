import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                    controller: nome,
                    decoration: InputDecoration(labelText: "Nome:")),
                TextFormField(
                    controller: email,
                    decoration: InputDecoration(labelText: "e-Mail:")),
                TextFormField(
                    controller: senha,
                    decoration: InputDecoration(labelText: "Senha:")),
                TextButton(
                    child: Text("Enviar"),
                    onPressed: () {
                      FirebaseAuth.instance
                          // .signInWithEmailAndPassword(
                          // email: email.text, password: senha.text);
                          .createUserWithEmailAndPassword(
                              email: email.text, password: senha.text)
                          .then((value) => FirebaseAuth.instance.currentUser!
                              .updateDisplayName(nome.text));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
