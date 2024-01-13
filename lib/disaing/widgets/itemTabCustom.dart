import 'package:flutter/material.dart';

class ItemTab_Custom extends StatefulWidget {
  final String title; // Variable para almacenar el título
  const ItemTab_Custom({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<ItemTab_Custom> createState() => _ItemTab_CustomState();
}

class _ItemTab_CustomState extends State<ItemTab_Custom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
/*         Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 0.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/iconotemporalCategoria.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 4.0), */
        Row(
          children: [
            //_IconoCircular(),
            const SizedBox(width: 8.0), // Espacio entre el ícono y el texto
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

Widget _IconoCircular() {
  return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 8.0, right: 0.0),
      height: 32.0,
      width: 32.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/iconotemporalCategoria.png'), //alguna pacotilla para adornar
          fit: BoxFit.cover, // para que ocupe todo el espacio
        ),
      ));
}
