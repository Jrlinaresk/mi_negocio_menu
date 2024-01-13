import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class mBottomNavigationBar extends StatefulWidget {
  final Function(int) update_currentIndex; // Función para actualizar el texto
  final Function(String) update_title;
  const mBottomNavigationBar(this.update_currentIndex, this.update_title,
      {super.key, required List<mBottomNavigationBar> items});

  @override
  State<mBottomNavigationBar> createState() => _mBottomNavigationBarState();
}

class _mBottomNavigationBarState extends State<mBottomNavigationBar> {
  var _currentIndex = 0; // Índice seleccionado inicialmente
  late String title;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          switch (index) {
            case 0:
              widget.update_title("Home");
              break;
            case 1:
              widget.update_title("Ubicacion");
              break;
            case 2:
              widget.update_title("Favoritos");
              break;
            case 3:
              widget.update_title("Propietario");
              break;
            default:
              {
                widget.update_currentIndex(-1);
              }
          }
        });

        setState(() {
          widget.update_currentIndex(
              index); // Llama a la función update_currentIndex con el índice
          _currentIndex = index;
        });
      },
      items: const <BottomNavigationBarItem>[
        /// Home
        BottomNavigationBarItem(
          icon: Icon(
            Icons.coffee,
            color: Colors.brown,
          ), //restaurant_menu
          label: "Home",
        ),

        /// Ubicacion
        BottomNavigationBarItem(
          icon: Icon(
            Icons.location_on,
            color: Colors.brown,
          ),
          label: "Ubicacion", //Ubicacion
        ),

        /// Favoritos
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: Colors.brown,
          ),
          label: "Favoritos", //Favoritos
        ),

        /// Propietario
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.brown,
          ),
          label: "Propietario",
        ),
      ],
      selectedItemColor:
          Colors.brown, // Color del ícono y del texto seleccionado
      unselectedItemColor:
          Colors.grey, // Color del ícono y del texto no seleccionado
    );
  }
}
