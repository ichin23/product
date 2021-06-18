import 'package:flutter/material.dart';
import 'package:product/screens/exitEnterAnimation.dart';
import 'package:product/screens/segundaProduto.dart';

class EditPage extends StatefulWidget {
  EditPage({Key? key}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  GlobalKey<FormState> _formCategoria = GlobalKey<FormState>();
  TextEditingController categoria1 = TextEditingController();
  TextEditingController categoria2 = TextEditingController();
  TextEditingController categoria3 = TextEditingController();
  TextEditingController categoria4 = TextEditingController();
  TextEditingController categoria5 = TextEditingController();

  final tween = Tween<double>(begin: -200, end: 0);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: const Color(0XFF0D0D0D),
          title: Text('Anunciar Produto',
              style: TextStyle(
                fontFamily: 'DMSans_Regular',
                foreground: Paint()
                  ..shader = LinearGradient(
                    colors: <Color>[
                      Color(0xffBE2A2C),
                      Color(0xffDD5429),
                      Color(0xffF27127),
                      Color(0xffE76228),
                      Color(0xffBE2A2C),
                    ],
                  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                fontSize: 35,
              )),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: const Radius.circular(70.0))),
        ),
        backgroundColor: Color(0XFFF27127),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formCategoria,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Stack(
                      children: [
                        // Positioned(
                        //     top: -72,
                        //     right: 285,
                        //     child: Container(
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: <Widget>[
                        //           IconButton(
                        //             onPressed: () {
                        //               Navigator.of(context).pop();
                        //             },
                        //             color: Color(0XFFF27127),
                        //             padding: EdgeInsets.all(10.0),
                        //             icon: Icon(
                        //               Icons.arrow_back_rounded,
                        //               size: 40.0,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //       width: 200,
                        //       height: 200,
                        //     )),
                        Positioned(
                            top: ((MediaQuery.of(context).size.height * 0.4) -
                                    230) /
                                2,
                            left: (MediaQuery.of(context).size.width - 300) / 2,
                            child: Container(
                              width: 303,
                              height: 303,
                              child: Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/mercado-local-2b8c3.appspot.com/o/projeto%2FAnuncie%20seu%20produto.png?alt=media&token=875eec3e-b451-42d4-8dee-b0d8c64c8b07"),
                            )),
                        Positioned(
                          top: 20,
                          right: 30,
                          child: Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0XFFB41C2E), width: 3))),
                        ),
                        Positioned(
                          top: 125,
                          left: -55,
                          child: Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0XFFB41C2E), width: 3))),
                        ),
                        Positioned(
                          top: 250,
                          right: -20,
                          child: Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0XFFB41C2E), width: 3))),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(children: [
                      SizedBox(height: 15),
                      Text("O que vai anunciar?",
                          style: TextStyle(
                              fontFamily: 'DMSans_Bold',
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      Container(
                        width: 400.0,
                        height: 35.0,
                        color: Color(0XFFF27127),
                        alignment:
                            Alignment.topRight, // where to position the child
                        child: FlatButton(
                          minWidth: 15,
                          height: 15,
                          onPressed: () => {},
                          color: Color(0XFFF27127),
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.info_outline,
                                size: 15.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: categoria1,
                        decoration: InputDecoration(
                            fillColor: const Color(0XFFF2E8C9),
                            filled: true,
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 4)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30))),
                        validator: (value) {
                          if (value == null) {
                            categoria1.text = "";
                          }
                          if (value == null ||
                              value.trim() == "" ||
                              value.isEmpty) {
                            return "Digite um nome válido";
                          }
                        },
                      ),
                      SizedBox(height: 15),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                width:
                                    (MediaQuery.of(context).size.width - 100) /
                                        2,
                                child: TextFormField(
                                  controller: categoria2,
                                  decoration: InputDecoration(
                                      fillColor: const Color(0XFFF2E8C9),
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  validator: (value) {
                                    if (value == null) {
                                      categoria1.text = "";
                                    }
                                  },
                                )),
                            Container(
                                width:
                                    (MediaQuery.of(context).size.width - 100) /
                                        2,
                                child: Container(
                                  child: TextFormField(
                                    controller: categoria3,
                                    decoration: InputDecoration(
                                        fillColor: const Color(0XFFF2E8C9),
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(30))),
                                    validator: (value) {
                                      if (value == null) {
                                        categoria1.text = "";
                                      }
                                    },
                                  ),
                                ))
                          ]),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width:
                                (MediaQuery.of(context).size.width - 100) / 2,
                            child: TextFormField(
                              controller: categoria4,
                              decoration: InputDecoration(
                                  fillColor: const Color(0XFFF2E8C9),
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(30))),
                              validator: (value) {
                                if (value == null) {
                                  categoria1.text = "";
                                }
                              },
                            ),
                          ),
                          Container(
                              width:
                                  (MediaQuery.of(context).size.width - 100) / 2,
                              child: TextFormField(
                                controller: categoria5,
                                decoration: InputDecoration(
                                    fillColor: const Color(0XFFF2E8C9),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                validator: (value) {
                                  if (value == null) {
                                    categoria1.text = "";
                                  }
                                },
                              ))
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: MediaQuery.of(context).size.width - 80,
                        height: 60,
                        child: RaisedButton(
                          onPressed: () {
                            List<String> categorias = [];
                            Map<String, dynamic> produto = {};
                            if (_formCategoria.currentState!.validate()) {
                              if (categoria1.text.trim() != "") {
                                categorias.add(categoria1.text);
                              }
                              if (categoria2.text.trim() != "") {
                                categorias.add(categoria2.text);
                              }
                              if (categoria3.text.trim() != "") {
                                categorias.add(categoria3.text);
                              }
                              if (categoria4.text.trim() != "") {
                                categorias.add(categoria4.text);
                              }
                              if (categoria5.text.trim() != "") {
                                categorias.add(categoria5.text);
                              }
                              produto['categorias'] = categorias;
                              Navigator.of(context).push(EnterExitRoute(
                                  exitPage: EditPage(),
                                  enterPage: SegundaProduto(
                                      produtoSendoCadastrado: produto)));
                            }
                            print(produto);
                          },
                          color: const Color(0XFF0D0D0D),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text("Avançar",
                              style: TextStyle(
                                fontFamily: 'DMSans_Regular',
                                foreground: Paint()
                                  ..shader = LinearGradient(
                                    colors: <Color>[
                                      Color(0xffBE2A2C),
                                      Color(0xffDD5429),
                                      Color(0xffF27127),
                                      Color(0xffE76228),
                                      Color(0xffBE2A2C),
                                    ],
                                  ).createShader(
                                      Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                                fontSize: 24,
                              )),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
