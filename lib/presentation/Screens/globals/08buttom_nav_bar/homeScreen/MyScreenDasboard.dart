import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minegociomenu/core/Helpers/random_generator.dart';
import 'package:minegociomenu/domain/globalProviders/02producto/last_view.dart';
import 'package:minegociomenu/domain/globalProviders/02producto/producto.dart';
import 'package:minegociomenu/domain/models/producto/producto.dart';
import 'package:minegociomenu/domain/provider/categoria_producto.dart/state_provider.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/homeScreen/ver_todos.dart';
import 'package:minegociomenu/presentation/Screens/globals/filter/CustomDialog.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/homeScreen/menu_detail.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/sub_cat_custom_card.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/list_productos.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_fullscreen_image.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_image.dart';
import 'package:minegociomenu/presentation/widgets/promos/simple_promo.dart';
import 'package:minegociomenu/presentation/widgets/titles/title_de_lista.dart';
import 'package:minegociomenu/domain/models/producto/coffee.dart';

class MyScreen extends ConsumerStatefulWidget {
  final int index;
  final String categoria;
  bool verTodos;
  MyScreen(
      {Key? key,
      required this.index,
      required this.categoria,
      required this.verTodos})
      : super(key: key);

  @override
  MyScreenState createState() => MyScreenState();
}

