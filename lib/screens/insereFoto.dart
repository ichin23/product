import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product/services/firestore.dart';

class InsereFoto extends StatefulWidget {
  InsereFoto({Key? key}) : super(key: key);

  @override
  _InsereFotoState createState() => _InsereFotoState();
}

class _InsereFotoState extends State<InsereFoto> {
  File? file;
  ImagePicker picker = ImagePicker();

  void imageSelect() async {
    final image = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      setState(() {
        file = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Insira foto")),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              imageSelect();
              print(file);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                  height: 100,
                  width: 100,
                  child: file == null
                      ? Icon(Icons.add, color: Colors.black)
                      : Image.file(file!, fit: BoxFit.cover),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  )),
            ),
          ),
          TextButton(
              onPressed: () {
                print(file);
              },
              child: Text("Mostra")),
          TextButton(
              onPressed: () {
                if (file != null) {
                  uploadFotoProfile(file!);
                }
              },
              child: Text("Envia")),
          TextButton(
              onPressed: () {
                setState(() {
                  file = null;
                });
              },
              child: Text("Remove")),
        ],
      ),
    );
  }
}
