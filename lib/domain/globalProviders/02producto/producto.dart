import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/core/config/api_config.dart';
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
      data: (data) => data,
      loading: () => [],
      error: (error, stack) => [],
    );
  }

  Future<void> actualizarDatosPeriodicamente() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 120));
    }
  }
}


final productosProviderAsyncValue =
StreamProvider.autoDispose.family<AsyncValue<List<Producto>>, int>((ref, categoriaId) {
  if (categoriaId == -1) {
    return _getProductosStreamAsyncValue();
  }
  return _getProductos_x_Categorias_StreamAsyncValue(categoriaId);
});

Stream<AsyncValue<List<Producto>>> _getProductosStreamAsyncValue() async* {
  while (true) {
    try {
      final response = await http.get(
        Uri.parse('${ApiConfig.apiUrl}${ApiConfig.productosEndpoint}/'),
      );
      if (response.statusCode == 200) {
        final String responseBody = response.body;
        if (responseBody.isNotEmpty) {
          try {
            final List<dynamic> listData = jsonDecode(responseBody);
            final List<Producto> productos = listData.map((json) {
              return Producto.fromJson(json);
            }).toList();
            yield AsyncValue.data(productos);
          } catch (e) {
          }
        } else {
        }
      } else {
        throw Exception('Error al obtener las categorías');
      }
    } catch (e) {
    } finally {
    }
    await Future.delayed(const Duration(seconds: 120));
  }
}

Stream<AsyncValue<List<Producto>>> _getProductos_x_Categorias_StreamAsyncValue(int categoriaId) async* {
  while (true) {
    try {
      final response = await http.get(
        Uri.parse('${ApiConfig.apiUrl}${ApiConfig.productos_x_categoria_Endpoint}/$categoriaId'),
      );
      if (response.statusCode == 200) {
        final String responseBody = response.body;
        if (responseBody.isNotEmpty) {
          try {
            final List<dynamic> listData = jsonDecode(responseBody);
            final List<Producto> productos = listData.map((json) {
              return Producto.fromJson(json);
            }).toList();
            yield AsyncValue.data(productos);
          } catch (e) {
          }
        } else {
        }
      } else {
        throw Exception('Error al obtener las categorías');
      }
    } catch (e) {
    } finally {
    }
    await Future.delayed(const Duration(seconds: 120));
  }
}



final productosProvider =
StreamProvider.autoDispose.family<List<Producto>, int>((ref, categoriaId) {
  if(categoriaId == -1) {
    return _getProductosStream();
  }
  return _getProductos_x_Categorias_Stream(categoriaId);
});

Stream<List<Producto>> _getProductosStream() async* {
  while (true) {
    try {
      final response = await http.get(
        Uri.parse(
            '${ApiConfig.apiUrl}${ApiConfig.productosEndpoint}/'),
      );
      if (response.statusCode == 200) {
        final String responseBody = response.body;
        if (responseBody.isNotEmpty) {
          try {
            final List<dynamic> listData = jsonDecode(responseBody);
            final List<Producto> productos = listData.map((json) {
              return Producto.fromJson(json);
            }).toList();
            yield productos;
          } catch (e) {
            yield [];
          }
        } else {
          yield [];
        }
      } else {
        throw Exception('Error al obtener las categorías');
      }
    } catch (e) {
    } finally {
      yield* const Stream.empty();
    }
    await Future.delayed(const Duration(seconds: 120));
  }
}

Stream<List<Producto>> _getProductos_x_Categorias_Stream(int categoriaId) async* {
  while (true) {
    try {
      final response = await http.get(
        Uri.parse(
            '${ApiConfig.apiUrl}${ApiConfig.productos_x_categoria_Endpoint}/$categoriaId'),
      );
      if (response.statusCode == 200) {
        final String responseBody = response.body;
        if (responseBody.isNotEmpty) {
          try {
            final List<dynamic> listData = jsonDecode(responseBody);
            final List<Producto> productos = listData.map((json) {
              return Producto.fromJson(json);
            }).toList();
            yield productos;
          } catch (e) {
            yield [];
          }
        } else {
          yield [];
        }
      } else {
        throw Exception('Error al obtener las categorías');
      }
    } catch (e) {
    } finally {
      yield* const Stream.empty();
    }
    await Future.delayed(const Duration(seconds: 120));
  }
}

//

final fullproductosProvider = StreamProvider.autoDispose<List<Producto>>((ref) {
  return _getProductosStream();
});


