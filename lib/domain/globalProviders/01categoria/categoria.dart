import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      categoriaIdController.add(ref.watch(categoriaIdProvider));
      await Future.delayed(Duration(seconds: 120));
    }
  }
}

final categoriaIdProvider = StateProvider<int>((ref) {
  return -1;
});

final categoriaIdController = StreamController<int>();
