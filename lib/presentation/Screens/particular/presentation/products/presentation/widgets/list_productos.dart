import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/domain/globalProviders/02producto/producto.dart';
import 'package:minegociomenu/domain/models/producto/producto.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/item_rv_populares.dart';
import 'package:minegociomenu/domain/models/producto/coffee.dart';

class List_productos_Widget extends ConsumerStatefulWidget {
  final int itemCount;
  final Axis orientation;

  List_productos_Widget({
    required this.itemCount,
    required this.orientation,
  });

  @override
  List_productos_WidgetState createState() => List_productos_WidgetState();
}

class List_productos_WidgetState extends ConsumerState<List_productos_Widget> {
  @override
  Widget build(BuildContext context) {
    final productosListAsyncValue = ref.watch(productosProvider(3));
    final ass = productosListAsyncValue.value;

    Widget listWidget;
    Widget mcontent;

    if (widget.orientation == Axis.vertical) {
      mcontent =
          // Vertical: Usa una Column
          listWidget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: ass!.take(widget.itemCount).map((Producto producto) {
          return productosListAsyncValue.when(
            data: (productos) {
              // Aquí puedes mostrar tu widget con la información obtenida
              return ItemRvPopulares(
                imageUrl:
                    'https://medias.treew.com/imgproducts/thumbs/159462.jpg',
                title: producto.nombre,
                subtitle: producto.marca!,
                date: '7USD',
                rating: 3.5,
                starCount: 0,
                isFavorite: false,
                price: [producto.lastprice!, producto.precio!],
                producto: producto,
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
        }).toList(),
      );
    } else {
      // Horizontal: Usa una Row
      listWidget = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: ass!.take(widget.itemCount).map((Producto producto) {
          return productosListAsyncValue.when(
            data: (productos) {
              // Aquí puedes mostrar tu widget con la información obtenida
              return ItemRvPopulares(
                imageUrl:
                    'https://medias.treew.com/imgproducts/thumbs/159462.jpg',
                title: 'Nombre del producto',
                subtitle: 'Marca',
                date: '7USD',
                rating: 3.5,
                starCount: 0,
                isFavorite: false,
                price: const [17, 12],
                producto: producto,
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
        }).toList(),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(
        top: 0.0,
        left: 16.0,
        bottom: 16.0,
        right: 16.0,
      ),
      child: SingleChildScrollView(
        scrollDirection: widget.orientation,
        child: listWidget,
      ),
    );
  }
}
