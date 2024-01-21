import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/core/Helpers/random_category_generator.dart';
import 'package:minegociomenu/domain/models/categoria/categoria.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final CategoriaProductoStateNotifierProvider =
    StateNotifierProvider<CategoriaNotifier, List<Categoria>>((ref) {
  return CategoriaNotifier();
});

class CategoriaNotifier extends StateNotifier<List<Categoria>> {
  CategoriaNotifier() : super(RandomCategoryGenerator.gerCategoriaList());

  void addCategoria() {
    state = [
      ...state,
      Categoria(id: 0, nombre: 'a', icono: Icons.account_circle_outlined)
    ];
  }
}
