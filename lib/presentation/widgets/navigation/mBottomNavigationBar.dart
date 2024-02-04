import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class mBottomNavigationBar extends StatefulWidget {
  final Function(int) update_currentIndex; // Función para actualizar el texto
  final Function(String) update_title;
  final bool isUserLoggedIn;
  const mBottomNavigationBar(this.update_currentIndex, this.update_title,
      {super.key, required List<mBottomNavigationBar> items, required this.isUserLoggedIn});

  @override
  State<mBottomNavigationBar> createState() => _mBottomNavigationBarState();
}

class _mBottomNavigationBarState extends State<mBottomNavigationBar> {
  var _currentIndex = 0; // Índice seleccionado inicialmente
  late String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        child: BottomNavigationBar(
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
                // case 2:
                //   widget.update_title("Favoritos");
                //   break;
                // case 3:
                //   widget.update_title("Propietario");
                //   break;
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
              activeIcon: Icon(
                Icons.home,
                color: Color(0xffFFD54B),
              ),
              icon: Icon(
                Icons.home,
                color: Color.fromARGB(81, 255, 255, 255),
              ), //restaurant_menu
              label: "Home",
            ),

            /// Ubicacion
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.location_on,
                color: Color(0xffFFD54B),
              ),
              icon: Icon(
                Icons.location_on,
                color: Color.fromARGB(81, 255, 255, 255),
              ),
              label: "Ubicacion", //Ubicacion
            ),

            // /// Favoritos
            // BottomNavigationBarItem(
            //   activeIcon: Icon(
            //     Icons.favorite,
            //     color: Color(0xffFFD54B),
            //   ),
            //   icon: Icon(
            //     Icons.favorite,
            //     color: Color.fromARGB(81, 255, 255, 255),
            //   ),
            //   label: "Favoritos", //Favoritos
            // ),

            // /// Propietario
            // BottomNavigationBarItem(
            //   activeIcon: Icon(
            //     Icons.person,
            //     color: Color(0xffFFD54B),
            //   ),
            //   icon: Icon(
            //     Icons.person,
            //     color: Color.fromARGB(81, 255, 255, 255),
            //   ),
            //   label: "Propietario",
            // ),
          ],
          selectedItemColor: const Color(
              0xffFFD54B), // Color del ícono y del texto seleccionado
          unselectedItemColor: Colors
              .grey.shade100, // Color del ícono y del texto no seleccionado
        ),
      ),
    );
  }
}
