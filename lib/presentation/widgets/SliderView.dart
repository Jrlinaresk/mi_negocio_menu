import 'package:flutter/material.dart';

class SliderView extends StatelessWidget {
  final Function(String)? onItemClick;

  const SliderView({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                const CircleAvatar(
                  radius: 61,
                  backgroundColor: Color(0xffFFD54B),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                    backgroundImage: AssetImage('assets/icon/icon_apk.png'),
                    // Image.network(
                    //     'https://nikhilvadoliya.github.io/assets/images/nikhil_1.webp')
                    //     .image,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Nick',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ...[
                  Menu(Icons.notifications_active, 'Notification'),
                ]
                    .map((menu) => _SliderMenuItem(
                        title: menu.title,
                        iconData: menu.iconData,
                        onTap: onItemClick))
                    .toList(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0, right: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromARGB(138, 255, 255, 255),
                    size: 16.0,
                  ),
                  onPressed: () {
                    // Implementa la lógica de agregar/remover de favoritos aquí
                  },
                ),
                const Text(
                  'Salir',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(138, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
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
    return ListTile(
      title: Text(title,
          style: const TextStyle(
              color: Colors.white, fontFamily: 'BalsamiqSans_Regular')),
      leading: Icon(
        iconData,
        color: Colors.white,
      ),
      onTap: () => onTap?.call(title),
    );
  }
}

class Menu {
  final IconData iconData;
  final String title;

  Menu(this.iconData, this.title);
}
