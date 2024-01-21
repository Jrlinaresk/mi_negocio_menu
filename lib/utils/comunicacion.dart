import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se puede lanzar la URL: $url';
  }
}

launchWhatsapp(BuildContext context, String telefono) async {
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
