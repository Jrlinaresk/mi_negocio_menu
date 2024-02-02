import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/core/config/api_config.dart';
import 'package:minegociomenu/libs/shopping/model/cart_model.dart';

class PersistentShoppingCartItemNotifier
    extends Notifier<List<PersistentShoppingCartItem>> {
  final AsyncValue<List<PersistentShoppingCartItem>>
      persistent_shopping_cartItem;

/*   final LastViewNotifier lastViewNotifier;
 */
  PersistentShoppingCartItemNotifier(
    this.persistent_shopping_cartItem,
/*     this.lastViewNotifier, */
  ) : super();

  @override
  List<PersistentShoppingCartItem> build() {
    return persistent_shopping_cartItem.when(
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

/* final persistent_shopping_cartItemProvider =
    StreamProvider.autoDispose<List<PersistentShoppingCartItem>>((ref) {
  return _getPersistentShoppingCartItemsStream();
}); */

/* Stream<List<PersistentShoppingCartItem>>
    _getPersistentShoppingCartItemsStream() async* {
  var apiurlfull =
      '${ApiConfig.apiUrl}${ApiConfig.persistent_shopping_cartItemsEndpoint}';
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
              final List<PersistentShoppingCartItem>
                  persistent_shopping_cartItems = data
                      .map((json) => PersistentShoppingCartItem.fromJson(json))
                      .toList();
              yield persistent_shopping_cartItems;
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
 */