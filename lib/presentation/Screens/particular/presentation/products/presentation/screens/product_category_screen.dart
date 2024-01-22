import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/domain/globalProviders/02producto/last_view.dart';
import 'package:minegociomenu/domain/globalProviders/02producto/producto.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/productItem.dart';
import 'package:minegociomenu/domain/data/db/favoritos_database.dart';

//ver todos los productos de x categoria
class ProductCategoryScreen extends ConsumerWidget {
  final FavoritosDatabase favoritosDatabase = FavoritosDatabase();

  ProductCategoryScreen({super.key}) {
    favoritosDatabase.initializeDatabase();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastview = ref.watch(plastView);
    return Center(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(lastview.nombre),
          ),
          body: ProductList(
              favoritosDatabase: favoritosDatabase, lastview: lastview)),
    );
  }
}

class ProductList extends ConsumerWidget {
  final FavoritosDatabase favoritosDatabase;
  final lastview;
  const ProductList(
      {super.key, required this.favoritosDatabase, required this.lastview});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var productListAsyncValue = ref.watch(productosProvider);
    final Productlastview = ref.watch(plastView);

    // Acceder al valor dentro de AsyncValue
    final productList = productListAsyncValue.value ?? [];

    // Ahora puedes usar el método 'where'
    final plist =
        productList.where((p) => p.types!.contains(lastview.name)).toList();

    return ListView.builder(
      itemCount: plist.length, // Cantidad de elementos en la lista
      itemBuilder: (BuildContext context, int index) {
        // Construir cada elemento de la lista
        return ProductItem(product: plist[index], index: index);
      },
    );
  }
}
