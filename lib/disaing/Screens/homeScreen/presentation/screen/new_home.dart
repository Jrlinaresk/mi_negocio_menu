import 'package:icons_plus/icons_plus.dart';
import 'package:minegociomenu/const.dart';
import 'package:minegociomenu/disaing/Screens/homeScreen/presentation/screen/menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeNew extends StatefulWidget {
  const HomeNew({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<HomeNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: Container(
                  height: MediaQuery.of(context).size.height * .45,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/coffeshop.jpg"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Text(
                  "La Habana:",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.brown),
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0),
                child: Text(
                  "Caffe Menu",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Colors.brown),
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  "Rincón del Sabor Cubano",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 86, 61, 51)),
                  textAlign: TextAlign.center,
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
                      color: Colors.brown),
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
                      color: Colors.brown),
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
                      color: Colors.brown),
                  textAlign: TextAlign.center,
                ),
              ),
             */
            ],
          ),
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  "Horario",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.brown),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  "L/M/M/J/V/S/D",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.brown),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  "06:00am - 10:00pm",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.brown),
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
                        primary: Colors.brown, // Cambia el color de fondo aquí
                        padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                        // Otros estilos según sea necesario
                      ),
/*                   padding: EdgeInsets.fromLTRB(60, 15, 60, 15), */
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeMenu(); // HomeMenu()
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
                    icon: Icon(Bootstrap.facebook), color: Colors.white),
                SocialButton(
                    icon: Icon(Bootstrap.instagram), color: Colors.white),
/*                 SocialButton(
                    icon: Icon(Bootstrap.twitter), color: Colors.white), */
                SocialButton(
                    icon: Icon(Bootstrap.whatsapp), color: Colors.white),
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
  final Color color;

  const SocialButton({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.brown,
      ),
      child: IconButton(
        icon: icon,
        color: color,
        onPressed: () {
          // Agrega aquí el comportamiento cuando se presiona el botón.
        },
      ),
    );
  }
}
