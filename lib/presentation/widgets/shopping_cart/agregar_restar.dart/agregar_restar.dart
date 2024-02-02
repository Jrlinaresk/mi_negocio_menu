import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/domain/globalProviders/04shoping_car/shoping.dart';
import 'package:minegociomenu/libs/shopping/persistent_shopping_cart.dart';

class AddToCartButton extends ConsumerStatefulWidget {
  final String ProductoID;
  final int onQuantityChanged;

  AddToCartButton({
    super.key,
    required this.onQuantityChanged,
    required this.ProductoID,
  });

  @override
  AddToCartButtonState createState() => AddToCartButtonState();
}

class AddToCartButtonState extends ConsumerState<AddToCartButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final shoppingCart = ref.watch(shoppingCartProvider);

    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Cantidad",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
          ),
          Card(
            elevation: 0,
            color: Colors.white,
            child: SizedBox(
              height: 42.0,
              child: Card(
                margin: const EdgeInsets.all(0),
                elevation: 4,
                color: Colors.white,
                child: Row(
                  children: [
                    Card(
                      margin: const EdgeInsets.all(0),
                      elevation: 0,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              shoppingCart
                                  .decrementCartItemQuantity(widget.ProductoID);
                            },
                            child: shoppingCart.getCartItemCount() > 1
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
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Icon(
                                            Icons.remove,
                                            color: shoppingCart
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
                          Padding(
                            padding: shoppingCart.getCartItemCount() > 1
                                ? const EdgeInsets.symmetric(horizontal: 8.0)
                                : const EdgeInsets.only(left: 16, right: 8.0),
                            child: Text(
                              "3",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() async {
                          shoppingCart
                              .incrementCartItemQuantity(widget.ProductoID);
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
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
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 38.0,
          )
        ],
      ),
    );
  }
}
