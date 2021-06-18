import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:product/services/firestore.dart';
import 'package:product/services/produto.dart';

FirebaseStorage storage = FirebaseStorage.instance;

Future<String?> uploadFile(File _image) async {
  String name = _image.path.split("/").last;
  String user = FirebaseAuth.instance.currentUser!.uid;
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
  // addProduct(Produto(
  //   name: produto.name,
  //   description: produto.description,
  //   price: produto.price,
  //   imageURL: url,
  //   vendedorID: produto.vendedorID,
  // ));
}

Future<void> saveImages(List<File> _images, CollectionReference ref) async {
  _images.forEach((image) async {
    // String imageURL = await uploadFile(image);
    // ref.update({"images": imageURL});
  });
}
