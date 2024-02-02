import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/core/Helpers/random_generator.dart';
import 'package:minegociomenu/domain/globalProviders/02producto/producto.dart';
import 'package:minegociomenu/domain/models/producto/producto.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/item_rv_populares.dart';
import 'package:minegociomenu/domain/models/producto/coffee.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_image.dart';

class List_productos_Widget extends ConsumerStatefulWidget {
  final int itemCount;
  final int categoriaID;
  final Axis orientation;
  final String categoria;

  List_productos_Widget({
    required this.itemCount,
    required this.orientation,
    required this.categoria,
    required this.categoriaID,
  });

  @override
  List_productos_WidgetState createState() => List_productos_WidgetState();
}

class List_productos_WidgetState extends ConsumerState<List_productos_Widget> {
  @override
  Widget build(BuildContext context) {
    final productosListAsyncValue =
        ref.watch(productosProvider(widget.categoriaID));
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
              return FutureBuilder<dynamic>(
                future: RandomGenerator.GeTimageRandom(widget.categoria),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Muestra un indicador de carga mientras se obtiene la imagen
                    return SizedBox(
                      width: 160,
                      height: 160,
                      child: Center(
                          child: buildImage('loading.gif',
                              false)), //CircularProgressIndicator()
                    );
                  } else if (snapshot.hasError) {
                    // Manejar error si ocurre
                    return Text('Error: ${snapshot.error}');
                  } else {
                    var imageUrls = snapshot.data;
                    return //imageUrls!
                        ItemRvPopulares(
                      imageUrl: imageUrls,
                      title: producto.nombre,
                      subtitle: producto.marca!,
                      date: '7USD',
                      rating: 3.5,
                      starCount: 0,
                      isFavorite: false,
                      price: [producto.lastprice!, producto.precio!],
                      producto: producto,
                    );
                  }
                },
              );
            },
            loading: () {
              // Aquí se muestra el CircularProgressIndicator mientras se carga la información
              return Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                      child: buildImage(
                          'loading.gif', false))); //CircularProgressIndicator()
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
              return FutureBuilder<dynamic>(
                future: RandomGenerator.GeTimageRandom(widget.categoria),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Muestra un indicador de carga mientras se obtiene la imagen
                    return SizedBox(
                      width: 160,
                      height: 160,
                      child: Center(
                          child: buildImage('loading.gif',
                              false)), //CircularProgressIndicator()
                    );
                  } else if (snapshot.hasError) {
                    // Manejar error si ocurre
                    return Text('Error: ${snapshot.error}');
                  } else {
                    var imageUrls = snapshot.data;
                    return //imageUrls!
                        ItemRvPopulares(
                      imageUrl: imageUrls,
                      title: producto.nombre,
                      subtitle: producto.marca!,
                      date: '7USD',
                      rating: 3.5,
                      starCount: 0,
                      isFavorite: false,
                      price: [producto.lastprice!, producto.precio!],
                      producto: producto,
                    );
                  }
                },
              );
            },
            loading: () {
              // Aquí se muestra el CircularProgressIndicator mientras se carga la información
              return Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                      child: Center(
                          child: buildImage('loading.gif',
                              false) //CircularProgressIndicator()
                          )));
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
