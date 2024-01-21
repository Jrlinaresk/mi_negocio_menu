import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/item_rv_populares.dart';
import 'package:minegociomenu/presentation/widgets/shopping_cart/shopping_cart_item.dart';
import 'package:minegociomenu/domain/models/coffee.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

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
                itemCount: 3, // Número de elementos en el carrito
                itemBuilder: (context, index) {
                  return ShoppingCartItem(
                    productName: 'Producto $index',
                    price: 20.0, // Precio del producto
                    quantity: 2, // Cantidad en el carrito
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
    List<Coffee> coffees = [
      Coffee(
        coffeeIcon: FontAwesomeIcons.coffee,
        name: "Clásico",
        price: 500,
        moneda: "cup",
        lastprice: 200,
      ),
      Coffee(
        coffeeIcon: FontAwesomeIcons.coffee,
        name: "Cortadito",
        price: 600,
        moneda: "cup",
        lastprice: 200,
      ),
      Coffee(
        coffeeIcon: FontAwesomeIcons.coffee,
        name: "Bombón",
        price: 350,
        moneda: "cup",
        lastprice: 200,
      ),
      Coffee(
        coffeeIcon: FontAwesomeIcons.coffee,
        name: "ConLeche",
        price: 150,
        moneda: "cup",
        lastprice: 200,
      ),
      Coffee(
        coffeeIcon: FontAwesomeIcons.coffee,
        name: "Americano con Azúcar",
        price: 150,
        moneda: "cup",
        lastprice: 200,
      ),
      Coffee(
        coffeeIcon: FontAwesomeIcons.coffee,
        name: "Americano con Azúcar",
        price: 150,
        moneda: "cup",
        lastprice: 200,
      ),
      Coffee(
        coffeeIcon: FontAwesomeIcons.coffee,
        name: "Americano con Azúcar",
        price: 150,
        moneda: "cup",
        lastprice: 200,
      ),
      Coffee(
        coffeeIcon: FontAwesomeIcons.coffee,
        name: "Americano con Azúcar",
        price: 150,
        moneda: "cup",
        lastprice: 200,
      ),
    ];

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShoppingCartProductItem(
            imageUrl: 'https://medias.treew.com/imgproducts/thumbs/159462.jpg',
            title: 'Nombre del Producto',
            unitPrice: 20.0, date: '14/02/24', // Precio Unitario
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