class MyScreenState extends ConsumerState<MyScreen> {
  var text = "Encuentra facil lo que buscas...";
  @override
  Widget build(BuildContext context) {
    var cat = widget.index + 1;
    final productosListAsyncValue = ref.watch(productosProvider(cat));

    // Acceder al valor dentro de AsyncValue
    return !widget.verTodos
        ? productosListAsyncValue.when(
            data: (productos) {
              // Aquí puedes mostrar tu widget con la información obtenida
              return productos.isNotEmpty
                  ? Scaffold(
                      backgroundColor: Colors.white,
                      body: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 0.0,
                                    left: 16.0,
                                    bottom: 0.0,
                                    right: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(text,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w100)),
                                    IconButton(
                                      icon: const Icon(Icons.filter_list_outlined),
                                      iconSize: 24,
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const CustomDialog();
                                          },
                                        );
/*                       showModalBottomSheet(
                        barrierColor: Colors.transparent,'
                        showDragHandle: true,
                        isDismissible: true,
                        useSafeArea: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (BuildContext context) {
                          return FiltroBusquedaProductos(); //FiltroBusquedaProductos() GrabbingWidget
                        },
                      ); */
                                      },
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0.0, right: 16.0),
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children:
                                        productos.map((Producto producto) {
                                      return FutureBuilder<dynamic>(
                                        future: RandomGenerator.GeTimageRandom(
                                            widget.categoria),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            // Muestra un indicador de carga mientras se obtiene la imagen
                                            return SizedBox(
                                              width: 160,
                                              height: 160,
                                              child: Center(
                                                  child: buildImage(
                                                      'loading.gif', false)),
                                            );
                                          } else if (snapshot.hasError) {
                                            // Manejar error si ocurre
                                            return Text(
                                                'Error: ${snapshot.error}');
                                          } else {
                                            var imageUrls = snapshot.data;
                                            return Container(

                                              child: GestureDetector(
                                                child: Sub_Cat_CustomCard(
                                                  imageUrl: imageUrls!,
                                                  text: producto.nombre,
                                                  cardColor:
                                                      const Color(0xfff6F6F6),
                                                  cardSize: 128,
                                                  price: producto.precio!,
                                                  moneda: producto.moneda!.first,
                                                  lastprice: producto.lastprice!,
                                                ),
                                                onTap: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return MenuDetail(
                                                        imageUrl: imageUrls,
                                                        producto: producto);
                                                  }));
                                                },
                                              ),
                                            );
                                          }
                                        },
                                      );
                                    }).toList(),
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Title_List_Content(
                                  text: "Te recomendamos...",
                                  linkText: "Ver Todos",
                                  linkUrl: "https://example.com",
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0,
                                      left: 16.0,
                                      bottom: 0.0,
                                      right: 16.0),
                                  child: GestureDetector(
                                    onTap: () => {
                                      setState(() {
                                        widget.verTodos = !widget.verTodos;
                                        text = "Te recomendamos...";
                                      })
                                    },
                                    child: const Text(
                                      'Ver Todos',
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //
                            FutureBuilder<dynamic>(
                              future: RandomGenerator.GeTimageRandom(
                                  widget.categoria),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  // Muestra un indicador de carga mientras se obtiene la imagen
                                  return SizedBox(
                                    width: 160,
                                    height: 160,
                                    child: Center(
                                        child:
                                            buildImage('loading.gif', false)),
                                  );
                                } else if (snapshot.hasError) {
                                  // Manejar error si ocurre
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  var imageUrls = snapshot.data;
                                  return //imageUrls!
                                      Container();
                                }
                              },
                            ),
                            List_productos_Widget(
                              itemCount:
                                  productos.length > 6 ? 5 : productos.length,
                              orientation: Axis.vertical,
                              categoria: widget.categoria,
                              categoriaID: cat,
                            ),
                            PromoWidget(
                                'https://medias.treew.com/sliders/yeyashort_spa.jpg',
                                true,
                                true),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Title_List_Content(
                                  text: "Ofertas Especiales...",
                                  linkText: "Ver Todos",
                                  linkUrl: "https://example.com",
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0,
                                      left: 16.0,
                                      bottom: 0.0,
                                      right: 16.0),
                                  child: GestureDetector(
                                    onTap: () => {
                                      setState(() {
                                        widget.verTodos = !widget.verTodos;
                                        text = "Ofertas Especiales...";
                                      })
                                    },
                                    child: const Text(
                                      'Ver Todos',
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            List_productos_Widget(
                              itemCount:
                                  productos.length > 6 ? 5 : productos.length,
                              orientation: Axis.horizontal,
                              categoria: widget.categoria,
                              categoriaID: cat,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Title_List_Content(
                                  text: "Populares...",
                                  linkText: "Ver Todos",
                                  linkUrl: "https://example.com",
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0,
                                      left: 16.0,
                                      bottom: 0.0,
                                      right: 16.0),
                                  child: GestureDetector(
                                    onTap: () => {
                                      setState(() {
                                        widget.verTodos = !widget.verTodos;
                                        text = "Populares...";
                                      })
                                    },
                                    child: const Text(
                                      'Ver Todos',
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            List_productos_Widget(
                              itemCount:
                                  productos.length > 6 ? 5 : productos.length,
                              orientation: Axis.horizontal,
                              categoria: widget.categoria,
                              categoriaID: cat,
                            ),
                            PromoWidget(
                                'https://medias.treew.com/sliders/yeyashort_spa.jpg',
                                true,
                                false),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Title_List_Content(
                                  text: "Liquidación...",
                                  linkText: "Ver Todos",
                                  linkUrl: "https://example.com",
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0,
                                      left: 16.0,
                                      bottom: 0.0,
                                      right: 16.0),
                                  child: GestureDetector(
                                    onTap: () => {
                                      setState(() {
                                        widget.verTodos = !widget.verTodos;
                                        text = "Liquidación...";
                                      })
                                    },
                                    child: const Text(
                                      'Ver Todos',
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            List_productos_Widget(
                              itemCount:
                                  productos.length > 6 ? 5 : productos.length,
                              orientation: Axis.horizontal,
                              categoria: widget.categoria,
                              categoriaID: cat,
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.white,
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(bottom: 96.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          //
                          children: [
                            SizedBox(
                              width: 220,
                              child: Text(
                                  "En este momento no contamos con productos de esta categoría.",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.center),
                            ),
                            SizedBox(
                                width: 128.0,
                                height: 128.0,
                                child: buildFullscreenImage(
                                    "assets/category.png", false)),
                          ],
                        ),
                      )),
                    );
            },
            loading: () {
              // Aquí se muestra el CircularProgressIndicator mientras se carga la información
              return Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(child: buildImage('loading.gif', false)));
            },
            error: (error, stack) {
              // Manejo de errores si ocurre alguno
              return Text('Error: $error');
            },
          )
        : MyScreen_ver_todo(
            index: widget.index,
            categoria: widget.categoria,
            texto: text,
          );
  }
}
