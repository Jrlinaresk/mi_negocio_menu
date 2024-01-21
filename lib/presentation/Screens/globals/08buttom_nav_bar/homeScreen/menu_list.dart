import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/homeScreen/MyScreenDasboard.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/profileScreen/presentation/screens/ProfileScreen.dart';
import 'package:minegociomenu/presentation/Screens/globals/09drawer/SettingsScreen.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/homeScreen/MyScreenDasboard.dart';
import 'package:minegociomenu/presentation/widgets/botones/itemTabCustom.dart';
import 'package:flutter/material.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);

    // Agregar un listener para escuchar los cambios en el TabController
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _currentIndex = 0;

  final List<Widget> _tabViews = [
    // Lista de widgets para mostrar en cada pestaña
    MyScreen(), //YourScreen MyScreen
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading:
              false, // Esto ocultará la flecha de retroceso
          backgroundColor: const Color.fromARGB(255, 255, 251, 238),
          elevation: 0,
          toolbarHeight: 64,
          title: const Padding(
            padding: EdgeInsets.only(top: 16.0, left: 0.0, bottom: 16.0),
            child: Text("Te ofrecemos todo tipo de productos",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
          ),
          bottom: TabBar(
            controller: _tabController, // Usar el controlador del TabBar
            indicator: const BoxDecoration(
              color: Colors.transparent,
            ),
            labelColor: const Color.fromARGB(255, 200, 255, 0),
            unselectedLabelColor: Colors.grey.shade500,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorWeight: 8,
            labelPadding: const EdgeInsets.symmetric(
                horizontal: 4.0), // Ajusta el valor según tus necesidades
            tabs: [
              Center(
                child: ItemTab_Custom(
                  title: "Cereales",
                  assetPath: 'categorias/ic_granos.png',
                  isSelected: _currentIndex == 0,
                ),
              ),
              Center(
                child: ItemTab_Custom(
                  title: "Carnes",
                  assetPath: 'categorias/ic_carnes.png',
                  isSelected: _currentIndex == 1,
                ),
              ),
              Center(
                child: ItemTab_Custom(
                  title: "Bebidas",
                  assetPath: 'categorias/ic_bebidas.png',
                  isSelected: _currentIndex == 2,
                ),
              ),
              Center(
                child: ItemTab_Custom(
                  title: "Dulces",
                  assetPath: 'categorias/ic_dulces.png',
                  isSelected: _currentIndex == 3,
                ),
              ),
              Center(
                child: ItemTab_Custom(
                  title: "Panaderia",
                  assetPath: 'categorias/ic_panaderia.png',
                  isSelected: _currentIndex == 4,
                ),
              ),
              Center(
                child: ItemTab_Custom(
                  title: "Lácteos",
                  assetPath: 'categorias/ic_lacteos.png',
                  isSelected: _currentIndex == 5,
                ),
              ),
              Center(
                child: ItemTab_Custom(
                  title: "Enlatados",
                  assetPath: 'categorias/ic_enlatados.png',
                  isSelected: _currentIndex == 6,
                ),
              ),
              Center(
                child: ItemTab_Custom(
                  title: "Combos",
                  assetPath: 'categorias/ic_combos.png',
                  isSelected: _currentIndex == 7,
                ),
              ),
              // Center(
              //   child: ItemTab_Custom( title: "Otros"),
              // ),
            ],
          ),
        ),
        body: TabBarView(children: _tabViews),
      ),
    );
  }
}
