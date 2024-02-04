import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:minegociomenu/core/config/const.dart';
import 'package:minegociomenu/core/utils/comunicacion.dart';
import 'package:minegociomenu/domain/globalProviders/03negocio/negocio.dart';
import 'package:minegociomenu/domain/models/negocios/negocios.dart';
import 'package:minegociomenu/presentation/Screens/globals/06dasboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_fullscreen_image.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_image.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../widgets/cargas/mcircular_progress_indicator.dart';

class BienvenidoScreen extends ConsumerStatefulWidget {
  const BienvenidoScreen({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends ConsumerState<BienvenidoScreen>
    with SingleTickerProviderStateMixin {
  // Initialize uni_links
  void initUniLinks() async {
    try {
      final initialLink = await getInitialLink();
      handleLink(initialLink!);
    } on Exception {
      // Handle exception
    }

    getLinksStream().listen((String? link) {
      if (link != null) {
        handleLink(link);
      }
    });
  }

// Handle the link
  void handleLink(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      print('No se pudo abrir el enlace: $link');
    }
  }

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer(
      builder: (context, ref, child) {
        final negocioListAsyncValue = ref.watch(negociosProvider);

        return negocioListAsyncValue.when(
          data: (negocioList) {
            // Aquí puedes mostrar tu widget con la información obtenida
            return Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0.0, right: 0.0, top: 54),
                          child: Center(
                            child: Container(
                              height: size.height / 2 - 256,
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
                                      autoPlayInterval:
                                          const Duration(seconds: 5),
                                      enlargeCenterPage: false,
                                      enableInfiniteScroll: true,
                                      pauseAutoPlayOnTouch: true,
                                      reverse: false,
                                      onPageChanged: (index, reason) {
                                        // Manejar el cambio de página aquí (puede ser útil para los indicadores)
                                      },
                                    ),
                                    itemCount: 5, //negocioList.ImagenUrl.length
                                    itemBuilder: (BuildContext context,
                                        int index, int realIndex) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          List<String> staticImageUrls = [
                                            'https://medias.treew.com/sliders/picadilloyeya-pc-spa.jpg',
                                            'https://medias.treew.com/sliders/pasabahce-pc-spa.jpg',
                                            'https://medias.treew.com/sliders/chocnut-pc-spa.jpg',
                                            'https://medias.treew.com/sliders/tommilk-pc-spa.jpg',
                                            'https://medias.treew.com/sliders/rubis-pc-spa.jpg',
                                            'https://medias.treew.com/sliders/conformados-pc-spa.jpg',
                                          ];

                                          // Asegúrate de que el índice esté dentro del rango de la lista
                                          if (index >= 0 &&
                                              index < staticImageUrls.length) {
                                            return buildFullscreenImage(
                                                staticImageUrls[index], true);
                                          } else {
                                            // Manejar casos en los que el índice está fuera de rango
                                            return Container(); // O cualquier widget predeterminado
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, left: 16.0, right: 16.0),
                        child: Text(
                          negocioList.Provincia,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0.0, left: 16.0, right: 16.0),
                        child: Text(
                          negocioList.nombre,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: SizedBox(
                          width: 256,
                          child: Column(
                            children: [
                              negocioList.Slogan!.isEmpty
                                  ? Text(
                                      negocioList.Slogan!,
                                      style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromARGB(255, 86, 61, 51)),
                                      textAlign: TextAlign.center,
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      //
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Text(
                          "Encuentra facil todo lo que buscas",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
/*                       Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Text(
                          "La Habana / Arroyo Naranjo / Fraternidad /",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Text(
                          "Calle Fernando #785 e/ San Agustin y Concoridia",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                     */
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Text(
                          "Horario",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Text(
                          negocioList.DiasLaborables,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Text(
                          negocioList.HorarioLaborable,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .primaryColor, // Cambia el color de fondo aquí
                                padding:
                                    const EdgeInsets.fromLTRB(30, 15, 30, 15),
                                // Otros estilos según sea necesario
                              ),
                              /*                   padding: EdgeInsets.fromLTRB(60, 15, 60, 15), */
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const DashboardScreen(); // DashboardScreen()
                                }));
                              },
                              child: const Text(
                                "Comenzar",
                                style: TextStyle(
                                    fontFamily: 'Roboto', color: Colors.white),
                              ),
                              /*                   borderSide: BorderSide(color: darkBrown),
                      shape: StadiumBorder(), */
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const SocialMediaButtons(),
                    ],
                  )
                ],
              ),
            );
          },
          loading: () {
            // Aquí se muestra el CircularProgressIndicator mientras se carga la información
            return Scaffold(
                backgroundColor: Colors.white,
                body: Center(child: CustomLoadingIndicator()));
          },
          error: (error, stack) {
            // Manejo de errores si ocurre alguno
            return Text('Error: $error');
          },
        );
      },
    );
  }
}

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96.0,
      child: Column(
        children: [
/*           const Padding(
            padding: EdgeInsets.only(left: 64.0, right: 64.0),
            child: Center(
              child: Text(
                "Siguenos en nuestras redes sociales",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ), */
          const SizedBox(
            height: 8.0,
          ),
          Container(
            padding:
                const EdgeInsets.only(bottom: 8.0, left: 48.0, right: 48.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SocialButton(
                  icon: Icon(Bootstrap.facebook),
                  url: 'https://www.facebook.com/Supermarket23/',
                ),
                SocialButton(
                  icon: Icon(Bootstrap.instagram),
                  url: 'https://www.instagram.com/supermarket.23/',
                ),
/*                 SocialButton(
                    icon: Icon(Bootstrap.twitter), ), */
                SocialButton(
                  icon: Icon(Bootstrap.whatsapp),
                  url: '16476940199',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final Icon icon;
  final Color? color; // Ahora es un Color opcional
  final String url;

  const SocialButton(
      {Key? key,
      required this.icon,
      this.color = Colors.transparent,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).primaryColor,
      ),
      child: IconButton(
        icon: icon,
        color: Colors.white,
        onPressed: () {
          openFacebookLink(url);
          // Agrega aquí el comportamiento cuando se presiona el botón.
        },
      ),
    );
  }
}
