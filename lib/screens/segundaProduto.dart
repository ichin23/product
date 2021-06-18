import 'package:flutter/material.dart';
import 'package:product/screens/components/customField.dart';
import 'package:product/screens/exitEnterAnimation.dart';
import 'package:product/screens/terceiraProduto.dart';

class SegundaProduto extends StatefulWidget {
  Map<String, dynamic> produtoSendoCadastrado;
  SegundaProduto({Key? key, required this.produtoSendoCadastrado})
      : super(key: key);

  @override
  _SegundaProdutoState createState() => _SegundaProdutoState();
}

class _SegundaProdutoState extends State<SegundaProduto> {
  TextEditingController nome = TextEditingController();
  TextEditingController marca = TextEditingController();
  TextEditingController genero = TextEditingController();
  GlobalKey<FormState> _formProduto = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 120,
            backgroundColor: const Color(0XFF0D0D0D),
            title: Text('Anunciar Produto',
                style: TextStyle(
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
            // leading: Container(),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: const Radius.circular(70.0))),
          ),
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                // CustomAppBar(),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          SizedBox(height: 5),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            child: CustomField(
                              maxLines: 1,
                              help: false,
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          SizedBox(height: 5),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            child: CustomField(
                                maxLines: 1, help: false, controller: marca),
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
                              help: false,
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
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 30),
                          ),
                          SizedBox(height: 5),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white)),
                                  Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white)),
                                  Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white)),
                                  Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white)),
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
                                            borderRadius:
                                                BorderRadius.circular(30)))),
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
                                        ).createShader(Rect.fromLTWH(
                                            0.0, 0.0, 200.0, 70.0))),
                                ),
                                onPressed: () {
                                  var produto = widget.produtoSendoCadastrado;
                                  List<Colors> cores = [];
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
                                  }

                                  print(produto);
                                  Navigator.push(
                                      context,
                                      EnterExitRoute(
                                          exitPage: SegundaProduto(
                                            produtoSendoCadastrado: produto,
                                          ),
                                          enterPage: TerceiraProduto(
                                            produtoSendoCadastrado: produto,
                                          )));
                                },
                              ))
                        ]),
                      ],
                    ))
              ])))),
    );
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
