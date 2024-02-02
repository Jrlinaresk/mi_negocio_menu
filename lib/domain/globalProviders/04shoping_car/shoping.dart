import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/core/config/api_config.dart';
import 'package:minegociomenu/domain/data/remote/servicio/servicio_x_categoria/servicio_x_categoria.dart';
import 'package:minegociomenu/domain/globalProviders/01categoria/categoria.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:minegociomenu/libs/shopping/model/cart_model.dart';
import 'package:minegociomenu/libs/shopping/persistent_shopping_cart.dart';
import 'package:minegociomenu/libs/shopping/persistent_shopping_cart.dart';

class PersistentShoppingCartItemNotifier
    extends Notifier<PersistentShoppingCartItem> {
  final AsyncValue<PersistentShoppingCartItem> shopCart;
  final String baseUrl;
  final String authToken;
  final LastViewNotifier lastViewNotifier;

  PersistentShoppingCartItemNotifier(
    this.shopCart,
    this.baseUrl,
    this.authToken,
    this.lastViewNotifier,
  ) : super();

  @override
  PersistentShoppingCartItem build() {
    return shopCart.when(
      data: (data) => data,
      loading: () => PersistentShoppingCartItem(
          productId: '', productName: '', unitPrice: -1, quantity: -1),
      error: (error, stack) => PersistentShoppingCartItem(
          productId: '', productName: '', unitPrice: -1, quantity: -1),
    );
  }

  Future<void> actualizarDatosPeriodicamente() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 30));
    }
  }
}

/* final shoppingCartItemProvider =
    Provider<List<PersistentShoppingCartItem>>((ref) {
  return List<PersistentShoppingCartItem>();
}); */

final shoppingCartProvider = Provider<PersistentShoppingCart>((ref) {
  return PersistentShoppingCart();
});

/* final shopCartProvider =
    StreamProvider.autoDispose<PersistentShoppingCartItem>((ref) {
  return _getPersistentShoppingCartItemStream();
});
 */

/* Stream<PersistentShoppingCartItem>
    _getPersistentShoppingCartItemStream() async* {
  const categoriaId = 3;

  var apiurlfull =
      '${ApiConfig.apiUrl}${ApiConfig.shopCartEndpoint}/$categoriaId';
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
            final PersistentShoppingCartItem shopCart =
                PersistentShoppingCartItem.fromJson(data);
            yield shopCart;
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
 */