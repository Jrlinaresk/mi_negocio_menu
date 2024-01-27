import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/core/utils/example_date.dart';
import 'package:minegociomenu/domain/globalProviders/01categoria/categoria.dart';
import 'package:minegociomenu/domain/globalProviders/03negocio/negocio.dart';
import 'package:minegociomenu/domain/models/negocios/negocios.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/homeScreen/MyScreenDasboard.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/profileScreen/presentation/screens/ProfileScreen.dart';
import 'package:minegociomenu/presentation/Screens/globals/09drawer/SettingsScreen.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/homeScreen/MyScreenDasboard.dart';
import 'package:minegociomenu/presentation/widgets/botones/itemTabCustom.dart';
import 'package:flutter/material.dart';

class MenuList extends ConsumerStatefulWidget {
  const MenuList({super.key});

  @override
  MenuListState createState() => MenuListState();
}

class MenuListState extends ConsumerState<MenuList>
    with SingleTickerProviderStateMixin {
  late Negocio negocio;
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
    final categoriaListAsyncValue = ref.watch(categoriaProvider);
    // Acceder al valor dentro de AsyncValue
    return categoriaListAsyncValue.when(
      data: (negocioList) {
        // Aquí puedes mostrar tu widget con la información obtenida
        return DefaultTabController(
          length: 1,
          child: Scaffold(
            backgroundColor: Colors.red,
            appBar: AppBar(
              automaticallyImplyLeading:
                  false, // Esto ocultará la flecha de retroceso
              backgroundColor: const Color.fromARGB(255, 255, 251, 238),
              elevation: 0,
              toolbarHeight: 64,
              title: const Padding(
                padding: EdgeInsets.only(top: 16.0, left: 0.0, bottom: 16.0),
                child: Text("Te ofrecemos todo tipo de productos",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
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
                  for (int i = 0; i < negocioList.length; i++)
                    Center(
                      child: ItemTab_Custom(
                        title: negocioList[i].nombre,
                        assetPath: getAssetPath(negocioList[i].nombre),
                        isSelected: _currentIndex == i,
                      ),
                    ),
                ],
              ),
            ),
            body: TabBarView(children: _tabViews),
          ),
        );
      },
      loading: () {
        // Aquí se muestra el CircularProgressIndicator mientras se carga la información
        return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: CircularProgressIndicator()));
      },
      error: (error, stack) {
        // Manejo de errores si ocurre alguno
        return Text('Error: $error');
      },
    );
  }
}
