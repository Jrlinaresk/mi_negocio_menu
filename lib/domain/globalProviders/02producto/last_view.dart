import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/domain/models/producto/producto.dart';

final plastView = StateNotifierProvider<LastViewNotifier, Producto>((ref) {
  return LastViewNotifier();
});

class LastViewNotifier extends StateNotifier<Producto> {
  LastViewNotifier() : super(Producto(productoID: 0, nombre: ''));

  void updateLastView(Producto newProduct) {
    state = newProduct;
  }

  void setLastView(Producto producto) {
    state = producto;
  }
}
