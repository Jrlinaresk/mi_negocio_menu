import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24.0,
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
              left: 0.0, right: 0.0, bottom: 0, top: 48.0),
          child: const SizedBox(
            height: 128,
            width: 212,
            child: Image(
              height: 96.0,
              image: AssetImage('assets/icon/icon_apk.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        // Aquí puedes llamar al widget _textBienvenido o agregar el texto directamente si lo prefieres
        const Text(
          '¡Bienvenido!',
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2c2c2c)),
        ),
        const Text(
          'Mensajero',
          style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ],
    );
  }
}
