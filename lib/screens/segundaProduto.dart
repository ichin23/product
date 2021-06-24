import 'package:flutter/material.dart';
import 'package:product/screens/components/customField.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:product/services/cadastroProdutoProvidere.dart';
import 'package:provider/provider.dart';

class SegundaProduto extends StatefulWidget {
  // SegundaProduto({Key? key, required this.produtoSendoCadastrado})
  //     : super(key: key);

  @override
  _SegundaProdutoState createState() => _SegundaProdutoState();
}

class _SegundaProdutoState extends State<SegundaProduto> {
  TextEditingController nome = TextEditingController();
  TextEditingController marca = TextEditingController();
  TextEditingController genero = TextEditingController();
  GlobalKey<FormState> _formProduto = GlobalKey<FormState>();

  Color? currentColor;
  Color? currentColor2;
  Color? currentColor3;
  Color? currentColor4;

  final _controller = CircleColorPickerController(
    initialColor: Colors.blue,
  );

  @override
  void initState() {
    super.initState();
    final produtoProvider =
        Provider.of<ProdutoCadastro>(context, listen: false);
    if (produtoProvider.cadastrando != null) {
      if (produtoProvider.cadastrando!.containsKey('nome')) {
        nome.text = produtoProvider.cadastrando!['nome'];
      }
      if (produtoProvider.cadastrando!.containsKey('marca')) {
        marca.text = produtoProvider.cadastrando!['marca'];
      }
      if (produtoProvider.cadastrando!.containsKey('genero')) {
        genero.text = produtoProvider.cadastrando!['genero'];
      }
      if (produtoProvider.cadastrando!.containsKey('cores')) {
        if (produtoProvider.cadastrando!['cores'].containsKey('primeira')) {
          currentColor = produtoProvider.cadastrando!['cores']['primeira'];
        }
        if (produtoProvider.cadastrando!['cores'].containsKey('segunda')) {
          currentColor2 = produtoProvider.cadastrando!['cores']['segunda'];
        }
        if (produtoProvider.cadastrando!['cores'].containsKey('terceira')) {
          currentColor3 = produtoProvider.cadastrando!['cores']['terceira'];
        }
        if (produtoProvider.cadastrando!['cores'].containsKey('quarta')) {
          currentColor4 = produtoProvider.cadastrando!['cores']['quarta'];
        }
      } else if (produtoProvider.cadastrando!.containsKey('coresList')) {
        try {
          currentColor = produtoProvider.cadastrando!['coresList'][0];
        } catch (e) {
          print(e);
        }
        try {
          currentColor2 = produtoProvider.cadastrando!['coresList'][1];
        } catch (e) {
          print(e);
        }
        try {
          currentColor3 = produtoProvider.cadastrando!['coresList'][3];
        } catch (e) {
          print(e);
        }
        try {
          currentColor4 = produtoProvider.cadastrando!['coresList'][4];
        } catch (e) {
          print(e);
        }
      }
      // for (int i = 0; i < produtoProvider.cadastrando['cores'].length; i++) {
      //   if (i == 0) {
      //     currentColor = produtoProvider.cadastrando['cores'][i];
      //   }
      //   if (i == 1) {
      //     currentColor2 = produtoProvider.cadastrando['cores'][i];
      //   }
      //   if (i == 2) {
      //     currentColor3 = produtoProvider.cadastrando['cores'][i];
      //   }
      //   if (i == 3) {
      //     currentColor4 = produtoProvider.cadastrando['cores'][i];
      //   }
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    final produtoProvider = Provider.of<ProdutoCadastro>(context);
    print(produtoProvider.cadastrando!.length);

    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // CustomAppBar(),
      Padding(
        padding: const EdgeInsets.only(top: 15, left: 15),
        child: GestureDetector(
          onTap: () => produtoProvider.changeIndex(0),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 3)),
            child: Icon(Icons.arrow_back, size: 40),
          ),
        ),
      ),
      Form(
          key: _formProduto,
          child: Column(
            children: [
              Column(children: [
                Text(
                  "Nome",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: CustomField(
                    maxLines: 1,
                    controller: nome,
                    validator: (value) {
                      if (value == null) {
                        nome.text = "";
                      }
                      if (value!.trim() == "") {
                        return "Digite um nome";
                      }
                    },
                  ),
                ),
              ]),
              SizedBox(height: 15),
              Column(children: [
                Text(
                  "Marca",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: CustomField(maxLines: 1, controller: marca),
                ),
              ]),
              SizedBox(height: 15),
              Column(children: [
                Text(
                  "Gênero",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: CustomField(
                    controller: genero,
                    maxLines: 1,
                    validator: (value) {
                      if (value == null) {
                        genero.text = "";
                      }
                      if (value!.trim() == "") {
                        return "Digite um nome";
                      }
                    },
                  ),
                ),
              ]),
              SizedBox(height: 15),
              Column(children: [
                Text(
                  "Cores",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                ),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            Color? newColor;

                            await showModalBottomSheet(
                                backgroundColor: Theme.of(context).accentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                context: context,
                                builder: (context) => StatefulBuilder(
                                      builder:
                                          (context, StateSetter setState) =>
                                              Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircleColorPicker(
                                              // initialColor: Colors.blue,
                                              onChanged: (color) {
                                                setState(() {
                                                  newColor = color;
                                                });
                                              },
                                              size: const Size(240, 240),
                                              strokeWidth: 4,
                                              thumbSize: 36,
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.delete),
                                              onPressed: () => newColor = null,
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                            print(newColor);
                            setState(() {
                              currentColor = newColor;
                            });
                          },
                          child: (currentColor == null)
                              ? Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Icon(Icons.add))
                              : Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentColor)),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Color? newColor;

                            await showModalBottomSheet(
                                backgroundColor: Theme.of(context).accentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                context: context,
                                builder: (context) => StatefulBuilder(
                                      builder:
                                          (context, StateSetter setState) =>
                                              Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircleColorPicker(
                                              controller: _controller,
                                              // initialColor: Colors.blue,
                                              onChanged: (color) {
                                                setState(() {
                                                  _controller.color = color;
                                                  newColor = color;
                                                });
                                              },
                                              size: const Size(240, 240),
                                              strokeWidth: 4,
                                              thumbSize: 36,
                                            ),
                                            TextButton(
                                              child: Text("Clear"),
                                              onPressed: () =>
                                                  currentColor2 = null,
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                            print(newColor);
                            setState(() {
                              currentColor2 = newColor;
                            });
                          },
                          child: (currentColor2 == null)
                              ? Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Icon(Icons.add))
                              : Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentColor2)),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Color? newColor;

                            await showModalBottomSheet(
                                backgroundColor: Theme.of(context).accentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                context: context,
                                builder: (context) => StatefulBuilder(
                                      builder:
                                          (context, StateSetter setState) =>
                                              Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircleColorPicker(
                                              controller: _controller,
                                              // initialColor: Colors.blue,
                                              onChanged: (color) {
                                                setState(() {
                                                  _controller.color = color;
                                                  newColor = color;
                                                });
                                              },
                                              size: const Size(240, 240),
                                              strokeWidth: 4,
                                              thumbSize: 36,
                                            ),
                                            TextButton(
                                              child: Text("Clear"),
                                              onPressed: () =>
                                                  currentColor3 = null,
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                            print(newColor);
                            setState(() {
                              currentColor3 = newColor;
                            });

                            // showDialog(
                            //   context: context,
                            //   builder: (context) => AlertDialog(
                            //     title: const Text('Pick a color!'),
                            //     content: SingleChildScrollView(
                            //         child: CircleColorPicker(
                            //       controller: _controller,
                            //       // initialColor: Colors.blue,
                            //       onChanged: (color) {
                            //         setState(() {
                            //           _controller.color = color;
                            //           currentColor3 = color;
                            //         });
                            //       },
                            //       size: const Size(240, 240),
                            //       strokeWidth: 4,
                            //       thumbSize: 36,
                            //     )),
                            //   ),
                            // );
                          },
                          child: (currentColor3 == null)
                              ? Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Icon(Icons.add))
                              : Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentColor3)),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Color? newColor;

                            await showModalBottomSheet(
                                backgroundColor: Theme.of(context).accentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                context: context,
                                builder: (context) => StatefulBuilder(
                                      builder:
                                          (context, StateSetter setState) =>
                                              Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircleColorPicker(
                                              controller: _controller,
                                              // initialColor: Colors.blue,
                                              onChanged: (color) {
                                                setState(() {
                                                  _controller.color = color;
                                                  newColor = color;
                                                });
                                              },
                                              size: const Size(240, 240),
                                              strokeWidth: 4,
                                              thumbSize: 36,
                                            ),
                                            TextButton(
                                              child: Text("Clear"),
                                              onPressed: () =>
                                                  currentColor4 = null,
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                            print(newColor);
                            setState(() {
                              currentColor4 = newColor;
                            });
                          },
                          child: (currentColor4 == null)
                              ? Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Icon(Icons.add))
                              : Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentColor4)),
                        ),
                      ]),
                ),
                SizedBox(height: 25),
                Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 60,
                    child: OutlinedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)))),
                      child: Text(
                        "Avançar",
                        style: TextStyle(
                            fontSize: 30,
                            foreground: Paint()
                              ..shader = LinearGradient(
                                colors: <Color>[
                                  Color(0xffBE2A2C),
                                  Color(0xffDD5429),
                                  Color(0xffF27127),
                                  Color(0xffE76228),
                                  Color(0xffBE2A2C)
                                ],
                              ).createShader(
                                  Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
                      ),
                      onPressed: () {
                        var produto = {};
                        Map<String, Color> cores = {};
                        if (currentColor != null) {
                          cores['primeira'] = (currentColor!);
                        }
                        if (currentColor2 != null) {
                          cores['segunda'] = (currentColor2!);
                        }
                        if (currentColor3 != null) {
                          cores['terceira'] = (currentColor3!);
                        }
                        if (currentColor4 != null) {
                          cores['quarta'] = (currentColor4!);
                        }
                        if (_formProduto.currentState!.validate()) {
                          if (nome.text.trim() != "") {
                            produto['nome'] = nome.text;
                          }
                          if (marca.text.trim() != "") {
                            produto['marca'] = marca.text;
                          }
                          if (genero.text.trim() != "") {
                            produto['genero'] = genero.text;
                          }
                          produto['cores'] = cores;
                          produtoProvider.adiciona(produto);
                          produtoProvider.changeIndex(2);
                          // Navigator.pop(context, produto);

                          // Navigator.push(
                          //     context,
                          //     EnterExitRoute(
                          //         exitPage: SegundaProduto(
                          //           passa: (int){}
                          //             // produtoSendoCadastrado: produto,
                          //             ),
                          //         enterPage: TerceiraProduto(
                          //             // produtoSendoCadastrado: produto,
                          //             )));
                        }

                        print(produtoProvider.cadastrando);
                      },
                    ))
              ]),
            ],
          ))
    ]));
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(50))),
      child: Text(
        "Cadastrar Produto",
        style: TextStyle(
            fontSize: 30,
            foreground: Paint()
              ..shader = LinearGradient(
                colors: <Color>[
                  Color(0xffBE2A2C),
                  Color(0xffDD5429),
                  Color(0xffF27127),
                  Color(0xffE76228),
                  Color(0xffBE2A2C)
                ],
              ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
      ),
    );
  }
}
