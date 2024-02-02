import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minegociomenu/core/services/carrito_service.dart';
import 'package:minegociomenu/domain/models/payment/orden/orden_whatsapp.dart';
import 'package:minegociomenu/domain/models/producto/producto.dart';
import 'package:minegociomenu/libs/shopping/model/cart_model.dart';
import 'package:minegociomenu/libs/shopping/persistent_shopping_cart.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/item_rv_populares.dart';
import 'package:minegociomenu/presentation/widgets/shopping_cart/shopping_cart_item.dart';
import 'package:minegociomenu/domain/models/producto/coffee.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<OrdenWhatsApp> carrito = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _obtenerCarrito();
  }

  Future<void> _obtenerCarrito() async {
    Map<String, dynamic> cartData = PersistentShoppingCart().getCartData();
    List<PersistentShoppingCartItem> cartItems = cartData['cartItems'];
    double totalPriceFromData = cartData['totalPrice'];
// También puedes iterar sobre la lista cartItems si es necesario
    for (PersistentShoppingCartItem cartItem in cartItems) {
      carrito.add(OrdenWhatsApp(
          OrdenID: int.parse(cartItem.productId),
          cantidad: cartItem.quantity,
          producto: Producto(
              nombre: cartItem.productName,
              CategoriaID: 1,
              disponibilidad: cartItem.quantity,
              estado: "1",
              precio: cartItem.unitPrice,
              garantia: "1anno")));
    }
    int a = 0;
    setState(() {
/*       carrito = carritoRecuperado;
 */
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Mi Carrito'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lista de elementos en el carrito
            Expanded(
              child: ListView.builder(
                itemCount: carrito.length, // Número de elementos en el carrito
                itemBuilder: (context, index) {
                  return ShoppingCartItem(
                    productName: carrito[index].producto.nombre,
                    price:
                        carrito[index].producto.precio!, // Precio del producto
                    quantity: carrito[index]
                        .producto
                        .disponibilidad, // Cantidad en el carrito
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Column(
              children: [
                Text(
                  'Resumen del Carrito',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                    'Subtotal: \$60.00'), // Implementa la lógica para calcular el subtotal
                Text(
                    'Envío: \$5.00'), // Implementa la lógica para calcular el costo de envío
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
              child: Divider(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 48.0, right: 48.0, bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total a pagar:"),
                  Text("35USD",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Theme.of(context).primaryColor,
                          fontSize: 28)),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 8, // Ajusta el valor según tus necesidades
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {},
                    child: const SizedBox(
                      height: 64,
                      child: Center(
                        child: Text(
                          "Agregar al carrito",
                          style: TextStyle(
                              fontFamily: 'Roboto', color: Colors.white),
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingCartItem extends StatelessWidget {
  final String productName;
  final double price;
  final int quantity;

  const ShoppingCartItem({
    super.key,
    required this.productName,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShoppingCartProductItem(
            imageUrl: 'https://medias.treew.com/imgproducts/thumbs/159462.jpg',
            title: productName,
            unitPrice: price, date: '14/02/24', // Precio Unitario
            moneda: 'Cup',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
                'Precio final: \$${price.toStringAsFixed(2)} | Cantidad: $quantity'),
          ),
        ],
      ),
    );
  }
}
