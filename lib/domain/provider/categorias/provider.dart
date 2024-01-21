import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:minegociomenu/domain/models/categoria/categoria.dart';

final categoriasProvider = FutureProvider<List<Categoria>>((ref) async {
  final response = await http
      .get(Uri.parse('https://mipymesdecuba.com/api/categoriaproducto'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => Categoria.fromJson(json)).toList();
  } else {
    throw Exception('Error al obtener las categorías');
  }
});

class CategoriaNotifier extends Notifier<List<Categoria>> {
  final AsyncValue<List<Categoria>> categorias;
  final String baseUrl;
  final String authToken;

  CategoriaNotifier(
      {required this.categorias,
      required this.baseUrl,
      required this.authToken})
      : super();

  @override
  List<Categoria> build() {
    // Accede a los datos utilizando el método when
    return categorias.when(
      data: (data) => data, // Devuelve los datos o una lista vacía si son nulos
      loading: () => [], // Devuelve una lista vacía durante la carga
      error: (error, stack) => [], // Devuelve una lista vacía en caso de error
    );
  }
}
