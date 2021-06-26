import 'package:flutter/material.dart';
import 'package:product/screens/components/customField.dart';
import 'package:product/services/cadastroProdutoProvidere.dart';
import 'package:provider/provider.dart';

class PrecoPage extends StatefulWidget {
  PrecoPage({Key? key}) : super(key: key);

  @override
  _PrecoPageState createState() => _PrecoPageState();
}

class _PrecoPageState extends State<PrecoPage> {
  TextEditingController price = TextEditingController();
  TextEditingController estoque = TextEditingController();

  @override
  void initState() {
    super.initState();
    final produtoProvider =
        Provider.of<ProdutoCadastro>(context, listen: false);
    if (produtoProvider.cadastrando != null) {
      if (produtoProvider.cadastrando!.containsKey('price')) {
        price.text = produtoProvider.cadastrando!['price'].toStringAsFixed(2);
      }
      if (produtoProvider.cadastrando!.containsKey('estoque')) {
        estoque.text =
            produtoProvider.cadastrando!['estoque'].toStringAsFixed(2);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final produtoProvider = Provider.of<ProdutoCadastro>(context);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 15),
                    child: GestureDetector(
                      onTap: () => produtoProvider.changeIndex(2),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 3)),
                        child: Icon(Icons.arrow_back, size: 40),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.7,
              child: CustomField(
                prefixLabel: "R\$",
                label: ' Price ',
                controller: price,
                maxLines: 1,
                textType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.7,
              child: CustomField(
                label: ' Estoque ',
                sufixLabel: 'unidades',
                controller: estoque,
                maxLines: 1,
                textType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
                width: MediaQuery.of(context).size.width - 80,
                height: 60,
                child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
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
                          ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
                  ),
                  onPressed: () {
                    produtoProvider.adiciona({
                      'price': double.parse(price.text),
                      'estoque': int.parse(estoque.text),
                    });
                    print(produtoProvider.cadastrando);
                    produtoProvider.changeIndex(4);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
