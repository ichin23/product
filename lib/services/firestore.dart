import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'produto.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

CollectionReference produtos = firestore.collection('produtos');

Future<void> addProduct(Map product) async {
  print("Chegou");
  produtos
      .add({
        'categorias': product['categorias'],
        'nome': product['nome'],
        'price': product['price'],
        'description': product['descricao'],
        'peso': product['peso'],
        'dimensoes': product['dimensoes'],
        'estoque': product['estoque'],
        'cores': product['cores']!
            .map((key, value) => MapEntry(key, value.toString())),
        'genero': product['genero'],
        'marca': product['marca'],
        'vendedorID': "FirebaseAuth.instance.currentUser!.uid",
        'imageURL': product['imageURL'],
      })
      .then((value) => print("Produto adicionado"))
      .catchError((error) {
        print(error);
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
        cores: data['cores'].values.toList().map((e) {
          String corHex =
              e.toString().replaceAll("Color(", '').replaceAll(")", '');
          int codigo = int.parse(corHex);
          print(Color(codigo));
          return Color(codigo);
        }).toList(),
        imageURL: data['imageURL'].map((e) => e as String).toList(),
        genero: data['genero'],
        marca: data['marca'],
        dimensoes: data['dimensoes'].map((e) => e as double).toList(),
        estoque: data['estoque'],
        peso: data['peso']));
  }
  print(produto.toString());
  return produto;
}

Future<Produto?> searchProduto(String ref) async {
  DocumentSnapshot produto = await produtos.doc(ref).get();

  final data = produto.data() as Map<String, dynamic>;

  print(data);
  // getProduto(nome: data['nome'], description: description, vendedorID: vendedorID, productID: produto.id, price: price, imageURL: imageURL)
}

Future<void> delete(String id) async {
  produtos.doc(id).delete();
}

Future<void> addImageProfile(String url) async {
  auth.currentUser!.updatePhotoURL(url);
}

Future<String?>? getImageProfile() async {
  return auth.currentUser!.photoURL;
}

//Storage
FirebaseStorage storage = FirebaseStorage.instance;

Future<String?> uploadFile(File _image) async {
  String name = _image.path.split("/").last;
  String user = '1234';
  Reference storageReference =
      FirebaseStorage.instance.ref().child('images/$user/$name');
  UploadTask uploadTask = storageReference.putFile(_image);
  String? url;
  await uploadTask.whenComplete(() async {
    print('File Uploaded');

    await storageReference.getDownloadURL().then((fileURL) {
      url = fileURL;
    });
  });
  return url;
}

Future<String?> uploadFotoProfile(File _image) async {
  String name = _image.path.split("/").last;
  String user = '1234';
  Reference storageReference =
      FirebaseStorage.instance.ref().child('images/$user/profile/$name');
  UploadTask uploadTask = storageReference.putFile(_image);
  String? url;
  await uploadTask.whenComplete(() async {
    print('File Uploaded');

    await storageReference.getDownloadURL().then((fileURL) {
      url = fileURL;
    });
  });
  if (url != null) {
    addImageProfile(url!);
  }
  return url;
}

Future<void> removeImage() async {
  auth.currentUser!.updatePhotoURL(null);
}
