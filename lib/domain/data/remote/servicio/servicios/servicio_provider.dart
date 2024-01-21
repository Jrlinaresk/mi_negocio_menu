import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:minegociomenu/domain/models/servicios/servicio_categoria.dart';

final serviciosProvider = FutureProvider<List<ServiceCategoria>>((ref) async {
  final response = await http
      .get(Uri.parse('https://mipymesdecuba.com/api/categorias-servicio'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => ServiceCategoria.fromJson(json)).toList();
  } else {
    throw Exception('Error al obtener las servicios');
  }
});

class ServicioNotifier extends Notifier<List<ServiceCategoria>> {
  final AsyncValue<List<ServiceCategoria>> servicios;
  final String baseUrl;
  final String authToken;

  ServicioNotifier(
      {required this.servicios, required this.baseUrl, required this.authToken})
      : super();

  @override
  List<ServiceCategoria> build() {
    // Accede a los datos utilizando el método when
    return servicios.when(
      data: (data) => data, // Devuelve los datos o una lista vacía si son nulos
      loading: () => [], // Devuelve una lista vacía durante la carga
      error: (error, stack) => [], // Devuelve una lista vacía en caso de error
    );
  }
}
