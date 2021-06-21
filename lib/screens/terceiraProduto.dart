import 'package:flutter/material.dart';
import 'package:product/screens/exitEnterAnimation.dart';
import 'package:product/services/cadastroProdutoProvidere.dart';
import 'package:provider/provider.dart';

import 'components/customField.dart';
import 'quartaProduto.dart';

class TerceiraProduto extends StatefulWidget {
  // Map<String, dynamic> produtoSendoCadastrado = {};
  // TerceiraProduto({Key? key, required this.produtoSendoCadastrado})
  //     : super(key: key);

  @override
  _TerceiraProdutoState createState() => _TerceiraProdutoState();
}

class _TerceiraProdutoState extends State<TerceiraProduto> {
  TextEditingController peso = TextEditingController();
  TextEditingController dimensao1 = TextEditingController();
  TextEditingController dimensao2 = TextEditingController();
  TextEditingController descricao = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    final produtoProvider =
        Provider.of<ProdutoCadastro>(context, listen: false);
    if (produtoProvider.cadastrando != null) {
      if (produtoProvider.cadastrando!.containsKey('peso')) {
        peso.text = produtoProvider.cadastrando!['peso'].toString();
      }
      if (produtoProvider.cadastrando!.containsKey('dimensoes')) {
        dimensao1.text =
            produtoProvider.cadastrando!['dimensoes'][0].toString();
        dimensao2.text =
            produtoProvider.cadastrando!['dimensoes'][1].toString();
      }
      if (produtoProvider.cadastrando!.containsKey('descricao')) {
        descricao.text = produtoProvider.cadastrando!['descricao'];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final produtoProvider = Provider.of<ProdutoCadastro>(context);
    return Container(
        child: Form(
            key: _form,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          height: 50,
                          width: double.infinity,
                          child: GestureDetector(
                            onTap: () => produtoProvider.changeIndex(1),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.black, width: 3)),
                              child: Icon(Icons.arrow_back, size: 40),
                            ),
                          ),
                        ),
                        Text(
                          "Peso",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        CustomField(
                          textType: TextInputType.numberWithOptions(),
                          help: false,
                          controller: peso,
                          maxLines: 1,
                          validator: (value) {
                            if (value == null) {
                              value = "";
                              peso.text = "";
                            }
                            if (value.trim() == "") {
                              return "Digite um peso!";
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "Dimensão",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                // margin: EdgeInsets.symmetric(horizontal: 40),
                                width:
                                    (MediaQuery.of(context).size.width * 0.8 -
                                            64) /
                                        2,
                                child: CustomField(
                                  textType: TextInputType.numberWithOptions(),
                                  maxLines: 1,
                                  help: false,
                                  controller: dimensao1,
                                  validator: (value) {
                                    if (value == null) {
                                      value = "";
                                      dimensao1.text = "";
                                    }
                                    if (value.trim() == "") {
                                      return "Digite uma Largura!";
                                    }
                                  },
                                )),
                            Text(
                              "X",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            Container(
                                width:
                                    (MediaQuery.of(context).size.width * 0.8 -
                                            64) /
                                        2,
                                child: CustomField(
                                  textType: TextInputType.numberWithOptions(),
                                  maxLines: 1,
                                  help: false,
                                  controller: dimensao2,
                                  validator: (value) {
                                    if (value == null) {
                                      value = "";
                                      dimensao2.text = "";
                                    }
                                    if (value.trim() == "") {
                                      return "Digite um comprimento!";
                                    }
                                  },
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "Descricao",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Container(
                          child: Container(
                            height: 10 * 24,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: CustomField(
                              help: false,
                              controller: descricao,
                              minLines: 2,
                              maxLines: null,
                              textType: TextInputType.multiline,
                              validator: (value) {
                                if (value == null) {
                                  descricao.text = "";
                                }
                                if (value!.trim() == "") {
                                  return "Digite uma descrição!";
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
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
                          Map produtoSendoCadastrado = {};
                          List<double> dimensao = [];
                          if (_form.currentState!.validate()) {
                            if (peso.text.trim() != "") {
                              produtoSendoCadastrado['peso'] =
                                  double.parse(peso.text);
                            }
                            if (dimensao1.text.trim() != "") {
                              dimensao.add(double.parse(dimensao1.text));
                            }
                            if (dimensao2.text.trim() != "") {
                              dimensao.add(double.parse(dimensao2.text));
                            }
                            if (descricao.text.trim() != "") {
                              produtoSendoCadastrado['descricao'] =
                                  descricao.text;
                            }
                            produtoSendoCadastrado['dimensoes'] = dimensao;
                            produtoProvider.adiciona(produtoSendoCadastrado);

                            produtoProvider.changeIndex(3);
                            // Navigator.push(
                            //     context,
                            //     EnterExitRoute(
                            //         exitPage: TerceiraProduto(
                            //             // produtoSendoCadastrado:
                            //             //     widget.produtoSendoCadastrado
                            //             ),
                            // enterPage: QuartaProduto(
                            //             // produtoSendoCadastrado:
                            //             //     widget.produtoSendoCadastrado,
                            //             )));
                          }

                          print(produtoProvider.cadastrando);
                        },
                      ))
                ]),
              ),
            )));
  }
}
