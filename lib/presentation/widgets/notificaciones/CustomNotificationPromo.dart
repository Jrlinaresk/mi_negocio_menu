import 'package:flutter/material.dart';

class CustomNotificationPromo extends StatefulWidget
    implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final Function(bool) updateText_notificarionPromoShow;
  const CustomNotificationPromo(
      this.title, this.subtitle, this.updateText_notificarionPromoShow);

  @override
  Size get preferredSize => const Size.fromHeight(48.0);

  @override
  State<CustomNotificationPromo> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomNotificationPromo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff232F3F),
      height: 48,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 8.0),
        child: Row(
          children: <Widget>[
            const Icon(
              Icons.emoji_transportation,
              color: Colors.white,
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Positioned(
                      left: 20,
                      child: Text(
                        widget.title.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      )),
                  Positioned(
                      left: 20,
                      child: Text(
                        widget.subtitle.toUpperCase(),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            )),
            IconButton(
              icon: const Icon(Icons.close),
              iconSize: 16,
              color: Colors.white,
              onPressed: () {
                widget.updateText_notificarionPromoShow(false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
