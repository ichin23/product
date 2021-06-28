import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product/screens/form.dart';
import 'package:product/screens/insereFoto.dart';
import 'package:product/screens/primeiraProduto.dart';
import 'package:product/screens/produtoTeste.dart';
import 'package:product/screens/review.dart';
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
          '/insereFoto': (context) => InsereFoto(),
        },
        theme: ThemeData(
          textTheme: GoogleFonts.dmSansTextTheme(),
          accentColor: Color(0xffF27127),
          backgroundColor: Color(0xffF27127),
          primaryColor: Color(0xffF27127),
          scaffoldBackgroundColor: Color(0xffF27127),
        ),
      ),
    ),
  );
}

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
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

class TelaTest extends StatefulWidget {
  TelaTest({Key? key}) : super(key: key);

  @override
  _TelaTestState createState() => _TelaTestState();
}

class _TelaTestState extends State<TelaTest> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: AnimatedContainer(
          //padding: EdgeInsets.symmetric(vertical: 30),
          width: MediaQuery.of(context).size.width,

          alignment: selected ? Alignment.topCenter : Alignment.center,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              )),
          height: selected
              ? MediaQuery.of(context).size.height * 0.8
              : MediaQuery.of(context).size.height * 0.15,
          duration: const Duration(seconds: 1),
          curve: Curves.linearToEaseOut,
          child: SingleChildScrollView(
              child: Column(children: [
            selected
                ? Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(children: [
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Conta",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 35)),
                            RadiantGradientMask(
                                child:
                                    Icon(Icons.settings, color: Colors.white)),
                          ]),
                      SizedBox(height: 10),
                      Container(
                          child: Column(children: [
                        ListTile(
                          onTap: () {},
                          title: Text("Minha Loja",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          subtitle: Text("Visualize e configure sua loja",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          leading: RadiantGradientMask(
                              child: Icon(Icons.store,
                                  color: Colors.white, size: 35)),
                          trailing: Icon(Icons.keyboard_arrow_right,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          onTap: () {},
                          title: Text("Informações do Perfil",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          subtitle: Text("Atualize as informações do perfil",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          leading: RadiantGradientMask(
                              child: Icon(Icons.person_outline,
                                  color: Colors.white, size: 35)),
                          trailing: Icon(Icons.keyboard_arrow_right,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          onTap: () {},
                          title: Text("Notificações",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          subtitle: Text("Veja suas notificações",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          leading: RadiantGradientMask(
                              child: Icon(Icons.notifications_outlined,
                                  color: Colors.white, size: 35)),
                          trailing: Icon(Icons.keyboard_arrow_right,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Container(
                            width: double.infinity,
                            child: Text("Mais",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 35))),
                        SizedBox(height: 10),
                        ListTile(
                          onTap: () {},
                          title: Text("Nos Avalie",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          subtitle: Text("Nos Avalie na Play Store",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          leading: RadiantGradientMask(
                              child: Icon(Icons.star_border,
                                  color: Colors.white, size: 35)),
                          trailing: Icon(Icons.keyboard_arrow_right,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          onTap: () {},
                          title: Text("FAQ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          subtitle: Text("Perguntas Frequentes",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          leading: RadiantGradientMask(
                              child: Icon(Icons.error_outline,
                                  color: Colors.white, size: 35)),
                          trailing: Icon(Icons.keyboard_arrow_right,
                              color: Colors.white),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text("Logout",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          subtitle: Text("Sair da conta neste dispositivo",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          leading: RadiantGradientMask(
                              child: Icon(Icons.logout_outlined,
                                  color: Colors.white, size: 35)),
                          trailing: Icon(Icons.keyboard_arrow_right,
                              color: Colors.white),
                        ),
                      ])),
                      Spacer(),
                    ]),
                  )
                : Container(),
            Container(
              padding: EdgeInsets.only(bottom: 35),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                      ),
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
                              height: MediaQuery.of(context).size.width * 0.15,
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
                              ).createShader(
                                  Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                            fontSize: 35)),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                            height: MediaQuery.of(context).size.width * 0.15,
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: Container(
                              child: Image.network(
                                (FirebaseAuth.instance.currentUser!.photoURL ==
                                            null ||
                                        FirebaseAuth.instance.currentUser!
                                                .photoURL ==
                                            "")
                                    ? "https://firebasestorage.googleapis.com/v0/b/testeflutter-4d2cf.appspot.com/o/projeto%2Fperson.png?alt=media&token=a4fe7d35-ec8e-4f4e-a42d-bbc5b320678d"
                                    : FirebaseAuth
                                        .instance.currentUser!.photoURL!,
                                fit: BoxFit.cover,
                                height: MediaQuery.of(context).size.width * 0.2,
                              ),
                            )),
                      ),
                    ),
                  ]),
            ),
          ])),
        ));
  }
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
                  Provider.of<ProdutoCadastro>(context, listen: false).clear();
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
    Builder(
        builder: (context) => Scaffold(
                body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TelaTest(),
                TextButton(
                    child: Text("Adicionar foto"),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/insereFoto');
                    })
              ],
            ))),
  ];

  void tabTapped(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          telas[index],
          Positioned(
            bottom: 20,
            left: 15,
            right: 15,
            child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: Colors.transparent),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Container(
                    height: 60,
                    child: BottomNavigationBar(
                      unselectedItemColor: Colors.black,
                      selectedItemColor: Colors.black,
                      showUnselectedLabels: true,
                      iconSize: 24,
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
          ),
        ]),
      ),
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
    final produtoProvider = Provider.of<ProdutoCadastro>(context);

    return Stack(
      children: [
        Positioned(
          child: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
            child: FutureBuilder<List<Produto>?>(
                future: getProdutos(),
                builder: (context, projectSnap) {
                  if (projectSnap.connectionState == ConnectionState.done) {
                    final products = projectSnap.data;
                    print(getProdutos());
                    List categorias = [];
                    if (products != null) {
                      categorias = products.map((produto) {
                        var categoria =
                            produto.categorias.map((e) => e).toList();
                        for (var item in categoria) {
                          return item.toString();
                        }
                      }).toList();
                    }

                    return (products != null)
                        ? Container(
                            height: MediaQuery.of(context).size.height -
                                MediaQuery.of(context).size.height * 0.15 -
                                32,
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  child: IconButton(
                                      onPressed: () {
                                        showMenu(
                                            context: context,
                                            position:
                                                RelativeRect.fromLTRB(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .5,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .2,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .5,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .2),
                                            items: [
                                              PopupMenuItem(
                                                child: TextButton(
                                                    child: Text("Mostra"),
                                                    onPressed: () {
                                                      print(categorias
                                                          // [0].runtimeType
                                                          );
                                                    }),
                                              )
                                            ]);
                                      },
                                      icon: Icon(Icons.menu_rounded)),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height -
                                      MediaQuery.of(context).size.height *
                                          0.15 -
                                      82,
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
                                                produtoProvider
                                                    .addProduct(products[i]);
                                                Navigator.of(context)
                                                    .pushNamed('/produtoTeste');
                                                print(produtoProvider
                                                    .cadastrando);
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
                                                    backgroundColor:
                                                        Colors.black,
                                                    title: Text(products[i]
                                                        .name
                                                        .toString()),
                                                    trailing: IconButton(
                                                        icon:
                                                            Icon(Icons.delete),
                                                        onPressed: () {
                                                          delete(products[i]
                                                              .productID!);
                                                          setState(() {});
                                                        }),
                                                    leading: IconButton(
                                                        icon: Icon(Icons.edit),
                                                        onPressed: () {
                                                          print(products[i]
                                                              .categorias);
                                                          // Navigator.pushNamed(
                                                          //     context, '/form',
                                                          //     arguments:
                                                          //         products[i]),
                                                        }),
                                                  )),
                                            ),
                                          )),
                                ),
                              ],
                            ),
                          )
                        : Container();
                  }
                  if (projectSnap.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Center(child: Text("Error"));
                  }
                }),
          ),
        ),
        Positioned(top: 0, left: 0, child: TelaTest())
      ],
    );
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