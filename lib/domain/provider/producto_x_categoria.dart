import 'dart:async';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:minegociomenu/domain/models/producto/producto.dart';

final categoriaIdProvider = StateProvider<int>((ref) {
  return -1;
});

//usando StreemProvider
final categoriaIdController = StreamController<int>();

final productosProvider = StreamProvider<List<Producto>>((ref) {
  // Obtener el parámetro utilizando ref.read
  final categoriaId = ref.watch(categoriaIdProvider);

  // Emitir el valor de la categoría en el Stream
  categoriaIdController.add(categoriaId);

  // Devolver el Stream que emite la lista de productos
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
      // Manejar errores aquí según tus necesidades
      print('Error: $e');
      yield [];
    }
    // Puedes ajustar el intervalo de emisión según tus necesidades
    await Future.delayed(Duration(seconds: 30));
  }
}

//metodo usando un FutureProvider
/* final productosProvider = FutureProvider<List<Producto>>((ref) async {
  // Obtener el parámetro utilizando ref.read
  final categoriaId = ref.read(categoriaIdProvider);
  final response = await http.get(Uri.parse(
      'https://mipymesdecuba.com/api/productosxcategoria/$categoriaId'));
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    // Asegúrate de que 'data' existe en el JSON y es una lista
    if (data.containsKey('data') && data['data'] is List) {
      // Obtén la lista de 'data'
      final List<dynamic> list_data = data['data'];

      // Ahora puedes trabajar con la lista 'data'
      return list_data.map((json) => Producto.fromJson(json)).toList();
    } else {
      // Manejar el caso en que 'data' no existe o no es una lista
      print('El JSON no contiene una lista llamada "data".');
    }
    return [];
  } else {
    throw Exception('Error al obtener las categorías');
  }
}); */

// Proveedor para el último producto seleccionado
final plastView = StateNotifierProvider<LastViewNotifier, Producto>((ref) {
  return LastViewNotifier();
});

// StateNotifier para el último producto seleccionado
class LastViewNotifier extends StateNotifier<Producto> {
  LastViewNotifier() : super(Producto(nombre: 'a'));

  void setLastView(Producto producto) {
    state = producto;
  }
}

/* // Proveedor para notificar cambios en la lista de productos
final productoNotifierProvider =
    NotifierProvider<ProductoNotifier, List<Producto>>((ref) {
  final productos = ref.watch(productosProvider);
  final lastView = ref.read(lastViewProvider.notifier);

  return ProductoNotifier();
}); */

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
    // Accede a los datos utilizando el método when
    return productos.when(
      data: (data) => data, // Devuelve los datos o una lista vacía si son nulos
      loading: () => [], // Devuelve una lista vacía durante la carga
      error: (error, stack) => [], // Devuelve una lista vacía en caso de error
    );
  }

  Future<void> actualizarDatosPeriodicamente() async {
    while (true) {
      categoriaIdController.add(ref.watch(categoriaIdProvider));
      await Future.delayed(Duration(seconds: 30));
    }
  }
}
