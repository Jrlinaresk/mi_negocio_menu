import 'package:minegociomenu/domain/models/producto/producto.dart';

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

  Future<void> agregarAFavoritos(Producto producto) async {
    final favoritoExistente =
        await obtenerFavoritoPorProductId(producto.productoID!);
    if (favoritoExistente == null) {
/*       await _database.insert('favoritos', producto.toMap());
 */
    }
  }

  Future<void> eliminarDeFavoritos(String productId) async {
    await _database
        .delete('favoritos', where: 'productId = ?', whereArgs: [productId]);
  }

  Future<List<Producto>> obtenerFavoritos() async {
    final List<Map<String, dynamic>> maps = await _database.query('favoritos');
    return List.generate(maps.length, (i) {
      return Producto(
        productoID: 0,
        nombre: 'as',
      );
    });
  }

  Future<Producto?> obtenerFavoritoPorProductId(int productId) async {
    final List<Map<String, dynamic>> maps = await _database.query(
      'favoritos',
      where: 'productId = ?',
      whereArgs: [productId],
    );

    if (maps.isNotEmpty) {
      return Producto(
        productoID: 0,
        nombre: 'as',
      );
    } else {
      return null;
    }
  }
}
