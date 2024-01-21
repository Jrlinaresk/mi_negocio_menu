import 'package:flutter/material.dart';

class ShoppingCartProductItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final double unitPrice;
  final String moneda;

  ShoppingCartProductItem(
      {required this.imageUrl,
      required this.title,
      required this.date,
      required this.unitPrice,
      required this.moneda});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ShoppingCartItem(
        imageUrl: imageUrl,
        title: title,
        orderDate: date,
        unitPrice: unitPrice,
        moneda: moneda,
      ),
      onTap: () {
        // Implementa la lógica para navegar a los detalles del producto
      },
    );
  }
}

class ShoppingCartItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String orderDate;
  final double unitPrice;
  final String moneda;

  const ShoppingCartItem({
    required this.imageUrl,
    required this.title,
    required this.orderDate,
    required this.unitPrice,
    required this.moneda,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        imageUrl,
        width: 50.0,
        height: 50.0,
        fit: BoxFit.cover,
      ),
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Orden: $orderDate'),
          Text('Precio Unitario: \$${unitPrice.toStringAsFixed(2)}'),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.remove_shopping_cart),
        onPressed: () {
          // Implementa la lógica para eliminar el producto del carrito
        },
      ),
    );
  }
}
