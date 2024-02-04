import 'package:flutter/material.dart';

import '../../../core/utils/comunicacion.dart';
import '../../../libs/shopping/model/cart_model.dart';
import '../../../libs/shopping/persistent_shopping_cart.dart';

class ConfirmationCodeDialog extends StatefulWidget {
  final List<PersistentShoppingCartItem> cartItems;
  final BuildContext context;

  const ConfirmationCodeDialog({Key? key, required this.cartItems, required this.context}) : super(key: key);

  @override
  _ConfirmationCodeDialogState createState() => _ConfirmationCodeDialogState();
}

class _ConfirmationCodeDialogState extends State<ConfirmationCodeDialog> {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text('Numero de Transaccion'),
      content: TextField(
        controller: _codeController,
        decoration: const InputDecoration(
          labelText: 'Código',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Cancelar
            Navigator.of(context).pop();
          },
          child: Text('Cancelar', style: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),),
        ),
        ElevatedButton(
          onPressed: () {
            // Aceptar
            String confirmationCode = _codeController.text;
            if(confirmationCode != '')
              {
                generarInforme(widget.cartItems, widget.context, confirmationCode);
                // Aquí puedes guardar la variable `confirmationCode` o realizar
                // cualquier acción que necesites con el código introducido.
                Navigator.of(context).pop();
              }

          },
          child: const Text('Aceptar', style: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),),
        ),
      ],
    );
  }
}

void showConfirmationCodeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ConfirmationCodeDialog(cartItems: [], context: context,);
    },
  );
}

void generarInforme(cartItems, context, confirmationCode) {
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
  informefinal += '-------------------------------------------\n';
  informefinal += 'Mi codigo de confirmacion es: ${confirmationCode} \n';
  print(informefinal);

  EnviarOrden_whatsapp(context, "51979128", informefinal);
  Navigator.pop(context);
  PersistentShoppingCart().clearCart();
}

