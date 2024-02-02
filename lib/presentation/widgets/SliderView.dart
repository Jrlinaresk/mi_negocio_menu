import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:minegociomenu/presentation/Screens/globals/11administracion/administracion_screen.dart';

class SliderView extends StatefulWidget {
  final Function(String)? onItemClick;

  const SliderView({Key? key, this.onItemClick}) : super(key: key);

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 18.0),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Stack(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 16.0),
                          child: Center(
                            child: CircleAvatar(
                              radius: 61,
                              backgroundColor: Color(0xffFFD54B),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 60,
                                backgroundImage: AssetImage('assets/category.png'),
                                // Image.network(
                                //     'https://nikhilvadoliya.github.io/assets/images/nikhil_1.webp')
                                //     .image,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 8,
                            right: 16.0,
                            child:
                            InkWell(
                              // borrar productdetallesscreen
                              onTap: () {
                                //showToast("Funcion pendiente");
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Configuraciones')));
                                widget.onItemClick?.call('Configuraciones');
                                },
                              child: const Icon(Icons.settings, color: Colors.white, size: 22.0), // Icono de búsqueda ,
                            ),
                            ), //'Configuraciones'
                        const Positioned(
                            top: 8,
                            left: 16.0,
                            child: Icon(Icons.notifications_active, color: Colors.white, size: 22.0)), //'Configuraciones'
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Super Market 23',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0,right: 12.0, bottom: 8.0, top: 20.0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              color: Colors.grey.shade50,
                              height: 0.2,
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8.0),
                              color: Theme.of(context).primaryColor,
                              child: const Text(
                                'Contactanos',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...[
                      Menu(Bootstrap.facebook, 'Faceboock'),
                      Menu(Bootstrap.instagram, 'Instagram'),
                      Menu(Bootstrap.whatsapp, '(+53)-51 979 128'),
                      Menu(Icons.email_outlined, 'jrlinaresk@gmail.com'),
                      Menu(Bootstrap.archive, 'Retroalimentacion'),
                    ]
                        .map((menu) => _SliderMenuItem(
                            title: menu.title,
                            iconData: menu.iconData,
                            onTap: widget.onItemClick))
                        .toList(),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0,right: 12.0, bottom: 8.0, top: 12.0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              color: Colors.grey.shade50,
                              height: 0.2,
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8.0),
                              color: Theme.of(context).primaryColor,
                              child: const Text(
                                'Informacion',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...[
                      Menu(Icons.info_outline, 'Quienes somos'),
                      Menu(Icons.import_contacts_outlined, 'Que debes saber!'),
                      Menu(Icons.handshake_outlined, 'Vende con nosotros'),
                    ]
                        .map((menu) => _SliderMenuItem(
                        title: menu.title,
                        iconData: menu.iconData,
                        onTap: widget.onItemClick))
                        .toList(),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0,right: 12.0, bottom: 8.0, top: 12.0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              color: Colors.grey.shade50,
                              height: 0.2,
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8.0),
                              color: Theme.of(context).primaryColor,
                              child: const Text(
                                'Sistema',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...[
                      Menu(Icons.help_outline, 'Ayuda'),
                      Menu(Icons.output_rounded, 'Salir'),
                    ]
                        .map((menu) => _SliderMenuItem(
                        title: menu.title,
                        iconData: menu.iconData,
                        onTap: widget.onItemClick))
                        .toList(),
                  ],
                ),
              ),
             //acount
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0, left: 8.0, right: 16.0, top: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Center(
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: Color(0xffFFD54B),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 24,
                                backgroundImage: AssetImage('assets/developed/dev.jpg'),
                                // Image.network(
                                //     'https://nikhilvadoliya.github.io/assets/images/nikhil_1.webp')
                                //     .image,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Developed',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Administracion',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey.shade100,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                       ],
                      ),
                    ),
                    Positioned(
                        top: 8,
                        right: 16.0,
                        child: Icon(Icons.edit_note_outlined, color: Colors.grey.shade600, size: 22.0)), //'Configuraciones'
                  ],
                ),
              ),
            ],
          ),
          Container(
            color: Colors.black54,
            width: 0.5,
          ),
        ],
      ),
    );
  }
}



class _SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function(String)? onTap;

  const _SliderMenuItem(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      InkWell (
        onTap: () {
          onTap?.call(title);
        },
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
                child: Row(
                  children: [
                    Icon(iconData, color: Colors.white, size: 22.0),
                    const SizedBox(width: 10.0,),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
class Menu {
  final IconData iconData;
  final String title;

  Menu(this.iconData, this.title);
}
