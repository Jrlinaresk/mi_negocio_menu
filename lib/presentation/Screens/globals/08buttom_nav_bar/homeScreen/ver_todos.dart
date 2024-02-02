import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minegociomenu/core/Helpers/random_generator.dart';
import 'package:minegociomenu/domain/globalProviders/02producto/last_view.dart';
import 'package:minegociomenu/domain/globalProviders/02producto/producto.dart';
import 'package:minegociomenu/domain/models/producto/producto.dart';
import 'package:minegociomenu/domain/provider/categoria_producto.dart/state_provider.dart';
import 'package:minegociomenu/presentation/Screens/globals/filter/CustomDialog.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/homeScreen/menu_detail.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/sub_cat_custom_card.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/list_productos.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_fullscreen_image.dart';
import 'package:minegociomenu/presentation/widgets/promos/simple_promo.dart';
import 'package:minegociomenu/presentation/widgets/titles/title_de_lista.dart';
import 'package:minegociomenu/domain/models/producto/coffee.dart';

class MyScreen_ver_todo extends ConsumerStatefulWidget {
  final int index; // id de categoria
  final String categoria; //nombre de categoria
  final String texto;
  const MyScreen_ver_todo(
      {Key? key,
      required this.index,
      required this.categoria,
      required this.texto})
      : super(key: key);

  @override
  MyScreen_ver_todoState createState() => MyScreen_ver_todoState();
}

class MyScreen_ver_todoState extends ConsumerState<MyScreen_ver_todo> {
  @override
  Widget build(BuildContext context) {
    var cat = widget.index + 1;
    final productosListAsyncValue = ref.watch(productosProvider(cat));

    // Acceder al valor dentro de AsyncValue
    return productosListAsyncValue.when(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.texto,
                              style: const TextStyle(
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
                            },
                          ),
                        ],
                      ),
                      List_productos_Widget(
                        itemCount: productos.length > 6 ? 5 : productos.length,
                        orientation: Axis.vertical,
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
                  padding: const EdgeInsets.only(bottom: 64.0),
                  child: SizedBox(
                      width: 128.0,
                      height: 128.0,
                      child: buildFullscreenImage(
                          "assets/empty_result.png", false)),
                )),
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
