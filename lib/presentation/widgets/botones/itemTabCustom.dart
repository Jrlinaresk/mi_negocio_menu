import 'package:flutter/material.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_image.dart';

class ItemTab_Custom extends StatefulWidget {
  final String title;
  String? assetPath;
  final bool isSelected;
  bool? v2;

  ItemTab_Custom({
    required this.title,
    this.assetPath,
    this.isSelected = false,
    this.v2,
    Key? key,
  }) : super(key: key);

  @override
  State<ItemTab_Custom> createState() => _ItemTab_CustomState();
}

class _ItemTab_CustomState extends State<ItemTab_Custom> {
  @override
  Widget build(BuildContext context) {
    double alto = 32;
    return Card(
      elevation: widget.v2 == null ? 4 : 0,
      color: widget.v2 == null
          ? widget.isSelected
              ? const Color.fromARGB(
                  255, 255, 204, 36) // Color amarillo cuando está seleccionado
              : Theme.of(context)
                  .primaryColor // Color blanco cuando no está seleccionado
          : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            widget.assetPath != null
                ? buildImage(widget.assetPath!, false, alto, true)
                : Container(),
            const SizedBox(width: 8.0), // Espacio entre el ícono y el texto
            Align(
              alignment: Alignment.center,
              child: Text(widget.title,
                  style: widget.v2 == null
                      ? const TextStyle(fontSize: 12.0, color: Colors.white)
                      : TextStyle(
                          fontSize: 12.0,
                          color: Theme.of(context).primaryColor)),
            ),
          ],
        ),
      ),
    );
  }
}
