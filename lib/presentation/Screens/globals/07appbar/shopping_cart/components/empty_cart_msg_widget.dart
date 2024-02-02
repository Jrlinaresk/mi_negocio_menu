import 'package:flutter/material.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_fullscreen_image.dart';

class EmptyCartMsgWidget extends StatelessWidget {
  const EmptyCartMsgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(bottom: 96.0),
      child: SizedBox(
        height: size.height * .7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 128.0,
                height: 128.0,
                child: buildFullscreenImage("assets/cart.png", false)),
            const SizedBox(height: 16),
            const Text('Tu carrito esta vacio'),
            const SizedBox(height: 4),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Comprar ahora',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                )),
          ],
        ),
      ),
    ));
  }
}
