import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minegociomenu/domain/globalProviders/02producto/producto.dart';
import 'package:minegociomenu/domain/models/producto/producto.dart';
import 'package:minegociomenu/presentation/Screens/globals/filter/CustomDialog.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/homeScreen/menu_detail.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/sub_cat_custom_card.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/list_productos.dart';
import 'package:minegociomenu/presentation/widgets/promos/simple_promo.dart';
import 'package:minegociomenu/presentation/widgets/titles/title_de_lista.dart';
import 'package:minegociomenu/domain/models/producto/coffee.dart';

class MyScreen extends ConsumerStatefulWidget {
  const MyScreen({super.key});

  @override
  MyScreenState createState() => MyScreenState();
}

class MyScreenState extends ConsumerState<MyScreen> {
  @override
  Widget build(BuildContext context) {
    final productosListAsyncValue = ref.watch(productosProvider(3));

    // Acceder al valor dentro de AsyncValue
    return productosListAsyncValue.when(
      data: (productos) {
        // Aquí puedes mostrar tu widget con la información obtenida
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 16.0, bottom: 0.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Encuentra facil lo que buscas...",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w100)),
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
/*                       showModalBottomSheet(
                        barrierColor: Colors.transparent,
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: productos.map((Producto producto) {
                        return GestureDetector(
                          child: Sub_Cat_CustomCard(
                            //producto.imageurl
                            imageUrl:
                                'https://medias.treew.com/imgproducts/thumbs/159462.jpg',
                            text: producto.nombre,
                            cardColor: const Color(0xfff6F6F6),
                            cardSize: 160,
                            price: producto.precio!,
                            moneda: producto.moneda!.first,
                            lastprice: producto.lastprice!,
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MenuDetail(producto: producto);
                            }));
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Title_List_Content(
                  text: "Te recomendamos...",
                  linkText: "Ver Todos",
                  linkUrl: "https://example.com",
                ),
                List_productos_Widget(
                  itemCount: 6,
                  orientation: Axis.vertical,
                ),
                PromoWidget(
                    'https://medias.treew.com/sliders/yeyashort_spa.jpg',
                    true,
                    true),
                Title_List_Content(
                  text: "Ofertas Especiales...",
                  linkText: "Ver Todos",
                  linkUrl: "https://example.com",
                ),
                List_productos_Widget(
                    itemCount: 5, orientation: Axis.horizontal),
                Title_List_Content(
                  text: "Populares...",
                  linkText: "Ver Todos",
                  linkUrl: "https://example.com",
                ),
                List_productos_Widget(
                    itemCount: 5, orientation: Axis.horizontal),
                PromoWidget(
                    'https://medias.treew.com/sliders/yeyashort_spa.jpg',
                    true,
                    false),
                Title_List_Content(
                  text: "Liquidación...",
                  linkText: "Ver Todos",
                  linkUrl: "https://example.com",
                ),
                List_productos_Widget(
                    itemCount: 5, orientation: Axis.horizontal),
              ],
            ),
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
