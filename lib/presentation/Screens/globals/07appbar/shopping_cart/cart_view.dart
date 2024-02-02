import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:minegociomenu/core/utils/comunicacion.dart';
import 'package:minegociomenu/libs/shopping/model/cart_model.dart';
import 'package:minegociomenu/libs/shopping/persistent_shopping_cart.dart';
import 'package:minegociomenu/presentation/Screens/globals/07appbar/shopping_cart/components/cart_tile_widget.dart';
import 'package:minegociomenu/presentation/Screens/globals/07appbar/shopping_cart/components/empty_cart_msg_widget.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white, title: const Text('Mi Carrito')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Expanded(
                  child: PersistentShoppingCart().showCartItems(
                    cartTileWidget: ({required data}) =>
                        CartTileWidget(data: data),
                    showEmptyCartMsgWidget: const EmptyCartMsgWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: PersistentShoppingCart().getCartItemCount() > 0
            ? SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 8.0,
                        ),
                        const Text(
                          'Resumen del Carrito',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Subtotal: ',
                            ),
                            PersistentShoppingCart().showTotalAmountWidget(
                              cartTotalAmountWidgetBuilder: (totalAmount) =>
                                  Visibility(
                                visible: totalAmount == 0.0 ? false : true,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          r"$" + totalAmount.toStringAsFixed(2),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ), // Implementa la lógica para calcular el subtotal
                        const Text(
                            'Envío: \$5.00'), // Implementa la lógica para calcular el costo de envío
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 8.0),
                      child: Divider(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 48.0, right: 48.0, bottom: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total a pagar:"),
                          PersistentShoppingCart().showTotalAmountWidget(
                            cartTotalAmountWidgetBuilder: (totalAmount) =>
                                Visibility(
                              visible: totalAmount == 0.0 ? false : true,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        r"$" +
                                            (totalAmount + 5)
                                                .toStringAsFixed(2),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 22),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 32.0, right: 32.0, bottom: 8.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation:
                                  8, // Ajusta el valor según tus necesidades
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              final shoppingCart = PersistentShoppingCart();

                              // Retrieve cart data and total price
                              Map<String, dynamic> cartData =
                                  shoppingCart.getCartData();

                              // Extract cart items and total price
                              List<PersistentShoppingCartItem> cartItems =
                                  cartData['cartItems'];
                              double totalPrice = cartData['totalPrice'];

                              generarInforme(cartItems, context);
                            },
                            child: const SizedBox(
                              height: 64,
                              child: Center(
                                child: Text(
                                  "Agregar al carrito",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              )
            : SizedBox());
  }
}

void generarInforme(cartItems, context) {
  String informe = '';
  String informefinal = '=== Informe de su Orden ===\n';

  for (var item in cartItems) {
    final productName = item.productName;
    final unitPrice = item.unitPrice;
    final quantity = item.quantity;
    final totalPrice = unitPrice * quantity;

    informe =
        '$productName a \$$unitPrice, con un costo de \$$totalPrice por $quantity unidades \n';
    informefinal += informe;
  }

  // Puedes agregar cualquier otra información adicional que desees
  double total = cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  informefinal += '-------------------------------------------\n';
  informefinal += 'Sub total a pagar: \$$total\n';
  informefinal += 'Costo de la mensajeria: \$${5}\n';
  informefinal += 'Total a pagar: \$${total + 5}\n';
  print(informefinal);

  EnviarOrden_whatsapp(context, "51979128", informefinal);
  Navigator.pop(context);
}
