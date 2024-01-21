import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:minegociomenu/disaing/Screens/products/domain/product_model.dart';
import 'package:minegociomenu/disaing/Screens/products/presentation/widgets/product_widget.dart';
import 'package:minegociomenu/domain/globalProviders/producto_favorito_state_notifier_provider.dart';
import 'package:minegociomenu/domain/globalProviders/producto_state_notifier_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  late int index = 0;
  late Product product;
  late List<Product> plist = [];
  final CarouselController _carouselController = CarouselController();
  bool isFavorito = false;
  bool toogle = false;

  @override
  Widget build(BuildContext context) {
    plist = ref.watch(ProductoStateNotifierProvider);
    product = plist.where((p) => p.id == 0).toList()[index];

    final Product productoAsync = plist[index];
    var size = MediaQuery.of(context).size;

    isFavorito = productoAsync.favorito;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(productoAsync.name),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.grey,
              child: SingleChildScrollView(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CarouselSlider.builder(
                      carouselController: _carouselController,
                      options: CarouselOptions(
                        height: size.height - 96,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.0,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        pauseAutoPlayOnTouch: true,
                        onPageChanged: (index, reason) {
                          // Manejar el cambio de página aquí (puede ser útil para los indicadores)
                        },
                      ),
                      itemCount:
                          2, //la api solo da 2 imagenes en atributos independientes
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Image.asset(
                              productoAsync.image1,
                              fit: BoxFit.cover,
                            );
                          },
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _carouselController.previousPage();
                            },
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.grey.shade100,
                              elevation: 8.0,
                              backgroundColor:
                                  const Color.fromARGB(15, 255, 255, 255),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32.0),
                                  topRight: Radius.circular(32.0),
                                  bottomRight: Radius.circular(32.0),
                                  bottomLeft: Radius.circular(32.0),
                                ),
                              ),
                            ),
                            child: const Text(
                              '<',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0,
                                  color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _carouselController.nextPage();
                            },
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.grey.shade100,
                              elevation: 8.0,
                              backgroundColor:
                                  const Color.fromARGB(15, 255, 255, 255),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32.0),
                                  topRight: Radius.circular(32.0),
                                  bottomRight: Radius.circular(32.0),
                                  bottomLeft: Radius.circular(32.0),
                                ),
                              ),
                            ),
                            child: const Text(
                              '>',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 8,
                    child: Column(
                      children: [
                        ProductWidget(),
/*                         !toogle
                            ? Container(
                                padding: const EdgeInsets.only(
                                    top: 24.0,
                                    right: 16.0,
                                    left: 16.0,
                                    bottom: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
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
                                    const SizedBox(height: 8),
                                    ReadMoreText(
                                      text: productoAsync.description,
                                      maxLines: 96,
                                      textColor: Colors.grey
                                          .shade800, // Color personalizado para el texto principal
                                      style: TextStyle(fontSize: 8),
                                    ),
                                    const SizedBox(height: 2),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              '\$${productoAsync.price}',
                                              style: const TextStyle(
                                                fontSize: 32,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ],
                                        ),
                                        _IconShop(),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.only(
                                    bottom: 16.0,
                                    right: 16.0,
                                    left: 16.0,
                                    top: 24.0),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                        Text(
                                          "Domicilio", //productoAsync.entrega_a
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        _IconShop(),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                  ],
                                ),
                              ),
                       */
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
    setState(() {
      ref
          .read(ProductoStateNotifierProvider.notifier)
          .toggleProductoFavorito(index, !product.favorito);

      ref
          .read(ProductoFavoritoStateNotifierProvider.notifier)
          .toggleProductoFavorito(index, !product.favorito);
    });
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
