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

//forma actual de funcionar
EnviarOrden_whatsapp(BuildContext context, String telefono, String m) async {
  var contact = telefono;
  var mensaje = m;
  var androidUrl = 'whatsapp://send?phone=$contact&text=$mensaje';
/*   var iosUrl = 'https://wa.me/$contact?text=${Uri.parse(mensaje)}';
 */
  try {
    if (Platform.isIOS) {
      await launchUrl(
          Uri.parse('https://wa.me/$contact?text=${Uri.parse(mensaje)}'));
    } else {
      await launchUrl(Uri.parse(androidUrl));
    }
  } on Exception {
    const SnackBar(
      content: Text("WhatsApp is not installed on the device"),
    );
  }
}

//

// Función para abrir el enlace en la aplicación de Facebook o en el navegador
Future<void> openFacebookLink(String url) async {
  // Convertir la cadena URL a un objeto Uri
  Uri facebookUrl = Uri.parse(url);

  // Verificar si la aplicación de Facebook está instalada
  if (await canLaunchUrl(facebookUrl)) {
    // Abrir en la aplicación de Facebook
    await launch('fb://facewebmodal/f?href=$facebookUrl', forceSafariVC: false);
  } else {
    // Si la aplicación de Facebook no está instalada, abrir en el navegador
    await _launchInBrowserView(facebookUrl);
  }
}

Future<void> _launchInBrowserView(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
    throw Exception('Could not launch $url');
  }
}
