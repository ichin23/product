import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product/services/cadastroProdutoProvidere.dart';
import 'package:provider/provider.dart';
import 'components/customField.dart';

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
    final produtoProvider = Provider.of<ProdutoCadastro>(context);
    if (produtoProvider.cadastrando != null) {
      print(produtoProvider.cadastrando!.length);
      if (produtoProvider.cadastrando!.length != 0) {
        for (int i = 0; i < produtoProvider.cadastrando!.length; i++) {
          setState(() {
            if (i == 0) {
              categoria1.text = produtoProvider.cadastrando!['categorias'][0];
            }
            if (i == 1) {
              categoria2.text = produtoProvider.cadastrando!['categorias'][0];
            }
            if (i == 2) {
              categoria3.text = produtoProvider.cadastrando!['categorias'][0];
            }
            if (i == 3) {
              categoria4.text = produtoProvider.cadastrando!['categorias'][0];
            }
            if (i == 3) {
              categoria5.text = produtoProvider.cadastrando!['categorias'][0];
            }
          });
        }
      }
    }
    // return Material(
    //   child: Scaffold(
    //     appBar: AppBar(
    //       toolbarHeight: 120,
    //       backgroundColor: const Color(0XFF0D0D0D),
    //       title: Text('Anunciar Produto',
    //           style: TextStyle(
    //             fontFamily: 'DMSans_Regular',
    //             foreground: Paint()
    //               ..shader = LinearGradient(
    //                 colors: <Color>[
    //                   Color(0xffBE2A2C),
    //                   Color(0xffDD5429),
    //                   Color(0xffF27127),
    //                   Color(0xffE76228),
    //                   Color(0xffBE2A2C),
    //                 ],
    //               ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
    //             fontSize: 35,
    //           )),
    //       centerTitle: true,
    //       shape: RoundedRectangleBorder(
    //           borderRadius:
    //               BorderRadius.only(bottomRight: const Radius.circular(70.0))),
    //     ),
    //     backgroundColor: Color(0XFFF27127),
    //     body: SafeArea(
    //       child:
    return SingleChildScrollView(
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
                      top: ((MediaQuery.of(context).size.height * 0.4) - 230) /
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
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: CustomField(
                          label: "Categoria",
                          maxLines: 1,
                          controller: categoria1,
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
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.info_outline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          width: (MediaQuery.of(context).size.width - 100) / 2,
                          child: CustomField(
                            maxLines: 1,
                            label: "Categoria 2",
                            controller: categoria2,
                            validator: (value) {
                              if (value == null) {
                                categoria1.text = "";
                              }
                            },
                          )),
                      Container(
                          width: (MediaQuery.of(context).size.width - 100) / 2,
                          child: Container(
                            child: CustomField(
                              controller: categoria3,
                              label: "Categoria 3",
                              maxLines: 1,
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
                      width: (MediaQuery.of(context).size.width - 100) / 2,
                      child: CustomField(
                        controller: categoria4,
                        label: "Categoria 4",
                        maxLines: 1,
                        validator: (value) {
                          if (value == null) {
                            categoria1.text = "";
                          }
                        },
                      ),
                    ),
                    Container(
                        width: (MediaQuery.of(context).size.width - 100) / 2,
                        child: CustomField(
                          controller: categoria5,
                          label: "Categoria 5",
                          maxLines: 1,
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
                        produtoProvider.adiciona(produto);
                        produtoProvider.changeIndex(1);
                        // Navigator.of(context).push(EnterExitRoute(
                        //     exitPage: EditPage(),
                        //     enterPage: SegundaProduto(
                        //         // produtoSendoCadastrado: produto
                        //         )));
                      }
                      print(produtoProvider.cadastrando);
                    },
                    color: const Color(0XFF0D0D0D),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text("Avançar",
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontWeight: FontWeight.w900,
                          fontFamily: "Arial",
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
                          fontSize: 30,
                        )),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
