import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product/services/firestore.dart';
import 'package:product/services/produto.dart';
import 'package:product/services/storage.dart';
import '';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Produto?;
    return Formulario(
      args: args,
    );
  }
}

class Formulario extends StatefulWidget {
  final Produto? args;
  Formulario({Key? key, this.args}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController nome = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Produto? args = widget.args;

    if (args != null) {
      nome.text = args.name;
      price.text = args.price.toString();
      description.text = args.description;
    }
    List<PickedFile> pickedImages = [];
    File? file;
    ImagePicker picker = ImagePicker();

    void imageSelect() async {
      final image = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        if (image != null) {
          file = File(image.path);
        }
      });
    }

    void imageSelectCamera() async {
      final image = await picker.getImage(source: ImageSource.camera);
      setState(() {
        if (image != null) {
          file = File(image.path);
        }
      });
    }

    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () => Navigator.pushNamed(context, '/camera'),
          )
        ]),
        body: SafeArea(
          child: Form(
              key: form,
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                        controller: nome,
                        decoration: InputDecoration(labelText: "Nome:")),
                    TextFormField(
                        controller: price,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: "Preço:")),
                    TextFormField(
                        controller: description,
                        decoration: InputDecoration(labelText: "Descrição:")),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Imagem: "),
                          GestureDetector(
                            onTap: () => showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      child: ListView(
                                        children: [
                                          Text(
                                            "De onde pegar a foto?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                          ListTile(
                                              onTap: () async {
                                                PickedFile? file =
                                                    await picker.getImage(
                                                        source: ImageSource
                                                            .gallery);
                                                setState(() {
                                                  if (file != null) {
                                                    pickedImages.add(file);
                                                    // print(pickedImages);
                                                  }
                                                });
                                                final LostData response =
                                                    await picker.getLostData();

                                                if (response.file != null) {
                                                  setState(() {
                                                    print(response.file!.path);
                                                  });
                                                }
                                              },
                                              title: Text(
                                                "Galeria",
                                                textAlign: TextAlign.center,
                                              )),
                                          ListTile(
                                            onTap: () {},
                                            title: Text(
                                              "Câmera",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ));
                                }),
                            child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(),
                                child: Text("Fotos")),
                          )
                        ]),
                    TextButton(child: Text("Salvar"), onPressed: () {}
                        // => getImage(Produto(
                        //     name: nome.text,
                        //     price: double.parse(price.text),
                        //     description: description.text,
                        //     vendedorID: FirebaseAuth.instance.currentUser!.uid))
                        ),
                    file != null ? Image.file(file!) : Text("Select Image")
                  ],
                ),
              )),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 1,
              onPressed: imageSelect,
              child: Icon(Icons.photo_library),
            ),
            SizedBox(
              height: 15,
            ),
            FloatingActionButton(
              heroTag: 2,
              onPressed: imageSelectCamera,
              child: Icon(Icons.photo_camera),
            ),
            FloatingActionButton(
              heroTag: 3,
              onPressed: () => print(file),
              child: Icon(Icons.photo_camera),
            ),
          ],
        ));
  }
}
