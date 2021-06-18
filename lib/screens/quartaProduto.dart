import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product/services/firestore.dart';
import 'package:product/services/produto.dart';
import 'package:product/services/storage.dart';

class QuartaProduto extends StatefulWidget {
  Map<String, dynamic> produtoSendoCadastrado;
  QuartaProduto({Key? key, required this.produtoSendoCadastrado})
      : super(key: key);

  @override
  _QuartaProdutoState createState() => _QuartaProdutoState();
}

class _QuartaProdutoState extends State<QuartaProduto> {
  File? file;
  List<File> varios = [];
  ImagePicker picker = ImagePicker();

  void imageSelect() async {
    final image = await picker.getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (image != null) {
        file = File(image.path);
        varios.add(File(image.path));
      }
    });
  }

  void imageSelectCamera() async {
    final image = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        file = File(image.path);
        varios.add(File(image.path));
      }
    });
  }

  List<String> urls = [];
  Future enviaFotos() async {
    for (var foto in varios) {
      String? url = await uploadFile(foto);
      if (url != null) {
        urls.add(url);
      }
    }
    print(urls);
    addProduct(Produto(
      categorias: widget.produtoSendoCadastrado['categorias'],
      name: widget.produtoSendoCadastrado['nome'],
      marca: widget.produtoSendoCadastrado['marca'],
      genero: widget.produtoSendoCadastrado['genero'],
      cores: widget.produtoSendoCadastrado['cores'],
      description: widget.produtoSendoCadastrado['descricao'],
      price: 22,
      imageURL: urls,
      vendedorID: FirebaseAuth.instance.currentUser!.uid,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: const Color(0XFF0D0D0D),
        title: Text('Anunciar Produto',
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
              fontSize: 25,
            )),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.only(bottomRight: const Radius.circular(70.0))),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Stack(
                children: [
                  Positioned(
                      top: ((MediaQuery.of(context).size.height * 0.4) - 250) /
                          2,
                      left: (MediaQuery.of(context).size.width - 250) / 2,
                      child: Container(
                        width: 250,
                        height: 250,
                        child: Image.network(
                            "https://firebasestorage.googleapis.com/v0/b/testeflutter-4d2cf.appspot.com/o/projeto%2FuploadImages.png?alt=media&token=451aa6d0-5e8b-4145-a985-0e02f9994dbc"),
                      )),
                  Positioned(
                      top: 15,
                      left: 15,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.black, width: 3)),
                          child: Icon(Icons.arrow_back, size: 40),
                        ),
                      )),
                  Positioned(
                    top: 20,
                    right: 30,
                    child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 3))),
                  ),
                  Positioned(
                    top: 125,
                    left: -30,
                    child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 3))),
                  ),
                  Positioned(
                    top: 250,
                    right: -20,
                    child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 3))),
                  ),
                ],
              ),
            ),
            Text("Bora tirar umas fotos maneiras?",
                style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
            SizedBox(height: 20),
            GestureDetector(
              onDoubleTap: () => print(varios),
              onTap: () => showModalBottomSheet(
                backgroundColor: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                context: context,
                builder: (context) => StatefulBuilder(
                  builder: (context, StateSetter setState) => Container(
                      padding: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width * 0.9,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: ListView(
                              children: [
                                ListTile(
                                  onTap: () async {
                                    final image = await picker.getImage(
                                      source: ImageSource.gallery,
                                    );
                                    setState(() {
                                      if (image != null) {
                                        file = File(image.path);
                                        varios.add(File(image.path));
                                      }
                                    });
                                  },
                                  title: Container(
                                    padding: EdgeInsets.only(bottom: 5, top: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      "Galeria",
                                      style: TextStyle(fontSize: 25),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  onTap: () async {
                                    final image = await picker.getImage(
                                        source: ImageSource.camera);
                                    setState(() {
                                      if (image != null) {
                                        file = File(image.path);
                                        varios.add(File(image.path));
                                      }
                                    });
                                  },
                                  title: Container(
                                    padding: EdgeInsets.only(bottom: 5, top: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      "Camera",
                                      style: TextStyle(fontSize: 25),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          (varios.length > 0)
                              ? Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: varios.length,
                                      itemBuilder: (context, i) => Container(
                                            margin: EdgeInsets.only(right: 5),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            child: Dismissible(
                                              key: ValueKey(varios[i].path),
                                              background: Container(
                                                color: Theme.of(context)
                                                    .errorColor,
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.white,
                                                  size: 40,
                                                ),
                                                alignment: Alignment.center,
                                              ),
                                              direction:
                                                  DismissDirection.vertical,
                                              onDismissed: (direction) {
                                                setState(() {
                                                  varios.removeAt(i);
                                                });
                                              },
                                              child: Image.file(varios[i],
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.2),
                                            ),
                                          )),
                                )
                              : Container(child: Text("Sem fotos adicionadas")),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                  onTap: () async {
                                    if (varios.length != 0) {
                                      try {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                content:
                                                    CircularProgressIndicator()));
                                        await enviaFotos().then((value) {
                                          showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                  title: Text(
                                                      "Produto cadastrado!"),
                                                  content: Text(
                                                      "Seu produto foi cadastrado e já deve estar sendo mostrado")));
                                        });
                                      } catch (error) {
                                        print(error);
                                      }
                                      ;
                                    }
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black),
                                      child: Icon(
                                        Icons.navigate_next,
                                        size: 60,
                                        color: Theme.of(context).accentColor,
                                      ))),
                            ],
                          )
                        ],
                      )),
                ),
              ),
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(70)),
                  child: RadiantGradientMask(
                    child: Icon(
                      Icons.cloud_upload_outlined,
                      size: 250,
                      color: Colors.white,
                    ),
                  )
                  // IconButton(
                  //   icon: Icon(Icons.cloud_upload_outlined,
                  //       size: MediaQuery.of(context).size.width * 0.5),
                  //   onPressed: () {},
                  // ),
                  ),
            )
          ],
        )),
      ),
    );
  }
}

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: [
          Color(0xffBE2A2C),
          Color(0xffDD5429),
          Color(0xffF27127),
          Color(0xffE76228),
          Color(0xffBE2A2C),
        ],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
