import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:minegociomenu/core/config/const.dart';
import 'package:minegociomenu/domain/globalProviders/03negocio/negocio.dart';
import 'package:minegociomenu/domain/models/negocios/negocios.dart';
import 'package:minegociomenu/presentation/Screens/globals/06dasboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BienvenidoScreen extends ConsumerStatefulWidget {
  const BienvenidoScreen({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends ConsumerState<BienvenidoScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
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
                            child: Image.network(
                              negocioList.ImagenUrl
                                  .first, // Puedes ajustar el ancho y el alto según tus necesidades
                              height: 200,
                              // Opciones adicionales para personalizar la carga de la imagen
                              fit: BoxFit
                                  .fill, // Ajusta el tamaño y el recorte de la imagen
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  // La imagen ha cargado completamente
                                  return child;
                                } else {
                                  // Muestra un indicador de carga mientras se carga la imagen
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                          .expectedTotalBytes ??
                                                      1)
                                              : null,
                                    ),
                                  );
                                }
                              },
                              errorBuilder: (BuildContext context, Object error,
                                  StackTrace? stackTrace) {
                                // Manejar el error si la carga de la imagen falla
                                return const Text('Error al cargar la imagen');
                              },
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
                      /*               const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Text(
                      "¡Obtén el mejor café de La Habana!",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Text(
                      "La Habana / Arroyo Naranjo / Fraternidad /",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Text(
                      "Calle Fernando #785 e/ San Agustin y Concoridia",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,),
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
                                "Menu",
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
            return const Scaffold(
                backgroundColor: Colors.white,
                body: Center(child: CircularProgressIndicator()));
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
                ),
                SocialButton(
                  icon: Icon(Bootstrap.instagram),
                ),
/*                 SocialButton(
                    icon: Icon(Bootstrap.twitter), ), */
                SocialButton(
                  icon: Icon(Bootstrap.whatsapp),
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

  const SocialButton(
      {Key? key, required this.icon, this.color = Colors.transparent})
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
          // Agrega aquí el comportamiento cuando se presiona el botón.
        },
      ),
    );
  }
}
