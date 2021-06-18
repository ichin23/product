import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'produto.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

CollectionReference produtos = firestore.collection('produtos');

Future<void> addProduct(Produto product) async {
  produtos
      .add({
        'categorias': product.categorias,
        'nome': product.name,
        'price': product.price,
        'description': product.description,
        'cores': product.cores,
        'genero': product.genero,
        'marca': product.marca,
        'vendedorID': FirebaseAuth.instance.currentUser!.uid,
        'imageURL': product.imageURL,
      })
      .then((value) => print("Produto adicionado"))
      .catchError((error) {
        return error;
      });
}

Future<List<Produto>?> getProdutos() async {
  List<QueryDocumentSnapshot> dados =
      await produtos.get().then((value) => value.docs);

  List<Produto> produto = [];

  for (var item in dados) {
    Map? data = item.data() as Map<String, dynamic>;

    produto.add(Produto(
        categorias: data['categorias'],
        name: data['nome'],
        productID: item.id,
        price: data['price'],
        description: data['description'],
        vendedorID: data['vendedorID'],
        imageURL: data['imageURL'].map((e) => e as String).toList(),
        genero: data['genero'],
        marca: data['marca']));
  }
  print(produto);
  return produto;
}

Future<Produto?> searchProduto(String ref) async {
  DocumentSnapshot produto = await produtos.doc(ref).get();

  final data = produto.data() as Map<String, dynamic>;

  print(data);
  // getProduto(nome: data['nome'], description: description, vendedorID: vendedorID, productID: produto.id, price: price, imageURL: imageURL)
}
