import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class mSalomonBottomBar extends StatefulWidget {
  final Function(int) update_currentIndex; // Función para actualizar el texto
  final Function(String) update_title;
  const mSalomonBottomBar(this.update_currentIndex, this.update_title,
      {super.key});

  @override
  State<mSalomonBottomBar> createState() => _mSalomonBottomBarState();
}

class _mSalomonBottomBarState extends State<mSalomonBottomBar> {
  var _currentIndex = 0; // Índice seleccionado inicialmente
  late String title;
  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          switch (index) {
            case 0:
              widget.update_title("Home");
              break;
            case 1:
              widget.update_title("Perfil");
              break;
            case 2:
              widget.update_title("Configuraciones");
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
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          title: const Text("Home"),
          selectedColor: Colors.purple,
        ),

        /// Perfil
        SalomonBottomBarItem(
          icon: const Icon(Icons.supervised_user_circle),
          title: const Text("Perfil"),
          selectedColor: Colors.blue,
        ),

        /// Config
        SalomonBottomBarItem(
          icon: const Icon(Icons.settings),
          title: const Text("Configuraciones"),
          selectedColor: Colors.teal,
        ),
      ],
    );
  }
}
