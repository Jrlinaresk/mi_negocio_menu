import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/domain/models/producto/producto.dart';
import 'package:minegociomenu/domain/provider/producto_x_categoria.dart';

// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:sizer/sizer.dart';

///
class ItemProductoSearchDelegate extends SearchDelegate<dynamic> {
  final WidgetRef ref;
  ItemProductoSearchDelegate(this.ref);
  late var plist;
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
    plist = ref.watch(productosProvider);
    // Accede al valor dentro de AsyncValue usando el método maybeWhen

    if (query.isEmpty) {
      return Center(
        child: _ListResults(plist),
      );
    } else {
      _filteredProducts =
          plist.where((product) => product.matchesSearch(query)).toList();
    }

    return ListView.builder(
      itemCount: _filteredProducts.length,
      itemBuilder: (BuildContext context, int index) {
        return _SuggestionItemProducto(
          itemProducto: _filteredProducts[index],
        );
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
    loading: () => CircularProgressIndicator(),
    error: (error, stack) => Text('Error: $error'),
    data: (plist) {
      return ListView.builder(
        itemCount: plist.length,
        itemBuilder: (BuildContext context, int index) {
          return _SuggestionItemProducto(
            itemProducto: plist[index],
          );
        },
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
            AssetImage(itemProducto.imageurl ?? "assets/identidad/icono.jpg"),
        fit: BoxFit.contain,
        width: 50,
      ),
      title: Text(itemProducto.nombre ?? 'Desconocido'),
      subtitle: itemProducto.descripcion != null
          ? Text(itemProducto.descripcion!)
          : null, // Si la descripción es nula, no mostrar el subtítulo
      onTap: () {
        // print('hacer algo');
      },
    );
  }
}
