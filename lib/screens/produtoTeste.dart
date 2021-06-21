import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:product/screens/preco.dart';
import 'package:product/screens/primeiraProduto.dart';
import 'package:product/screens/quartaProduto.dart';
import 'package:product/screens/segundaProduto.dart';
import 'package:product/screens/terceiraProduto.dart';
import 'package:product/services/cadastroProdutoProvidere.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProdutoPage extends StatefulWidget {
  ProdutoPage({Key? key}) : super(key: key);

  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  List productScreens = [
    EditPage(),
    SegundaProduto(),
    TerceiraProduto(),
    PrecoPage(),
    QuartaProduto()
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<ProdutoCadastro>(
      builder: (context, produtoProvider, _) => Scaffold(
          appBar: AppBar(
            toolbarHeight: 120,
            backgroundColor: const Color(0XFF0D0D0D),
            title: AutoSizeText('Anunciar Produto',
                maxLines: 1,
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: const Radius.circular(70.0))),
          ),
          body: Container(
              child: (produtoProvider.produtoCadastrando == null)
                  ? productScreens[produtoProvider.indexCadastro]
                  : Center(
                      child: Column(
                      children: [
                        TextButton(
                            child: Text("Limpa"),
                            onPressed: () {
                              // produtoProvider.changeIndex(1);
                              // produtoProvider.clear();
                            }),
                        Text("Hello"),
                      ],
                    )))),
    );
  }
}
