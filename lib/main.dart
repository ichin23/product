import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:product/screens/form.dart';
import 'package:product/screens/primeiraProduto.dart';
import 'package:product/screens/produtoTeste.dart';

import 'package:product/screens/review.dart';
import 'package:product/screens/slider.dart';
import 'package:product/services/cadastroProdutoProvidere.dart';
import 'package:product/services/firestore.dart';
import 'package:product/services/produto.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Provider.debugCheckInvalidValueType = null;

  runApp(
    ChangeNotifierProvider(
      create: (_) => ProdutoCadastro(),
      child: MaterialApp(
        routes: {
          '/': (context) => MyApp(),
          '/form': (context) => FormPage(),
          '/product': (context) => EditPage(),
          '/hero': (context) => HeroAnimation(),
          '/review': (context) => ReviewPage(),
          '/produtoTeste': (context) => ProdutoPage(),
        },
        theme: ThemeData(
          textTheme: GoogleFonts.bubblerOneTextTheme(),
          accentColor: Color(0xffF27127),
          backgroundColor: Color(0xffF27127),
          primaryColor: Color(0xffF27127),
          scaffoldBackgroundColor: Color(0xffF27127),
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  List<Widget> telas = [
    HomePage(),
    Builder(
      builder: (context) => Scaffold(
        body: Center(
            child: TextButton(
                child: Text("iR", style: TextStyle(fontSize: 40)),
                onPressed: () {
                  Navigator.of(context).pushNamed('/produtoTeste');
                })),
      ),
    ),
    Builder(
      builder: (context) => Scaffold(
        body: Center(
            child: TextButton(
                child: Text("ir", style: TextStyle(fontSize: 40)),
                onPressed: () {
                  Navigator.of(context).pushNamed('/produtoTeste');
                })),
      ),
    ),
    Builder(builder: (context) {
      return Scaffold(
          body: Center(
              child: TextButton(
                  child: Text("ir", style: TextStyle(fontSize: 40)),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/produtoTeste');
                  })));
    }),
  ];
  // child: Builder(
  //   builder: (context) => Scaffold(
  //     body: Center(
  //         child: TextButton(
  //             child: Text("ir"),
  //             onPressed: () {
  //               Navigator.of(context).pushNamed('/produtoTeste');
  //             })),
  // ),
  // ),

  void tabTapped(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(actions: [
      //   IconButton(
      //       onPressed: () => Navigator.pushNamed(context, "/register"),
      //       icon: Icon(Icons.login))
      // ]),
      body: telas[index],
      bottomNavigationBar: Container(
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              color: Colors.transparent),
          margin: EdgeInsets.only(bottom: 20, left: 15, right: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Container(
              height: 60,
              child: BottomNavigationBar(
                unselectedItemColor: Colors.black,
                selectedItemColor: Colors.black,
                showUnselectedLabels: true,
                iconSize: 24,
                enableFeedback: true,
                type: BottomNavigationBarType.fixed,
                elevation: 4,
                currentIndex: index,
                onTap: tabTapped,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: "Explorar"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.bookmark_border_outlined),
                      label: "Salvos"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.chat_bubble_outline),
                      label: "Conversas"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_bag_outlined),
                      label: "Pedidos"),
                ],
              ),
            ),
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            print(produtos);
            Navigator.pushNamed(
              context,
              '/hero',
            );
          },
          child: Icon(Icons.edit)),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width * 0.3;

    return FutureBuilder<List<Produto>?>(
        future: getProdutos(),
        builder: (context, projectSnap) {
          if (projectSnap.connectionState == ConnectionState.done) {
            final products = projectSnap.data;
            print(getProdutos());
            return (products != null)
                ? SafeArea(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Column(
                        children: [
                          Container(
                            height: size,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                              Color(0xffBE2A2C),
                                              Color(0xffDD5429),
                                              Color(0xffF27127),
                                              Color(0xffE76228),
                                              Color(0xffBE2A2C),
                                            ])),
                                        child: Image.network(
                                          "https://firebasestorage.googleapis.com/v0/b/testeflutter-4d2cf.appspot.com/o/projeto%2FlogoMercato.png?alt=media&token=1d441e6c-f4f6-479e-970a-17d445903c86",
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                        )),
                                  ),
                                ),
                                Text("mercato",
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
                                          ).createShader(Rect.fromLTWH(
                                              0.0, 0.0, 200.0, 70.0)),
                                        fontSize: 35)),
                                Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                        decoration:
                                            BoxDecoration(color: Colors.white),
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: Image.network(
                                              "https://firebasestorage.googleapis.com/v0/b/testeflutter-4d2cf.appspot.com/o/projeto%2Fperson.png?alt=media&token=a4fe7d35-ec8e-4f4e-a42d-bbc5b320678d"),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Container(
                                child: GridView.builder(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    itemCount: products.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10),
                                    itemBuilder: (ctx, i) => ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: GestureDetector(
                                            onTap: () {
                                              print(products[i].productID);
                                            },
                                            child: GridTile(
                                                header: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 5, top: 5),
                                                  child: Text(
                                                    "R\$${products[i].price.toString()}",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                child: Image.network(
                                                    products[i].imageURL[0],
                                                    fit: BoxFit.cover),
                                                footer: GridTileBar(
                                                  backgroundColor: Colors.black,
                                                  title: Text(products[i]
                                                      .name
                                                      .toString()),
                                                  leading: IconButton(
                                                    icon: Icon(Icons.edit),
                                                    onPressed: () =>
                                                        Navigator.pushNamed(
                                                            context, '/form',
                                                            arguments:
                                                                products[i]),
                                                  ),
                                                )),
                                          ),
                                        )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : SafeArea(
                    child: Container(),
                  );
          }
          if (projectSnap.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("Error"));
          }
        });
  }
}

