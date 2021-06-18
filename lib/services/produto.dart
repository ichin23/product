class Produto {
  final String name;
  final double price;
  final String description;
  final String? productID;
  final String vendedorID;
  final List<dynamic> imageURL;
  final String genero;
  final String? marca;
  final List<dynamic>? cores;
  final List<dynamic> categorias;

  Produto({
    required this.genero,
    required this.marca,
    required this.name,
    required this.price,
    required this.description,
    this.productID,
    this.cores,
    required this.categorias,
    required this.vendedorID,
    this.imageURL = const [],
  });
}

Produto getProduto(
    {required String nome,
    required String description,
    required vendedorID,
    productID,
    required genero,
    marca,
    required List<dynamic> categorias,
    required double price,
    required List<dynamic> imageURL}) {
  return Produto(
      categorias: categorias,
      name: nome,
      price: price,
      description: description,
      productID: productID,
      vendedorID: vendedorID,
      imageURL: imageURL,
      genero: genero,
      marca: marca);
}
