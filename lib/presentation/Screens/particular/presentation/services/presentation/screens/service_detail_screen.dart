import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:minegociomenu/domain/globalProviders/01categoria/categoria.dart';

import 'package:minegociomenu/domain/globalProviders/02producto/last_view.dart';
import 'package:minegociomenu/domain/globalProviders/02producto/producto.dart';
import 'package:minegociomenu/domain/models/producto/producto.dart';

import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/product_widget.dart';
import 'package:minegociomenu/domain/globalProviders/negocio_state_notifier_provider.dart';

import 'package:url_launcher/url_launcher.dart';

class ServiceDetailScreen extends ConsumerStatefulWidget {
  const ServiceDetailScreen({super.key});

  @override
  _ServiceDetailScreenState createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends ConsumerState<ServiceDetailScreen> {
  late int index = 0;
  late Producto product;
  late List<Producto> productListAsyncValue = [];
  final CarouselController _carouselController = CarouselController();
  bool isFavorito = false;
  bool toogle = false;

  @override
  Widget build(BuildContext context) {
    final Productlastview = ref.watch(plastView);
    var plist = ref.watch(productosProvider);
    var productListAsyncValue = plist;

// Acceder al valor dentro de AsyncValue
    final productList = productListAsyncValue.value ?? [];

// Ahora puedes usar el método 'where'
    product = productList
        .where((p) => p.productoID == Productlastview.productoID)
        .toList()[Productlastview.productoID!];

    final nlist = ref.watch(filteredNegociosProvider);

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(Productlastview.nombre),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: size.height / 2 - 64,
                      color: Colors.grey,
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
                            itemBuilder: (BuildContext context, int index,
                                int realIndex) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Image.asset(
                                    Productlastview.imageurl!,
                                    fit: BoxFit.fill,
                                  );
                                },
                              );
                            },
                          ),
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      _carouselController.previousPage();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.grey.shade100,
                                      elevation: 8.0,
                                      backgroundColor: const Color.fromARGB(
                                          15, 255, 255, 255),
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
                                      backgroundColor: const Color.fromARGB(
                                          15, 255, 255, 255),
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
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      child: Column(
                        children: [
                          ProductWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                color: Colors.red,
                child: const SizedBox(
                  height: 64.0,
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 48.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                height: 48.0,
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("WHATSAPP ",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 18.0)),
                      GestureDetector(
                        onTap: () {
                          try {
                            whatsapp(context, "51979128");
                            //_launchWhatsapp(context, product.telefono);
                            _launchURL(
                                'whatsapp://send?phone=+${"5351979128"}');
                          } catch (e) {
                            print('Error al abrir la URL de WhatsApp: $e');
                          }
                        },
                        child: const Icon(
                          Bootstrap.whatsapp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
                height: 48.0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("LLAMAR ",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 18.0)),
                      GestureDetector(
                        onTap: () {
                          _launchURL('tel:${51979128}');
                        },
                        child: const Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleFavorito() {}

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
