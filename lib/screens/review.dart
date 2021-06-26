import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:product/services/cadastroProdutoProvidere.dart';
import 'package:product/services/firestore.dart';
import 'package:provider/provider.dart';

class ReviewPage extends StatefulWidget {
  ReviewPage({Key? key}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  PageController _pageController = PageController();
  PageController _fotosController = PageController();
  int _currentPage = 0;
  int _fotosPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (next != _currentPage) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    _fotosController.addListener(() {
      int next = _fotosController.page!.round();
      if (next != _fotosPage) {
        setState(() {
          _fotosPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final produtoProvider = Provider.of<ProdutoCadastro>(context);
    final produtoReview = produtoProvider.cadastrando;

    List<File> imageFiles = produtoReview!['files'];
    List<String> urls = [];
    Future enviaFotos() async {
      for (var foto in imageFiles) {
        String? url = await uploadFile(foto);
        if (url != null) {
          urls.add(url);
        }
      }
      print(urls);

      produtoProvider.adiciona({'imageURL': urls});

      addProduct(produtoProvider.cadastrando!);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(children: [
                Container(
                  alignment: Alignment.topLeft,
                  height: 50,
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () => produtoProvider.changeIndex(4),
                    child: Container(
                      // decoration: BoxDecoration(
                      //     shape: BoxShape.circle,
                      //     border: Border.all(color: Colors.black, width: 3)),
                      child: Icon(Icons.arrow_back, size: 40),
                    ),
                  ),
                ),
              ])),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF2E8C9),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 2,
                            offset: Offset(2.5, 5))
                      ],
                    ),
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(produtoReview['nome'])),
                SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Colors.black54,
                    //       blurRadius: 1,
                    //       offset: Offset(5, 2.5))
                    // ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 300,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: PageView(controller: _pageController,
                      // onPageChanged: (index) {
                      //   int next = _pageController.page!.round();
                      //   print(next);
                      //   setState(() {
                      //     if (pageAtual != next) {
                      //       setState(() {
                      //         pageAtual = next;
                      //       });
                      //     }
                      //   });
                      // },
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF2E8C9),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 2,
                                      offset: Offset(2.5, 5))
                                ],
                              ),
                              alignment: Alignment.center,
                              height: 200,
                              width: 200,
                              child: Stack(children: [
                                Positioned(
                                    top: 15,
                                    left: 25,
                                    child: Text(
                                        "${_fotosPage + 1}/${imageFiles.length}")),
                                Container(
                                  alignment: Alignment.center,
                                  child: PageView.builder(
                                    controller: _fotosController,
                                    itemCount: imageFiles.length,
                                    itemBuilder: (context, i) => Container(
                                      alignment: Alignment.center,
                                      child: Image.file(imageFiles[i],
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ])),
                        ),
                        PageView(
                          children: [
                            InkWell(
                              onTap: () {
                                print(produtoReview['cores']);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Container(
                                  color: Color(0xFFF2E8C9),
                                  padding: EdgeInsets.all(15),
                                  height: 200,
                                  alignment: Alignment.topLeft,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text("Cores: "),
                                                Container(
                                                  height: 60,
                                                  width: 150,
                                                  child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: produtoReview[
                                                              'cores']
                                                          .values
                                                          .toList()
                                                          .length,
                                                      itemBuilder: (context, i) => Container(
                                                          width: 50,
                                                          height: 50,
                                                          decoration: BoxDecoration(
                                                              color: produtoReview[
                                                                      'cores']
                                                                  .values
                                                                  .toList()[i],
                                                              shape: BoxShape
                                                                  .circle))),
                                                )
                                              ],
                                            ),
                                            Text(
                                              "Marca: ${produtoReview['marca']}",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              "Peso: ${produtoReview['peso']}",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "Dimensões: ",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Container(
                                              width: 200,
                                              height: 70,
                                              margin: EdgeInsets.only(left: 15),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "Comprimento: ${produtoReview['dimensoes'][0]}cm "),
                                                  Text(
                                                      "Largura: ${produtoReview['dimensoes'][1]}cm "),
                                                  Text(
                                                      "Altura:  ${produtoReview['dimensoes'][2]}cm "),
                                                ],
                                              ),
                                            )
                                          ]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Container(
                                  padding: EdgeInsets.all(20),
                                  height: 200,
                                  width: 200,
                                  color: Color(0xFFF2E8C9),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Descrição: ",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700)),
                                        SingleChildScrollView(
                                          child: Text(
                                              produtoReview['descricao'],
                                              style: TextStyle(fontSize: 15),
                                              textAlign: TextAlign.start),
                                        ),
                                      ])),
                            ),
                          ],
                        )
                      ]),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 2,
                                  offset: Offset(2.5, 5))
                            ],
                            color: Color(0xFFF2E8C9),
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                            "R\$${produtoReview['price'].toStringAsFixed(2)}",
                            style: TextStyle(fontWeight: FontWeight.w700))),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 2,
                                  offset: Offset(2.5, 5))
                            ],
                            color: Color(0xFFF2E8C9),
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                            "${produtoReview['estoque'].toString()} disponíveis"))
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 2,
                            offset: Offset(2.5, 5))
                      ],
                      color: Color(0xFFF2E8C9),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            child: TextButton(
                                child: AutoSizeText("Detalhes",
                                    minFontSize: 15,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.black,
                                        decorationColor:
                                            Theme.of(context).accentColor,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        decoration: (_currentPage == 0)
                                            ? TextDecoration.underline
                                            : TextDecoration.none)),
                                onPressed: () {
                                  _pageController.animateToPage(0,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                })),
                        Container(
                            child: TextButton(
                                child: AutoSizeText("Mais Informações",
                                    minFontSize: 15,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.black,
                                        decorationColor:
                                            Theme.of(context).accentColor,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        decoration: (_currentPage == 1)
                                            ? TextDecoration.underline
                                            : TextDecoration.none)),
                                onPressed: () {
                                  setState(() {
                                    _pageController.animateToPage(1,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInQuart);
                                  });
                                }))
                      ]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0XFF0D0D0D)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                )),
            onPressed: () {
              enviaFotos().then((value) {
                produtoProvider.clear();
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                            title: Text("Produto Cadastrado"),
                            content: Text("Produto cadastrado com sucesso"),
                            actions: [
                              TextButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                              )
                            ]));
                //AlertDialog()
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text("Postar",
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
                      ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                    fontSize: 30,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
