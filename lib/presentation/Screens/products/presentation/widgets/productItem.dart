import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:minegociomenu/core/Helpers/random_generator.dart';
import 'package:minegociomenu/presentation/Screens/products/domain/product_model.dart';
import 'package:minegociomenu/domain/globalProviders/producto/state_provider.dart';
import 'package:minegociomenu/domain/globalProviders/simple_product_provider.dart';
import 'package:minegociomenu/core/utils/formaulas.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductItem extends ConsumerStatefulWidget {
  final Product product;
  final int index;

  const ProductItem({super.key, required this.product, required this.index});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends ConsumerState<ProductItem> {
  bool isFavorito = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final randomIndex = Random().nextInt(widget.product.types.length);
    isFavorito = widget.product.favorito;
    final productoAsync = ref.watch(productProvider(widget.product.productId));
    return Expanded(
      child: InkWell(
        onTap: () {
          UpdateProductoLastView(ref, widget.product);
          context.push('/productdetallesscreen');
        },
        child: Container(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
          child: Card(
            elevation: 8,
            // Personaliza la apariencia de cada elemento aquí
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 24),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        16.0), // Reduzco el valor para que el recorte sea menor
                                    child: SizedBox(
                                      width: calculateImageWidth(
                                          context), //   // Ancho de la imagen
                                      height: calculateImageHeight(
                                          context), //  // Altura de la imagen
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Image.asset(
                                          RandomGenerator.GeTimageRandom(widget
                                              .product.types[randomIndex]),
                                          fit: BoxFit
                                              .cover, // Ajusta la imagen al tamaño especificado
                                        ),
                                        tooltip: 'Click',
                                        onPressed: () {
                                          UpdateProductoLastView(
                                              ref, widget.product);
                                          context.push(
                                            '/productdetallesscreen',
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 16.0),
                                  child: Divider(),
                                )
                              ],
                            ),
                            Stack(
                              children: [
                                Positioned(
                                  bottom: 4,
                                  right: 0,
                                  left: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          try {
                                            whatsapp(context,
                                                "51979128"); //productoAsync.telefono
                                            //_launchWhatsapp(context, product.telefono);
                                            _launchURL(
                                                'whatsapp://send?phone=+${"5351979128"}');
                                          } catch (e) {
                                            print(
                                                'Error al abrir la URL de WhatsApp: $e');
                                          }
                                        },
                                        child: const Icon(
                                          Bootstrap.whatsapp,
                                          color: Colors.green,
                                        ),
                                      ),
                                      const SizedBox(width: 32),
                                      GestureDetector(
                                        onTap: () {
                                          _launchURL(
                                              'tel:${"51979128"}'); //productoAsync.telefono.toString()
                                        },
                                        child: const Icon(Icons.call,
                                            color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          //nombre del producto
                                          widget.product.name,
                                          style: const TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Colors.blue, // Color azul
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Positioned(
                                          top:
                                              0, // Posiciona en la parte superior del Stack
                                          right:
                                              0, // Posiciona en la parte derecha del Stack
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isFavorito = !isFavorito;
                                              });
                                              //funcionde agregar a la lista de favoritos
                                              _toggleFavorito();
                                            },
                                            child: Icon(
                                              isFavorito
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: isFavorito
                                                  ? Colors.red
                                                  : null,
                                            ),
                                          ), // El widget que deseas posicionar en la esquina superior derecha
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${widget.product.price}',
                                      style: const TextStyle(
                                        fontFamily:
                                            'Blood', // Nombre de la fuente personalizada Blood
                                        fontSize: 14.0, // Tamaño de fuente 16
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 8.0, bottom: 8.0),
                                      child: SizedBox(),
                                    ),
/*                                 Row(
                                      children: [
                                        Text('${widget.product.telefono}'),
                                        SizedBox(width: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                try {
                                                  whatsapp(context,
                                                      widget.product.telefono);
                                                  //_launchWhatsapp(context, product.telefono);
                                                  _launchURL(
                                                      'whatsapp://send?phone=+${"5351979128"}');
                                                } catch (e) {
                                                  print(
                                                      'Error al abrir la URL de WhatsApp: $e');
                                                }
                                              },
                                              child: Icon(Bootstrap.whatsapp),
                                            ),
                                            SizedBox(width: 16),
                                            GestureDetector(
                                              onTap: () {
                                                _launchURL(
                                                    'tel:${widget.product.telefono.toString()}');
                                              },
                                              child: Icon(Bootstrap.phone),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ), */

                                    // Agrega más información y personalización aquí según tus necesidades
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
/*                         Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Provincia: ${widget.product.provincia}'),
                                  Text(
                                      'Entrega a: ${widget.product.entrega_a}'),
                                ],
                              )
                            ],
                          ),
                        ), */
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se puede lanzar la URL: $url';
    }
  }

  _launchWhatsapp(BuildContext context, String telefono) async {
    var whatsapp = telefono;
    var mensaje = "Hola me interesa su producto";
    var whatsappAndroid =
        Uri.parse("whatsapp://send?phone=$whatsapp&text=$mensaje");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("WhatsApp is not installed on the device"),
        ),
      );
    }
  }

  //forma actual de funcionar
  whatsapp(BuildContext context, String telefono) async {
    var contact = telefono;
    var mensaje = "Hola, me interesa su producto";
    var androidUrl = "whatsapp://send?phone=$contact&text=$mensaje";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse(mensaje)}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      const SnackBar(
        content: Text("WhatsApp is not installed on the device"),
      );
    }
  }

  void _toggleFavorito() {
    print(
        "favorito: ${widget.product.favorito}"); // Imprime el valor actual de isFavorito

/*     if (isFavorito) {
      // El producto ya es un favorito, así que lo eliminamos
      await widget.favoritosDatabase
          .eliminarDeFavoritos(widget.product.productId);
    } else {
      // El producto no es un favorito, así que lo agregamos
      await widget.favoritosDatabase.agregarAFavoritos(widget.product);
    } */
/*     setState(() {
      ref
          .read(ProductoStateNotifierProvider.notifier)
          .toggleProductoFavorito(widget.index, !widget.product.favorito);

      ref
          .read(ProductoFavoritoStateNotifierProvider.notifier)
          .toggleProductoFavorito(widget.index, !widget.product.favorito);
    }); */
  }
}

void UpdateProductoLastView(WidgetRef ref, Product p) {
  ref.read(lastView.notifier).update((state) => p);
}
