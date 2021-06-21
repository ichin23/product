import 'package:flutter/material.dart';
import 'package:product/services/produto.dart';
import 'package:provider/provider.dart';

class ProdutoCadastro extends ChangeNotifier {
  int indexCadastro = 0;
  Map? cadastrando;
  Produto? produtoCadastrando;

  void changeIndex(int newIndex) {
    indexCadastro = newIndex;
    notifyListeners();
  }

  void clean() {
    cadastrando = null;
  }

  void get(
    String name,
    double price,
    String description,
    String? productID,
    String vendedorID,
    List<dynamic> imageURL,
    String genero,
    int estoque,
    double peso,
    List<double> dimensoes,
    String? marca,
    Map<String, Color>? cores,
    List<dynamic> categorias,
  ) {
    produtoCadastrando = Produto(
      categorias: categorias,
      description: description,
      genero: genero,
      marca: marca,
      name: name,
      price: price,
      vendedorID: vendedorID,
      cores: cores,
      imageURL: imageURL,
      productID: productID,
      dimensoes: [],
      estoque: estoque,
      peso: 3,
    );
    notifyListeners();
  }

  void adiciona(Map adicionar) {
    cadastrando != null
        ? cadastrando!.length == 0
            ? cadastrando = adicionar
            : cadastrando = {...cadastrando!, ...adicionar}
        : cadastrando = adicionar;
    print(cadastrando);
    notifyListeners();
  }

  void addProduct(Produto newproduct) {
    produtoCadastrando = newproduct;
  }

  void clear() {
    produtoCadastrando = null;

    notifyListeners();
  }
}
