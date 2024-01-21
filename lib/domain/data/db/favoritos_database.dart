import 'package:minegociomenu/presentation/Screens/particular/presentation/products/domain/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavoritosDatabase {
  late Database _database;

  Future<void> initializeDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'favoritos.db');
    _database = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favoritos(
        id INTEGER PRIMARY KEY,
        productId TEXT,
        name TEXT,
        modelo TEXT,
        price TEXT,
        garantia TEXT,
        disponibilidad INTEGER,
        description TEXT,
        mayorista INTEGER,
        nota TEXT,
        unidadMedidaId INTEGER,
        estadoId INTEGER,
        formaDePagoId INTEGER,
        empresaId INTEGER,
        createdAt TEXT,
        updatedAt TEXT,
        monedaId TEXT,
        image1 TEXT,
        image2 TEXT,
        mensajeria INTEGER
      )
    ''');
  }

  Future<void> agregarAFavoritos(Product producto) async {
    final favoritoExistente =
        await obtenerFavoritoPorProductId(producto.productId);
    if (favoritoExistente == null) {
      await _database.insert('favoritos', producto.toMap());
    }
  }

  Future<void> eliminarDeFavoritos(String productId) async {
    await _database
        .delete('favoritos', where: 'productId = ?', whereArgs: [productId]);
  }

  Future<List<Product>> obtenerFavoritos() async {
    final List<Map<String, dynamic>> maps = await _database.query('favoritos');
    return List.generate(maps.length, (i) {
      return Product(
        id: maps[i]['id'],
        productId: maps[i]['productId'],
        name: maps[i]['name'],
        modelo: maps[i]['modelo'],
        price: maps[i]['price'],
        garantia: maps[i]['garantia'],
        disponibilidad: maps[i]['disponibilidad'],
        description: maps[i]['description'],
        mayorista: maps[i]['mayorista'],
        nota: maps[i]['nota'],
        unidadMedidaId: maps[i]['unidadMedidaId'],
        estadoId: maps[i]['estadoId'],
        formaDePagoId: maps[i]['formaDePagoId'],
        empresaId: maps[i]['empresaId'],
        createdAt: maps[i]['createdAt'],
        updatedAt: maps[i]['updatedAt'],
        monedaId: maps[i]['monedaId'],
        image1: maps[i]['image1'],
        image2: maps[i]['image2'],
        mensajeria: maps[i]['mensajeria'],
        favorito: maps[i]["favorito"],
        types: maps[i]["types"],
      );
    });
  }

  Future<Product?> obtenerFavoritoPorProductId(String productId) async {
    final List<Map<String, dynamic>> maps = await _database.query(
      'favoritos',
      where: 'productId = ?',
      whereArgs: [productId],
    );

    if (maps.isNotEmpty) {
      return Product(
          id: maps[0]['id'],
          productId: maps[0]['productId'],
          name: maps[0]['name'],
          modelo: maps[0]['modelo'],
          price: maps[0]['price'],
          garantia: maps[0]['garantia'],
          disponibilidad: maps[0]['disponibilidad'],
          description: maps[0]['description'],
          mayorista: maps[0]['mayorista'],
          nota: maps[0]['nota'],
          unidadMedidaId: maps[0]['unidadMedidaId'],
          estadoId: maps[0]['estadoId'],
          formaDePagoId: maps[0]['formaDePagoId'],
          empresaId: maps[0]['empresaId'],
          createdAt: maps[0]['createdAt'],
          updatedAt: maps[0]['updatedAt'],
          monedaId: maps[0]['monedaId'],
          image1: maps[0]['image1'],
          image2: maps[0]['image2'],
          mensajeria: maps[0]['mensajeria'],
          favorito: maps[0]["favorito"],
          types: maps[0]["types"]);
    } else {
      return null;
    }
  }
}
