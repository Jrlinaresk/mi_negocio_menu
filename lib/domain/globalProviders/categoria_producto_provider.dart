import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/core/Helpers/random_category_generator.dart';
import 'package:minegociomenu/domain/models/categoria_model.dart';
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
      Categoria(
        id: "id",
        name: "name",
        image: "image",
        description: "description",
        costoxkilometro: '0.50usd',
      )
    ];
  }
}
