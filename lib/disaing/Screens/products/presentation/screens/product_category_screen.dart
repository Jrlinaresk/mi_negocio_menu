import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/disaing/widgets/productItem.dart';
import 'package:minegociomenu/domain/data/db/favoritos_database.dart';
import 'package:minegociomenu/domain/globalProviders/producto/state_provider.dart';
import 'package:minegociomenu/domain/globalProviders/producto_state_notifier_provider.dart';

class ProductCategoryScreen extends ConsumerWidget {
  final FavoritosDatabase favoritosDatabase = FavoritosDatabase();

  ProductCategoryScreen({super.key}) {
    favoritosDatabase.initializeDatabase();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastview = ref.watch(lastView);
    return Center(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(lastview.name),
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
    final plist = ref
        .watch(ProductoStateNotifierProvider)
        .where((element) => element.types.contains(lastview.name))
        .toList();
    return ListView.builder(
      itemCount: plist.length, // Cantidad de elementos en la lista
      itemBuilder: (BuildContext context, int index) {
        // Construir cada elemento de la lista
        return ProductItem(product: plist[index], index: index);
      },
    );
  }
}