class HeroAnimation extends StatefulWidget {
  @override
  _HeroAnimationState createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  List products = ['ola'];

  int i = 0;

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProdutoCadastro>(
          create: (_) => ProdutoCadastro(),
        )
      ],
      child: MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: const Text('Basic Hero Animation'),
        ),
        // body: Center(
        //     child: GestureDetector(
        //         child: Hero(
        //           tag: 'produto',
        //           child: Image.network(
        //               "https://firebasestorage.googleapis.com/v0/b/mercado-local-2b8c3.appspot.com/o/projeto%2FAnuncie%20seu%20produto.png?alt=media&token=875eec3e-b451-42d4-8dee-b0d8c64c8b07"),
        //         ),
        //         onTap: () {
        //           Navigator.of(context).push(PageRouteBuilder(
        //               transitionsBuilder: (context, a, a2, child) {
        //             return ScaleTransition(scale: a, child: child);
        //           }, pageBuilder: (BuildContext context, animation,
        //                   secondaryAnimation) {
        //             return Scaffold(
        //               appBar: AppBar(),
        //               body: Center(
        //                 child: GestureDetector(
        //                   onTap: () {
        //                     Navigator.of(context).pop();
        //                   },
        //                   child: Image.network(
        //                       "https://firebasestorage.googleapis.com/v0/b/mercado-local-2b8c3.appspot.com/o/projeto%2FAnuncie%20seu%20produto.png?alt=media&token=875eec3e-b451-42d4-8dee-b0d8c64c8b07"),
        //                 ),
        //               ),
        body: Builder(
          builder: (context) => Container(
              child: Center(
            child: Column(
              children: [
                Text(products[i]),
                TextButton(
                    onPressed: () async {
                      Provider.of<ProdutoCadastro>(context, listen: false)
                          .adiciona({'adicionar': 1});
                      // var text = await Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: (context) {
                      //   return TelaFoto();
                      // }));
                      // // products.add(text);
                      // setState(() {
                      //   i = 1;
                      // });
                    },
                    child: Text("IRRRRRR"))
              ],
            ),
          )),
        ),
      )),
    );
  }
}

class TelaFoto extends StatelessWidget {
  const TelaFoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flippers Page'),
      ),
      body: Container(
          // The blue background emphasizes that it's a new route.
          color: Colors.lightBlueAccent,
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.topLeft,
          child: Container(
            child: GestureDetector(
              child: Hero(
                tag: 'produto',
                child: Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/mercado-local-2b8c3.appspot.com/o/projeto%2FAnuncie%20seu%20produto.png?alt=media&token=875eec3e-b451-42d4-8dee-b0d8c64c8b07"),
              ),
              onTap: () {
                Navigator.of(context).pop('hello');
              },
            ),
          )),
    );
  }
}


  // final Shader linearGradient = LinearGradient(
  //   colors: <Color>[
  //     Color(0xffBE2A2C),
  //     Color(0xffDD5429),
  //     Color(0xffF27127),
  //     Color(0xffE76228),
  //     Color(0xffBE2A2C)
  //   ],
  // ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));