import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/core/config/api_config.dart';
import 'package:minegociomenu/domain/data/remote/servicio/servicio_x_categoria/servicio_x_categoria.dart';
import 'package:minegociomenu/domain/models/categoria/categoria.dart';

class CategoriaNotifier extends Notifier<List<Categoria>> {
  final AsyncValue<List<Categoria>> categoria;
  final String baseUrl;
  final String authToken;
  final LastViewNotifier lastViewNotifier;

  CategoriaNotifier(
    this.categoria,
    this.baseUrl,
    this.authToken,
    this.lastViewNotifier,
  ) : super();

  @override
  List<Categoria> build() {
    return categoria.when(
      data: (data) => data ?? [],
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

final categoriaProvider = StreamProvider.autoDispose<List<Categoria>>((ref) {
  return _getCategoriasStream();
});

Stream<List<Categoria>> _getCategoriasStream() async* {
  var apiurlfull = '${ApiConfig.apiUrl}${ApiConfig.categoriasEndpoint}';
  while (true) {
    try {
      final response = await http.get(
        Uri.parse(apiurlfull),
      );
      if (response.statusCode == 200) {
        final String responseBody = response.body;
        if (responseBody.isNotEmpty) {
          try {
            final dynamic data = jsonDecode(responseBody);
            if (data is List) {
              final List<Categoria> categorias =
                  data.map((json) => Categoria.fromJson(json)).toList();
              yield categorias;
            }
          } catch (e) {}
        } else {}
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
