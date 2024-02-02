import 'package:flutter/material.dart';

class EmptyCartMsgWidget extends StatelessWidget {
  const EmptyCartMsgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: SizedBox(
      height: size.height * .7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Su carrito esta vacio'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Comprar ahora!',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                    color: Colors.white)),
          ),
        ],
      ),
    ));
  }
}
