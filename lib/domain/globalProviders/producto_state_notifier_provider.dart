import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/core/Helpers/random_product_generator.dart';
import 'package:minegociomenu/presentation/Screens/products/domain/product_model.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final ProductoStateNotifierProvider =
    StateNotifierProvider<ProductoNotifier, List<Product>>((ref) {
  return ProductoNotifier();
});

class ProductoNotifier extends StateNotifier<List<Product>> {
  ProductoNotifier() : super(RandomProductGenerator.gerProductListEz());

  void addProducto() {
    state = [
      ...state,
      Product(
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
        types: [],
      ),
    ];
  }

/*   void toogleProductoFavorito(bool b) {
    state = state.map((producto) {
      if (b) {
        return producto.copyWith(favorito: true);
      } else
        return producto.copyWith(favorito: false);
    }).toList();
  } */

  void toggleProductoFavorito(int index, bool isFavorito) {
    state[index] = state[index].copyWith(favorito: isFavorito);
  }
}
