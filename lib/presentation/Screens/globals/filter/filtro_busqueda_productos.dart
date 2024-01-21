import 'package:flutter/material.dart';

class FiltroBusquedaProductos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.2, // Tamaño inicial del primer paso
        minChildSize: 0.2, // Tamaño mínimo del primer paso
        maxChildSize: 0.2, // Tamaño máximo del segundo paso
        expand: true,
        snap: true,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.red,
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Filtro de Búsqueda',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Aquí puedes agregar los elementos de tu filtro de búsqueda, como TextField, DropdownButton, etc.
                  // Por ejemplo:
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Palabra clave',
                        hintText: 'Ingrese palabra clave...',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Agrega más elementos de filtro según tus necesidades
                  // ...
                  // Botón para aplicar el filtro
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para aplicar el filtro
                      Navigator.pop(context); // Cerrar el BottomSheet
                    },
                    child: const Text('Aplicar Filtro'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
