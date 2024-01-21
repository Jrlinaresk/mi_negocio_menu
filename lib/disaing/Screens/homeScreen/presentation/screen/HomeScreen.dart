import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/disaing/widgets/categoriaService_Item.dart';
import 'package:minegociomenu/disaing/widgets/categoria_Item.dart';
import 'package:minegociomenu/disaing/widgets/itemTabCustom.dart';
import 'package:minegociomenu/domain/data/remote/servicio/servicios/servicio_provider.dart';
import 'package:minegociomenu/domain/provider/categorias/provider.dart';
import 'package:minegociomenu/domain/provider/clientes/clientesProvider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MyTabBarScreen(),
    );
  }
}

class MyTabBarScreen extends StatefulWidget {
  const MyTabBarScreen({super.key});

  @override
  _MyTabBarScreenState createState() => _MyTabBarScreenState();
}

class _MyTabBarScreenState extends State<MyTabBarScreen> {
  final List<Widget> _tabViews = [
    // Lista de widgets para mostrar en cada pestaña
    const CategoriatListProductos(),
    const CategoriatListServicio(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Número de pestañas
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: TabBar(
              indicator: BoxDecoration(
                color: Colors.white,
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              isScrollable: true,
              tabs: [
                Center(
                  child: ItemTab_Custom(
                    title: "Combos",
                    assetPath: 'logo.png',
                  ),
                ),
                Center(
                  child: ItemTab_Custom(
                    title: "Combos",
                    assetPath: 'logo.png',
                  ),
                ),
                // Center(
                //   child: ItemTab_Custom( title: "Otros"),
                // ),
              ],
            ),
            elevation: 0.0,
          ),
          body: TabBarView(children: _tabViews)),
    );
  }
}

class CategoriatListProductos extends ConsumerWidget {
  const CategoriatListProductos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categorias = ref.watch(categoriasProvider);
    final clientes = ref.watch(clientesProvider);
    return categorias.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (categoriasapi) => ListView.builder(
              itemCount:
                  categoriasapi.length, // Cantidad de elementos en la lista
              itemBuilder: (BuildContext context, int index) {
                // Construir cada elemento de la lista
                final cat = categoriasapi[index];
                return CategoriaItem(categoria: cat);
              },
            ));
  }
}

class CategoriatListServicio extends ConsumerWidget {
  const CategoriatListServicio({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plist = ref.watch(serviciosProvider);
    return plist.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (plist) => ListView.builder(
              itemCount: plist.length, // Cantidad de elementos en la lista
              itemBuilder: (BuildContext context, int index) {
                // Construir cada elemento de la lista
                final service = plist[index];
                return CategoriaSericeItem(service: service);
              },
            ));
  }
}

/* class CategoriatListServicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CategoriatListServicio.length, // Cantidad de elementos en la lista
      itemBuilder: (BuildContext context, int index) {
        // Construir cada elemento de la lista
        final service = CategoriatListServicio[index];
        return ServiceItem(service: service);
      },
    );
  }
} */