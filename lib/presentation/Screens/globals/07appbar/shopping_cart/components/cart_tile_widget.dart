import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/domain/globalProviders/04shoping_car/shoping.dart';
import 'package:minegociomenu/libs/shopping/model/cart_model.dart';
import 'package:minegociomenu/libs/shopping/persistent_shopping_cart.dart';
import 'package:minegociomenu/presentation/Screens/globals/07appbar/shopping_cart/components/network_image_widget.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_fullscreen_image.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_image.dart';
import 'package:minegociomenu/presentation/widgets/shopping_cart/agregar_restar.dart/agregar_restar.dart';

class CartTileWidget extends ConsumerStatefulWidget {
  final PersistentShoppingCartItem data;

  CartTileWidget({Key? key, required this.data}) : super(key: key);

  @override
  CartTileWidgetState createState() => CartTileWidgetState();
}

class CartTileWidgetState extends ConsumerState<CartTileWidget> {
  @override
  Widget build(BuildContext context) {
    final _shoppingCart = ref.watch(shoppingCartProvider);

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 130.0,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: buildFullscreenImage(
                  widget.data.productThumbnail ?? "assets/payment_online.png",
                  false,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.productName,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    widget.data.productDescription != null
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              widget.data.productDescription.toString(),
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black),
                            ),
                          )
                        : Container(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Precio unitario: \$ ${widget.data.unitPrice}",
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          "Precio final: \$ ${widget.data.unitPrice * widget.data.quantity}",
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        InkWell(
                          onTap: () async {
                            bool removed = await _shoppingCart
                                .removeFromCart(widget.data.productId);
                            if (removed) {
                              // Handle successful removal
                              showSnackBar(context, removed);
                            } else {
                              // Handle the case where if product was not found in the cart
                            }
                          },
                          child: Container(
                            height: 30,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.red),
                            ),
                            child: Center(
                              child: Text(
                                'Remove',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
/*                       const Text(
                        "Cantidad",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w100),
                      ), */
                  Card(
                    elevation: 0,
                    color: Colors.white,
                    child: SizedBox(
                      child: Card(
                        margin: const EdgeInsets.all(0),
                        elevation: 2,
                        color: Colors.white,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() async {
                                  _shoppingCart.incrementCartItemQuantity(
                                      widget.data.productId);
                                });
                              },
                              child: Card(
                                elevation: 0,
                                color: Colors.orange,
                                child: Row(
                                  children: [
                                    const VerticalDivider(
                                      width: 0,
                                      color: Colors.transparent,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 6),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.black,
                                        size: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              margin: const EdgeInsets.all(0),
                              elevation: 0,
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: widget.data.quantity > 1
                                        ? const EdgeInsets.symmetric(
                                            vertical: 4.0)
                                        : const EdgeInsets.only(
                                            top: 8, bottom: 4.0),
                                    child: Text(
                                      widget.data.quantity.toString(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _shoppingCart.decrementCartItemQuantity(
                                          widget.data.productId);
                                    },
                                    child: widget.data.quantity > 1
                                        ? Card(
                                            elevation: 0,
                                            color: Colors.transparent,
                                            child: Row(
                                              children: [
                                                const VerticalDivider(
                                                  color: Colors.transparent,
                                                  width: 0,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4, bottom: 4),
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: _shoppingCart
                                                                .getCartItemCount() >
                                                            1
                                                        ? Colors.black
                                                        : Colors.grey,
                                                    size: 14,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                  ),
                                  /* quantity > 1 ? const VerticalDivider() : Container(), */
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, bool removed) {
    final snackBar = SnackBar(
      content: DefaultTextStyle(
        style: TextStyle(
          color: removed ? Colors.white : Theme.of(context).primaryColor,
        ),
        child: Text(
          removed
              ? 'Producto eliminado del carrito.'
              : 'Producto no encontrado en el carrito.',
        ),
      ),
      backgroundColor: removed ? Theme.of(context).primaryColor : Colors.white,
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
