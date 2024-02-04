import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_fullscreen_image.dart';

import '../imagenes/build_image.dart';

class Edit_Admin_Button extends StatelessWidget {
  final String buttonText;
  final String route;
  final String Image;

  const Edit_Admin_Button({
    Key? key,
    required this.buttonText,
    required this.route,
    required this.Image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: InkWell(
        onTap: () {
          // Manejar el evento de toque
          context.push(route);
        },
        child: Card(
          color: Colors.white,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 64.0,
                  width: 128.0,
                  child:  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(0.0),
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    child: buildFullscreenImage(Image, false),
                  ),),
                 Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    buttonText, // Esto debería ser reemplazado con el título real
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
