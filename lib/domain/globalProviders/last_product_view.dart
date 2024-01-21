import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/core/Helpers/random_product_generator.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/domain/product_model.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final Last_view_ProductoStateNotifierProvider =
    StateNotifierProvider<Last_view_ProductoNotifier, Product>((ref) {
  return Last_view_ProductoNotifier();
});

class Last_view_ProductoNotifier extends StateNotifier<Product> {
  Last_view_ProductoNotifier()
      : super(RandomProductGenerator.gerLast_view_Product());

  void addProducto() {
    state = Product(
        id: 0,
        productId: "productId",
        name: "name",
        modelo: "modelo",
        price: "123",
        garantia: "garantia",
        disponibilidad: 0,
        description: "description",
        mayorista: 0,
        nota: "nota",
        unidadMedidaId: 0,
        estadoId: 0,
        formaDePagoId: 0,
        empresaId: 0,
        createdAt: "createdAt",
        updatedAt: "updatedAt",
        monedaId: "monedaId",
        image1: "image1",
        image2: "image2",
        mensajeria: 0,
        favorito: false,
        types: []);
  }

  void toggleProductoFavorito(int index, bool isFavorito) {
    // Cambia el estado de favorito del producto en la lista
    state = state.copyWith(favorito: isFavorito);
  }
}
