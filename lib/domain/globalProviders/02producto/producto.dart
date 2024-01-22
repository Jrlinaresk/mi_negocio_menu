import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/domain/data/remote/servicio/servicio_x_categoria/servicio_x_categoria.dart';
import 'package:minegociomenu/domain/globalProviders/01categoria/categoria.dart';
import 'package:minegociomenu/domain/models/producto/producto.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductoNotifier extends Notifier<List<Producto>> {
  final AsyncValue<List<Producto>> productos;
  final String baseUrl;
  final String authToken;
  final LastViewNotifier lastViewNotifier;

  ProductoNotifier(
    this.productos,
    this.baseUrl,
    this.authToken,
    this.lastViewNotifier,
  ) : super();

  @override
  List<Producto> build() {
    return productos.when(
      data: (data) => data ?? [],
      loading: () => [],
      error: (error, stack) => [],
    );
  }

  Future<void> actualizarDatosPeriodicamente() async {
    while (true) {
      categoriaIdController.add(ref.watch(categoriaIdProvider));
      await Future.delayed(Duration(seconds: 120));
    }
  }
}

final productosProvider = StreamProvider<List<Producto>>((ref) {
  final categoriaId = ref.watch(categoriaIdProvider);
  categoriaIdController.add(categoriaId);
  return _getProductosStream(categoriaId);
});

Stream<List<Producto>> _getProductosStream(int categoriaId) async* {
  while (true) {
    try {
      final response = await http.get(Uri.parse(
          'https://mipymesdecuba.com/api/productosxcategoria/$categoriaId'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('data') && data['data'] is List) {
          final List<dynamic> listData = data['data'];
          yield listData.map((json) => Producto.fromJson(json)).toList();
        } else {
          print('El JSON no contiene una lista llamada "data".');
          yield [];
        }
      } else {
        throw Exception('Error al obtener las categorías');
      }
    } catch (e) {
      print('Error: $e');
      yield [];
    }
    await Future.delayed(Duration(seconds: 120));
  }
}
