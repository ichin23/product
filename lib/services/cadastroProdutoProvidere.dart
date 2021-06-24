import 'package:flutter/material.dart';
import 'package:product/services/produto.dart';

class ProdutoCadastro extends ChangeNotifier {
  int indexCadastro = 0;
  Map? cadastrando;
  Produto? produtoCadastrando;

  void changeIndex(int newIndex) {
    indexCadastro = newIndex;
    notifyListeners();
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
    List<dynamic>? cores,
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
    cadastrando = {
      'categorias': newproduct.categorias,
      'nome': newproduct.name,
      'price': newproduct.price,
      'descricao': newproduct.description,
      'peso': newproduct.peso,
      'dimensoes': newproduct.dimensoes,
      'estoque': newproduct.estoque,
      'coresList': newproduct.cores,
      'genero': newproduct.genero,
      'marca': newproduct.marca,
      'vendedorID': "FirebaseAuth.instance.currentUser!.uid",
      'urlsImages': newproduct.imageURL,
    };
    notifyListeners();
  }

  void clear() {
    cadastrando = null;
    indexCadastro = 0;
    notifyListeners();
  }
}
