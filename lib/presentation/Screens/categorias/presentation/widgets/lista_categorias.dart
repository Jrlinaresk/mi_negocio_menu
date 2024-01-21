import 'package:flutter/material.dart';

class ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 196.0, // Altura de la lista horizontal
/*       child: ListView.builder(
        scrollDirection: Axis.horizontal, // Dirección horizontal
        itemCount: cattList.length, // Cantidad de elementos en la lista
        itemBuilder: (BuildContext context, int index) {
          // Construir cada elemento de la lista
          return SuggestionItemProducto(
            itemProducto: cattList[index],
          );
        },
      ), */
    );
  }
}
