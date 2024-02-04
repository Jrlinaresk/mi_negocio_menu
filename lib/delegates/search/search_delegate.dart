import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/globalProviders/02producto/producto.dart';
import '../../domain/models/producto/producto.dart';
import '../../presentation/Screens/globals/08buttom_nav_bar/homeScreen/menu_detail.dart';
import '../../presentation/widgets/cargas/mcircular_progress_indicator.dart';

// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:sizer/sizer.dart';

///
class ItemProductoSearchDelegate extends SearchDelegate<dynamic> {
  final WidgetRef ref;
  final AsyncValue<List<Producto>> plist;
  ItemProductoSearchDelegate(this.ref,  this.plist);

  late List<Producto> _filteredProducts = [];

  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => 'Buscar Producto';
  // TODO: implement searchFieldStyle

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Accede al valor dentro de AsyncValue usando el método maybeWhen

    return
       plist.when(
        data: (productolist) {
          if (query.isEmpty) {
            return Center(
              child: _ListResults(plist),
            );
          } else {
            _filteredProducts =
                productolist.where((product) => product.matchesSearch(query)).toList();

          }
          // Aquí puedes mostrar tu widget con la información obtenida
          return DefaultTabController(
            length: plist.value!.length,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: ListView.builder(
                itemCount: _filteredProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return _SuggestionItemProducto(
                    itemProducto: _filteredProducts[index],
                  );
                },
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

  Widget _emptyContainer() {
    return const Icon(
      Icons.directions_railway_rounded,
      color: Colors.black38,
      size: 130,
    );
  }
}

Widget _ListResultsOld(List<Producto> plist) {
  return ListView.builder(
    itemCount: plist.length, // Cantidad de elementos en la lista
    itemBuilder: (BuildContext context, int index) {
      // Construir cada elemento de la lista
      return _SuggestionItemProducto(
        itemProducto: plist[index],
      );
    },
  );
}

Widget _ListResults(AsyncValue<List<Producto>> productList) {
  return productList.when(
    loading: () => CustomLoadingIndicator(),
    error: (error, stack) => Text('Error: $error'),
    data: (plist) {
      return Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: plist.length,
          itemBuilder: (BuildContext context, int index) {
            return _SuggestionItemProducto(
              itemProducto: plist[index],
            );
          },
        ),
      );
    },
  );
}

class _SuggestionItemProducto extends StatelessWidget {
  const _SuggestionItemProducto({Key? key, required this.itemProducto})
      : super(key: key);
  final Producto itemProducto;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        image: const NetworkImage('https://via.placeholder.com/300x300'),
        placeholder:
        itemProducto.ImagenUrl != null ? AssetImage(itemProducto.ImagenUrl!.first ) :  const AssetImage("assets/logo.png"),
        fit: BoxFit.contain,
        width: 50,
      ),
      title: Text(itemProducto.nombre ?? 'Desconocido', style: TextStyle(color: Theme.of(context).primaryColor),), //
      subtitle:
      itemProducto.marca != null
          ? Text(itemProducto.descripcion!)
          : null, // Si la descripción es nula, no mostrar el subtítulo
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MenuDetail(
              imageUrl: "assets/logo.png",
              producto: itemProducto); // Asegúrate de tener una variable llamada "coffee"
        }));
      },
    );
  }
}
