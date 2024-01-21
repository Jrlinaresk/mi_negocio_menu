import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/core/Helpers/random_product_generator.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/domain/product_model.dart';

final simpleProductProvider = Provider<Product>((ref) {
  return RandomProductGenerator.getRandomProductEz();
});

final simpleProductListProvider = Provider<List<Product>>((ref) {
  return RandomProductGenerator.gerProductListEz();
});

final productoIdProvider = StateProvider<String>((ref) {
  return "0";
});

final productProvider =
    FutureProvider.family<Product, String>((ref, productId) async {
  final p = RandomProductGenerator.getProductById(productId);
  return p;
});
