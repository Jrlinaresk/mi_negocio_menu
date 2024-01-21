import 'dart:math';
import 'package:minegociomenu/core/Helpers/random_generator.dart';
import 'package:minegociomenu/presentation/Screens/products/domain/product_model.dart';
import 'package:minegociomenu/core/utils/example_date.dart';
import 'package:uuid/uuid.dart';

class RandomProductGenerator {
  static final List<String> products = [
    // Categoría: Electrónica
    'Teléfono inteligente',
    'Tablet',
    'Laptop',
    'Televisor',
    'Auriculares',
    // Categoría: Ropa
    'Camiseta',
    'Pantalones',
    'Zapatos',
    'Vestido',
    'Bufanda',
    // Categoría: Alimentos
    'Leche',
    'Pan',
    'Manzanas',
    'Arroz',
    'Hamburguesas',
    // Categoría: Hogar
    'Mesa',
    'Silla',
    'Sofá',
    'Lámpara',
    'Cama',
    // Categoría: Juguetes
    'Pelota',
    'Muñeca',
    'Rompecabezas',
    'Carro de juguete',
    'Tren de juguete',
    // Categoría: Salud y Belleza
    'Champú',
    'Crema facial',
    'Cepillo de dientes',
    'Jabón',
    'Maquillaje',
    // Categoría: Automotriz
    'Aceite de motor',
    'Neumáticos',
    'Batería de automóvil',
    'Lavadora de autos',
    'Luces del coche',
    // Categoría: Deportes
    'Balón de fútbol',
    'Raqueta de tenis',
    'Pesas',
    'Cinta de correr',
    'Bicicleta',
    // Categoría: Electrodomésticos
    'Refrigerador',
    'Lavadora',
    'Horno de microondas',
    'Licuadora',
    'Aspiradora',
    // Categoría: Libros
    'Novela',
    'Libro de cocina',
    'Libro de ciencia',
    'Libro de poesía',
    'Libro de historia',
  ];

  static Product getProductById(String productId) {
    final product = gerProductListEz().firstWhere(
      (product) =>
          product.productId ==
          productId, // Devolver null si no se encuentra un producto con el ID
    );

    return product;
  }

  static List<Product> gerProductList(var type) {
    List<Product> result = [];
    late int a = 0;
    while (a++ < 100) {
      String s = getRandomNameProducto();
      result.add(getRandomProduct(type));
    }
    return result;
  }

  static List<Product> gerProductListEz() {
    List<Product> result = [];
    late int a = 0;
    while (a++ < 100) {
      String s = getRandomNameProducto();
      result.add(getRandomProductEz());
    }
    return result;
  }

  static String getRandomProductId() {
    // Puedes implementar la generación de un ID de producto aleatorio aquí
    // Esto es solo un ejemplo simple
    return 'product_${DateTime.now().millisecondsSinceEpoch}';
  }

  static List<Product> gerProductFavoritoList() {
    late List<Product> fulllist = gerProductListEz();
    late List<Product> result = [];

    for (int a = 0; a > fulllist.length; a++) {
      if (fulllist[a].favorito == true) result.add(fulllist[a]);
    }
    return result;
  }

  static final Set<String> usedProducts = <String>{};
  static final Random random = Random();

  String getRandomProduct2() {
    if (usedProducts.length == products.length) {
      // Se han utilizado todos los productos, así que se reinicia el conjunto.
      usedProducts.clear();
    }

    String product;

    do {
      final randomIndex = random.nextInt(products.length);
      product = products[randomIndex];
    } while (usedProducts.contains(product));

    usedProducts.add(product);
    return product;
  }

  static Product getRandomProduct(var Tipy) {
    final randomProductId = const Uuid().v4();
    var randomType = obtenerCategoriasAleatorias();
    var randomName = generarNombreProductoAleatorio(randomType);
    const randomDescription =
        'Descripción aleatoria del producto.... Descripción aleatoria del producto.... Descripción aleatoria del producto.... Descripción aleatoria del producto.... Descripción aleatoria del producto.... ';
    final randomImage = RandomGenerator.GeTimageRandom('nombr');
    var randomPrice = obtenerPrecioAleatorio();
    var randomQuantity = obtenerCantidadAleatoria();
    var randomTelefono = ranmdonTelefono();
    var randomProvincia = obtenerProvinciaAleatoria();
    var randomEntregaA = entregaACasaAleatoria();

    return Product(
      id: 0, // ID debe establecerse adecuadamente si no es cero
      productId: randomProductId,
      name: randomName,
      modelo: 'ds345',
      price: randomPrice,
      garantia: randomQuantity,
      disponibilidad: 0,
      description: randomDescription,
      mayorista: 0,
      nota: 'randomNota',
      unidadMedidaId: 1,
      estadoId: 1,
      formaDePagoId: 1,
      empresaId: 1,
      createdAt: FechaActual,
      updatedAt: FechaActual,
      monedaId: '1',
      image1: 'assets/productos/product-01.jpg',
      image2: 'assets/productos/product-02.jpg',
      mensajeria: 0,
      favorito: false,
      types: randomType,
    );
  }

  static Product getRandomProductEz() {
    final randomProductId = const Uuid().v4();
    var randomType = obtenerCategoriasAleatorias();
    var randomName = generarNombreProductoAleatorio(randomType);
    const randomDescription =
        'Descripción aleatoria del producto.... Descripción aleatoria del producto.... Descripción aleatoria del producto.... Descripción aleatoria del producto.... Descripción aleatoria del producto.... ';
    final randomImage = RandomGenerator.GeTimageRandom('nombr');
    var randomPrice = obtenerPrecioAleatorio();
    var randomQuantity = obtenerCantidadAleatoria();
    var randomTelefono = ranmdonTelefono();
    var randomProvincia = obtenerProvinciaAleatoria();
    var randomEntregaA = entregaACasaAleatoria();

    return Product(
      id: 0, // ID debe establecerse adecuadamente si no es cero
      productId: randomProductId,
      name: randomName,
      modelo: 'ds345',
      price: randomPrice,
      garantia: randomQuantity,
      disponibilidad: 0,
      description: randomDescription,
      mayorista: 0,
      nota: 'randomNota',
      unidadMedidaId: 1,
      estadoId: 1,
      formaDePagoId: 1,
      empresaId: 1,
      createdAt: FechaActual,
      updatedAt: FechaActual,
      monedaId: '1',
      image1: 'assets/productos/product-01.jpg',
      image2: 'assets/productos/product-02.jpg',
      mensajeria: 0,
      favorito: false,
      types: randomType,
    );
  }

  static final randomProductGenerator = RandomProductGenerator();

  static String getRandomNameProducto() {
    return randomProductGenerator.getRandomProduct2();
  }

  static Product gerLast_view_Product() {
    return gerProductListEz().first;
  }

//
}
