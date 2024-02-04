import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/core/utils/example_date.dart';
import 'package:minegociomenu/domain/globalProviders/01categoria/categoria.dart';
import 'package:minegociomenu/domain/models/categoria/categoria.dart';
import 'package:minegociomenu/domain/models/negocios/negocios.dart';
import 'package:minegociomenu/domain/provider/categoria_producto.dart/state_provider.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/Maps/example.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/bloc/bloc.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/homeScreen/MyScreenDasboard.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/screens/product_category_screen.dart';
import 'package:minegociomenu/presentation/widgets/botones/itemTabCustom.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/globalProviders/location/state_provider.dart';
import '../../../../../domain/models/ubicacion/ubicacion.dart';
import '../../../../widgets/cargas/mcircular_progress_indicator.dart';
import '../../filter/CustomDialog.dart';

class MenuList extends ConsumerStatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  MenuListState createState() => MenuListState();
}

class MenuListState extends ConsumerState<MenuList>
    with SingleTickerProviderStateMixin {
  late Negocio negocio;
  late TabController _tabController;

  final List<Widget> _fragmentScreens = [
    // Lista de widgets para mostrar en cada pestaña
    //buttombar
    MyScreen(
      index: 1,
      categoria: 'Cereales',
      verTodos: false,
    ),
/*     const HomeScreen(), */
    const FlutterMapOsrmExample(), // MapaScreen
    const MBloc(),
    //drawer
    ProductCategoryScreen(),
/*     const ProfileScreen(), */
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 7);

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

  @override
  Widget build(BuildContext context) {
    final categoriaListAsyncValue = ref.watch(categoriaProvider);
    AsyncValue<Ubicacion> ubicacionProvider =
    ref.watch(updatedLocationProviderClient);

    var basudir = ubicacionProvider.value;
    // Acceder al valor dentro de AsyncValue
    return categoriaListAsyncValue.when(
      data: (categoriaList) {
        // Aquí puedes mostrar tu widget con la información obtenida
        return DefaultTabController(
          length: categoriaListAsyncValue.value!.length,
          child: Scaffold(
            appBar: AppBar(
              leadingWidth: 300.0,
              actions: [
                Padding(
                  padding:
                  const EdgeInsets.only(top: 0.0, left: 0.0, bottom: 0.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.tune),
                        iconSize: 24,
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CustomDialog();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
              leading:
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 34.0,
                      child: IconButton(
                        icon: const Icon(Icons.location_pin),
                        iconSize: 24,
                        color: Colors.grey,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CustomDialog();
                            },
                          );
                        },
                      ),
                    ),
                    Text(
                        "La Habana, ${basudir!.county}, ${basudir!.suburb},", //${categoriaListAsyncValue.value!.length}
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w200)),
                  ],
                ),
              ),
              automaticallyImplyLeading:
                  false, // Esto ocultará la flecha de retroceso
              backgroundColor: Colors.white,
              elevation: 0,
              toolbarHeight: 70.0,
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
                  for (int i = 0; i < categoriaList.length; i++)
                    Center(
                      child: ItemTab_Custom(
                        title: categoriaList[i].nombre,
                        assetPath: getAssetPath(categoriaList[i].nombre),
                        isSelected: _currentIndex == i,
                      ),
                    ),
                ],
              ),
            ),
            body: IndexedStack(
              index: _currentIndex,
              children: generateScreens(categoriaList, _currentIndex),
            ),
          ),
        );
      },
      loading: () {
        // Aquí se muestra el CircularProgressIndicator mientras se carga la información
        return Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: CustomLoadingIndicator()));
      },
      error: (error, stack) {
        // Manejo de errores si ocurre alguno
        return Text('Error: $error');
      },
    );
  }
}

List<Widget> generateScreens(List<Categoria> categoriaList, int currentIndex) {
  List<Widget> screens = [];

  for (int i = 0; i < categoriaList.length; i++) {
    screens.add(
      MyScreen(
        index: i,
        categoria: categoriaList[i].nombre,
        verTodos: false,
      ),
    );
  }

  return screens;
}

void UpdateCategoriaLastView(WidgetRef ref, Categoria s) {
  //primero cambiar el valor del numero de la catesgoria
/*   ref.read(categoriaProvider.notifier).update((state) => s.id!);
 */
  ref.read(clastView.notifier).update((state) => s);
}
