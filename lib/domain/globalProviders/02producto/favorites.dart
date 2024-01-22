import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/domain/models/producto/producto.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, Set<int>>((ref) {
  return FavoritesNotifier();
});

class FavoritesNotifier extends StateNotifier<Set<int>> {
  FavoritesNotifier() : super(Set<int>());

  void toggleFavorite(int productId) {
    state.contains(productId)
        ? removeFavorite(productId)
        : addFavorite(productId);
  }

  void addFavorite(int productId) {
    state = Set<int>.from(state)..add(productId);
  }

  void removeFavorite(int productId) {
    state = Set<int>.from(state)..remove(productId);
  }

  bool isFavorite(int productId) {
    return state.contains(productId);
  }
}
