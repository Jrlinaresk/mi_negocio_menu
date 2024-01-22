import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:minegociomenu/domain/globalProviders/01categoria/categoria.dart';

import 'package:minegociomenu/domain/globalProviders/02producto/last_view.dart';
import 'package:minegociomenu/domain/globalProviders/02producto/producto.dart';
import 'package:minegociomenu/domain/models/producto/producto.dart';

import 'package:minegociomenu/presentation/widgets/texto/read_more_text.dart';

import 'package:url_launcher/url_launcher.dart';

class ProductWidget extends ConsumerStatefulWidget {
  const ProductWidget({super.key});

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends ConsumerState<ProductWidget> {
  bool toogle = false;
  late Producto product;
  late List<Producto> productListAsyncValue = [];

  @override
  Widget build(BuildContext context) {
    final Productlastview = ref.watch(plastView);
    var productListAsyncValue = ref.watch(productosProvider);

    // Acceder al valor dentro de AsyncValue
    final productList = productListAsyncValue.value ?? [];

// Ahora puedes usar el método 'where'
    product = productList
        .where((p) => p.id == Productlastview.id)
        .toList()[Productlastview.id!];

    late final Producto productoAsync = Productlastview;
    late bool isFavorito = productoAsync.favorito!;

    // Aquí puedes construir la interfaz de usuario que muestre los datos del producto.
    return Card(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, bottom: 16.0, left: 16.0, right: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(productoAsync.nombre,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                              fontSize: 22)),
                      Positioned(
                        top: 0, // Posiciona en la parte superior del Stack
                        right: 0, // Posiciona en la parte derecha del Stack
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorito = !isFavorito;
                            });
                            //funcionde agregar a la lista de favoritos
                            _toggleFavorito();
                          },
                          child: Icon(
                            isFavorito ? Icons.favorite : Icons.favorite_border,
                            color: isFavorito ? Colors.red : null,
                          ),
                        ), // El widget que deseas posicionar en la esquina superior derecha
                      ),
                    ],
                  ),
                  !toogle
                      ? Container(
                          padding: const EdgeInsets.only(
                              top: 0.0, right: 16.0, left: 0.0, bottom: 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
/*                                         Column(
                                          children: [
                                            Row(
                                              children: [
                                                for (var i = 1; i <= 5; i++)
                                                  Icon(
                                                    i <= productoAsync.starRate
                                                        ? Icons.star
                                                        : Icons.star_border,
                                                    color: Colors.blue,
                                                    size: 32,
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ), */
                                ],
                              ),
                              const SizedBox(height: 8),
                              ReadMoreText(
                                text: productoAsync.descripcion!,
                                maxLines: 32,
                                textColor: Colors.grey
                                    .shade800, // Color personalizado para el texto principal
                                style: TextStyle(fontSize: 8),
                              ),
                              const SizedBox(height: 2),
                            ],
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.only(
                              bottom: 16.0, right: 16.0, left: 16.0, top: 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  /* Text('${productoAsync.telefono}'), */
                                  const SizedBox(width: 16),
                                  Row(
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
                                      const SizedBox(width: 16),
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
                                ],
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                "La Habana", //productoAsync.provincia
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Domicilio", //productoAsync.entrega_a
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  _IconShop(),
                                ],
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${productoAsync.precio}',
                        style: const TextStyle(
                          fontSize: 32,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, bottom: 16.0, left: 16.0, right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Información Básica:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 16)),
                  const SizedBox(
                    height: 8.0,
                  ),
                  _buildInfoRow("Disponibilidad:",
                      productoAsync.disponibilidad.toString()),
                  _buildInfoRow(
                      "Mayorista:", productoAsync.mayorista.toString()),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, bottom: 16.0, left: 16.0, right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Información Avanzada:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 16)),
                  const SizedBox(
                    height: 8.0,
                  ),
                  _buildInfoRow("Estado ID:", productoAsync.stado.toString()),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, bottom: 16.0, left: 16.0, right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Metodo de pago:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 16)),
                  const SizedBox(
                    height: 8.0,
                  ),
                  _buildInfoRow("Forma de Pago ID:",
                      productoAsync.formasDePago.toString()),
                  _buildInfoRow("Moneda ID:", productoAsync.moneda!.first),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, bottom: 16.0, left: 16.0, right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Información del vendedor:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 16)),
                  const SizedBox(
                    height: 8.0,
                  ),
                  _buildInfoRow(
                      "Mensajería:", productoAsync.mensajeria.toString()),
                  _buildInfoRow("Link:", "http://www.example.com"),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, bottom: 16.0, left: 16.0, right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Información de publicación",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 16)),
                  const SizedBox(
                    height: 8.0,
                  ),
                  _buildInfoRow(
                      "Creado en:", productoAsync.createdAt!.toString()),
                  _buildInfoRow(
                      "Actualizado en:", productoAsync.updatedAt!.toString()),
                ],
              ),
            ),
          ),
          _buildInfoRow("Notas:", productoAsync.nota!),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String fieldName, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldName,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey.shade900)),
        const SizedBox(
          width: 4.0,
        ),
        Text(value),
      ],
    );
  }

  void _toggleFavorito() {
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
          .toggleProductoFavorito(index, !product.favorito);

      ref
          .read(productoFavoritoStateNotifierProvider.notifier)
          .toggleProductoFavorito(index, !product.favorito);
    }); */
  }

  Widget _IconShop() {
    return Positioned(
      top: 0, // Posiciona en la parte superior del Stack
      right: 0, // Posiciona en la parte derecha del Stack
      child: GestureDetector(
        onTap: () {
          setState(() {
            toogle = !toogle;
          });
        },
        child: Icon(
          toogle
              ? Icons.shopping_cart_checkout_outlined
              : Icons.shopping_cart_checkout_outlined,
          color: toogle ? Colors.pink : null,
        ),
      ), // El widget que deseas posicionar en la esquina superior derecha
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
}
