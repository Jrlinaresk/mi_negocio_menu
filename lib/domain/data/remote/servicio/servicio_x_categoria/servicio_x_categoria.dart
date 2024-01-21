import 'dart:async';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:minegociomenu/domain/entity/service_dto.dart';
import 'package:minegociomenu/disaing/Screens/services/domain/service_model.dart';
import 'package:minegociomenu/domain/entity/servicio_categoria.dart';

final servicioIdProvider = StateProvider<int>((ref) {
  return -1;
});

//usando StreemProvider
final servicioIdController = StreamController<int>();

final serviciocategoriasProvider = StreamProvider<List<Service_dto>>((ref) {
  // Obtener el parámetro utilizando ref.read
  final servicioId = ref.watch(servicioIdProvider);

  // Emitir el valor de la categoría en el Stream
  servicioIdController.add(servicioId);

  // Devolver el Stream que emite la lista de serviciocategorias
  return _getProductosStream(servicioId);
});

Stream<List<Service_dto>> _getProductosStream(int servicioId) async* {
  while (true) {
    try {
      final response = await http.get(Uri.parse(
          'https://mipymesdecuba.com/api/serviciosxcategoria/$servicioId'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('data') && data['data'] is List) {
          final List<dynamic> listData = data['data'];
          yield listData.map((json) => Service_dto.fromJson(json)).toList();
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

// Proveedor para el último serviciocategoria seleccionado
final plastView =
    StateNotifierProvider<LastViewNotifier, ServiceCategoria>((ref) {
  return LastViewNotifier();
});

// StateNotifier para el último serviciocategoria seleccionado
class LastViewNotifier extends StateNotifier<ServiceCategoria> {
  LastViewNotifier() : super(ServiceCategoria());

  void setLastView(ServiceCategoria serviciocategoria) {
    state = serviciocategoria;
  }
}

class ProductoNotifier extends Notifier<List<Service>> {
  final AsyncValue<List<Service>> serviciocategorias;
  final String baseUrl;
  final String authToken;
  final LastViewNotifier lastViewNotifier;

  ProductoNotifier(
    this.serviciocategorias,
    this.baseUrl,
    this.authToken,
    this.lastViewNotifier,
  ) : super();

  @override
  List<Service> build() {
    // Accede a los datos utilizando el método when
    return serviciocategorias.when(
      data: (data) => data, // Devuelve los datos o una lista vacía si son nulos
      loading: () => [], // Devuelve una lista vacía durante la carga
      error: (error, stack) => [], // Devuelve una lista vacía en caso de error
    );
  }

  Future<void> actualizarDatosPeriodicamente() async {
    while (true) {
      servicioIdController.add(ref.watch(servicioIdProvider));
      await Future.delayed(Duration(seconds: 30));
    }
  }
}
