import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:minegociomenu/disaing/Screens/Maps/mapom/providers/location_provider_lite.dart';
import 'package:minegociomenu/disaing/Screens/envio_screen/domain/solicitud_de_envio.dart';
import 'package:minegociomenu/disaing/widgets/ProgressIndicator.dart';
import 'package:minegociomenu/models/ubicacion_tools/domain/ubicacion.dart';
import 'package:minegociomenu/utils/location_utils.dart';
// osrm
import 'package:osrm/osrm.dart';
import 'dart:math' as math;
// flutter_map
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/animation.dart';
import 'package:http/http.dart' as http;
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class FlutterMapOsrmExample extends ConsumerStatefulWidget {
  const FlutterMapOsrmExample({
    super.key,
  });

  @override
  _FlutterMapOsrmExampleState createState() => _FlutterMapOsrmExampleState();
}

class _FlutterMapOsrmExampleState extends ConsumerState<FlutterMapOsrmExample> {
  bool DetallesDelVija = false;
  int IconoView = 0;
  SolicitudDeEnvio response = SolicitudDeEnvio(
      id: '', latitud: 0, longitud: 0, NumeroDeCasa: '', monto: 0);
  late StreamSubscription _sub;
  String initialValue = " ";
  late AnimationController _animationController;
  MapController mapController = MapController();
  var from;
  var to;
  var points = <LatLng>[];

  @override
  void initState() {
    super.initState();
    _initDeepLinkListener();
    requestLocationPermission();
    //
    getRoute(); // Hace que la animación se repita indefinidamente
  }

  Future<void> _initDeepLinkListener() async {
    _handleInitialLink();
    _sub = getUriLinksStream().listen((Uri? uri) {
      if (uri != null) {
        // Aquí puedes manejar el enlace profundo (deep link)
        print('Received uri: $uri');
      }
    }, onError: (Object err) {
      print('Error: $err');
    });

    // Para manejar el enlace inicial si la aplicación ya estaba abierta
    final initialUri = await getInitialUri();
    if (initialUri != null) {
      print('Received initial uri: $initialUri');
    }
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  void _startAnimation() {
    _animationController
      ..reset()
      ..forward().whenComplete(_startAnimation);
  }

  /// [distance] the distance between two coordinates [from] and [to]
  double distance = 0.0;

  /// [duration] the duration between two coordinates [from] and [to]
  num duration = 0.0;

  /// [getRoute] get the route between two coordinates [from] and [to]
  Future<void> getRoute() async {
    final osrm = Osrm(
        // source: OsrmSource(
        //   serverBuilder: OpenstreetmapServerBuilder().build,
        // ),
        );
    // get the route
    final options = RouteRequest(
      coordinates: [
        (from.longitude, from.latitude),
        (to.longitude, to.latitude),
      ],
      profile:
          OsrmRequestProfile.car, // Puedes cambiar esto según tus necesidades
      geometries: OsrmGeometries.geojson,
      overview: OsrmOverview.simplified,
      // alternatives: OsrmAlternative.number(2),
      // annotations: OsrmAnnotation.true_,
      steps: false, // Desactivar los pasos detallados de la ruta
      annotations:
          OsrmAnnotation.false_, // Desactivar las anotaciones detalladas
      alternatives: OsrmAlternative.false_, // No solicitar rutas alternativas
    );
    final route = await osrm.route(options);
    var location;
    distance = route.routes.first.distance!.toDouble();
    duration = route.routes.first.duration!;
    points = route.routes.first.geometry!.lineString!.coordinates.map((e) {
      location = e.toLocation();
      return LatLng(location.lat, location.lng);
    }).toList();
    if (kDebugMode) {
      print(points);
    }

    setState(() {
      // Centra la cámara después de cambiar la ruta
      mapController.move(
          calculateCenter(from, to), calculateDynamicZoom((distance / 1000)));
    });
  }

  // pairly
  bool isPairly = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController envioSolicitadoController = TextEditingController();
    final FocusNode _focusNode = FocusNode();
    double dynamicZoom = calculateDynamicZoom((distance / 1000));
    AsyncValue<Ubicacion> ubicacionProvider =
        ref.watch(updatedLocationProviderClient);

    Ubicacion ubicacion;
    if (ubicacionProvider.value != null) {
      ubicacion = ubicacionProvider.value!;
      realizarDesplazamiento(ubicacion);
      //boorrar en la version final esto

/*       if (to != null) {
        AsyncValue<Ubicacion> ubicacionProvider2 =
            ref.watch(updatedLocationProvider(to));

        if (ubicacionProvider2.value != null) {
/*           double ulatf = double.parse(ubicacionProvider.value!.latitud);
          double ulonf = double.parse(ubicacionProvider.value!.longitud);
          to = LatLng(
            ulatf,
            ulonf,
          ); */
          getRoute();
          setState(() {
            initialValue = ubicacionProvider2.value!.road;
          });
        }
      } */

      return Scaffold(
        body: Stack(
          children: [
            FlutterMap(
              mapController: mapController, // Asigna el controlador del mapa
              options: MapOptions(
/*                 onTap: (_, point) {
                  to = point;
                  setState(() {});
                  if (to != null) getRoute();
                }, */
                initialCenter: from,
                initialZoom: dynamicZoom,
                maxZoom: 17,
                minZoom: 13,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: const ['a', 'b', 'c'],
                ),

                /// [PolylineLayer] draw the route between two coordinates [from] and [to]
                if (to != null)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: points,
                        strokeWidth: 4.0,
                        color: Colors.cyan.shade400,
                      ),
                      // Polilínea animada en verde
/*                     Polyline(
                      points: points,
                      strokeWidth: 2.0,
                      color: Colors.green,
                    ), */
                    ],
                  ),

                /// [MarkerLayer] draw the marker on the map
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: from,
                      child: Icon(
                        Icons.location_on,
                        color: Colors.cyan.shade400,
                        size: dynamicZoom * 3,
                      ),
                    ),
                    if (to != null)
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: to,
                        child: Icon(
                          Icons.location_on,
                          color: const Color(0xffFFD54B),
                          size: dynamicZoom * 3,
                        ),
                      ),

/*                     /// in the middle of [points] list we draw the [Marker] shows the distance between [from] and [to]
                    if (points.isNotEmpty)
                      Marker(
                        rotate: true,
                        width: 96.0,
                        height: 32.0,
                        point: points[math.max(0, (points.length / 2).floor())],
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${(distance / 1000).toStringAsFixed(2)} km',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                   */
                  ],
                ),

                // copy right text
              ],
            ),

            /// [Form] with two [TextFormField] to get the coordinates [from] and [to]
            if (false)
              Padding(
                padding:
                    const EdgeInsets.only(top: 0.0, left: 0.0, right: 64.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                    color: Colors.grey.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: TextFormField(
                        onChanged: (value) {
                          if (distance != 0) {
                            IconoView = 2;
                          }
                          if (distance == 0) {
                            IconoView = 1;
                          }
                        },
                        onEditingComplete: () {
                          if (envioSolicitadoController.text.isNotEmpty) {
                            response = decodificarDeepLink(
                                envioSolicitadoController.text);
                            to = LatLng(
                              response.latitud,
                              response.longitud,
                            );
                          }
                          getRoute();
                          _focusNode.unfocus();
                          DetallesDelVija = true;
                        },
                        controller: envioSolicitadoController,
                        focusNode: _focusNode,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.location_on),
                          prefix: const Text('Pront: '),
                          border: const OutlineInputBorder().copyWith(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                        )),
                  ),
                ),
              ),
            if (DetallesDelVija)
              Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.yellow.shade100,
                        child: Text(
                          // km and hour
                          'Tiempo Aproximado de entrega: ${((formatDuration(duration)))}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.yellow.shade100,
                        child: Text(
                          // km and hour
                          'Distancia del trayecto: ${(distance / 1000).toStringAsFixed(2)} km',
                          style: const TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.yellow.shade100,
                        child: Text(
                          // km and hour
                          'Servicio: ${(CalcularCostoDelServicio(response.monto, (distance / 1000))).toStringAsFixed(2)} USD',
                          style: const TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
/*             if (DetallesDelVija)
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.yellow.shade100,
                    child: const Text(
                      // km and hour
                      'Seleccione metodo de confirmacion',
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
             */
/*             if (DetallesDelVija)
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 26.0, left: 16.0, right: 16.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.cyan.shade400,
                          ), // Cambia a tu color deseado
                        ),
                        icon: const Icon(
                          Icons.check_circle,
                        ),
                        onPressed: () {
                          // Compartir texto
/*                       ShareHelper.shareText('Hola, ¿cómo estás?',
                              subject: 'Saludo'); */
                          _confirmarEnvioSMS(
                              response, '51979128', to, (distance / 1000));
                        },
                        label: const Text('SMS'),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.cyan.shade400,
                          ), // Cambia a tu color deseado
                        ),
                        icon: const Icon(
                          Icons.check_circle,
                        ),
                        onPressed: () {
                          // Compartir texto
/*                       ShareHelper.shareText('Hola, ¿cómo estás?',
                              subject: 'Saludo'); */
                          _confirmarEnvioW(
                              response, '51979128', to, (distance / 1000));
                        },
                        label: const Text('Whatsapp'),
                      ),
                    ],
                  ),
                ),
              ), */
            if (false)
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    margin: const EdgeInsets.all(20),
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            children: [
                              // grey text display the duration between [from] and [to] and the distance

                              const SizedBox(height: 16),
                              ElevatedButton.icon(
                                icon: const Icon(
                                  Icons.location_on,
                                ),
                                onPressed: () {
                                  _composeSms(
                                      generateDeepLink(
                                          from.latitude,
                                          from.longitude,
                                          400,
                                          '5351979128',
                                          '785'),
                                      '5351979128');
                                  if (to != null) getRoute();
                                },
                                label: const Text('Compartir Ubicacion'),
                              ),
                              ElevatedButton.icon(
                                icon: const Icon(
                                  Icons.verified_user,
                                ),
                                onPressed: () {
                                  if (!envioSolicitadoController.text.isEmpty) {
                                    response = decodificarDeepLink(
                                        envioSolicitadoController.text);
                                    to = LatLng(
                                      response.latitud,
                                      response.longitud,
                                    );
                                  }
                                  getRoute();
                                },
                                label: const Text('Recivir Envio'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    }
    return mProgressIndicator();
  }

  Future<void> realizarDesplazamiento(Ubicacion ubicacion) async {
    double ulat = double.parse(ubicacion.latitud);
    double ulon = double.parse(ubicacion.longitud);

    double desplazamientoMetros = 200;

    double nuevaLatitud = ulat + (desplazamientoMetros / 111111);
    double nuevaLongitud = ulon;

    from = LatLng(
      ulat,
      ulon,
    );

    to = LatLng(
      nuevaLatitud,
      nuevaLongitud,
    );

    await getRoute(); // Asumo que 'getRoute' es una función asíncrona
    DetallesDelVija = true;
  }

  double calculateDynamicZoom(double distance) {
    // Ajusta este valor según sea necesario
    const double zoomFactor = 10.0;

    // Calcula el zoom en función de la distancia
    double zoom = zoomFactor / distance;

    if (distance < 1) {
      return 18;
    } else if (distance > 8) {
      return 13;
    } else {
      return 15;
    }
  }
}

double CalcularCostoDelServicio(double monto, double distance) {
  var costoDelFee = 1;
  if (distance < 2) {
    var costoOperacion = 0.50; //usd
    var mensajeroCosto = 0.25;
    return (distance * mensajeroCosto + costoOperacion);
  } else if (distance > 6) {
    var costoOperacion = 0.5; //usd
    var mensajeroCosto = 0.25;
    return (distance * mensajeroCosto + costoOperacion);
  } else {
    var costoOperacion = 0.75; //usd
    var mensajeroCosto = 0.25;
    return (distance * mensajeroCosto + costoOperacion);
  }
}

//-------------------------------------------------------------

Future<void> _handleInitialLink() async {
  try {
    final initialLink = await getInitialLink();
    if (initialLink != null) {
      _handleDeepLink(initialLink);
    }
  } catch (err) {
    print('Error manejando enlace profundo inicial: $err');
  }
}

void _handleDeepLink(String link) {
  // Aquí puedes manejar el enlace profundo recibido
  print('Enlace profundo recibido: $link');
}

Future<void> _openDeepLink() async {
  // Aquí construyes tu enlace profundo
  final deepLink = 'de_envio_seguro://ubicacion?lat=10.0&lng=20.0';

  if (await canLaunch(deepLink)) {
    await launch(deepLink);
  } else {
    print('Could not launch $deepLink');
  }
}

/* void _composeMail() {
// #docregion encode-query-parameters
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'smith@example.com',
    query: encodeQueryParameters(<String, String>{
      'subject': 'Example Subject & Symbols are allowed!',
    }),
  );

  launchUrl(emailLaunchUri);
// #enddocregion encode-query-parameters
} */

void enviarMensaje(String mensaje, String numeroTelefono) async {
  // Formato del mensaje y número para SMS
  String formatoSMS = 'sms:$numeroTelefono?body=$mensaje';

  // Formato del mensaje para WhatsApp
  String formatoWhatsApp =
      'whatsapp://send?phone=$numeroTelefono&text=$mensaje';

  // Intenta abrir la aplicación de WhatsApp
  if (await canLaunch(formatoWhatsApp)) {
    await launch(formatoWhatsApp);
  } else {
    // Si falla, abre la aplicación de SMS
    if (await canLaunch(formatoSMS)) {
      await launch(formatoSMS);
    } else {
      throw 'No se pudo abrir la aplicación de WhatsApp ni la de SMS';
    }
  }
}

void _confirmarEnvioSMS(
    SolicitudDeEnvio response, String phoneNomber, to, double distance) {
  String body =
      'Entregar:${response.id},NoCasa:${response.NumeroDeCasa},${response.latitud},${response.longitud},Recoger:${to.latitude},${to.longitude},Costo del Servicio:${(CalcularCostoDelServicio(response.monto, (distance / 1000))).toStringAsFixed(2)}USD';

// #docregion sms
  final Uri smsLaunchUri = Uri(
    scheme: 'sms',
    path: '51979128',
    queryParameters: <String, String>{'body': body},
  );
// #enddocregion sms
  launchUrl(smsLaunchUri);
}

void _confirmarEnvioW(
    SolicitudDeEnvio response, String phoneNomber, to, double distance) {
  String body =
      'Entregar:${response.id},NoCasa:${response.NumeroDeCasa},${response.latitud},${response.longitud},Recoger:${to.latitude},${to.longitude},Costo del Servicio:${(CalcularCostoDelServicio(response.monto, (distance / 1000))).toStringAsFixed(2)}USD';

  var whatsapp = phoneNomber;
  var mensaje = body;
  var whatsappAndroid =
      Uri.parse("whatsapp://send?phone=$whatsapp&text=$mensaje");

// #enddocregion sms
  launchUrl(whatsappAndroid);
}

void _composeSms(String deeplink, String phoneNomber) {
// #docregion sms
  final Uri smsLaunchUri = Uri(
    scheme: 'sms',
    path: phoneNomber,
    queryParameters: <String, String>{
      'body': Uri.encodeComponent(deeplink),
    },
  );
// #enddocregion sms
  launchUrl(smsLaunchUri);
}

String generateDeepLink(double latitud, double longitud, int monto,
    String phoneNomber, String NumeroDeCasa) {
  // Base URL de tu aplicación
  String baseUrl = "de_envio_seguro://";

  // Parámetros de consulta
  String queryParams =
      "la=$latitud&m=$monto&pn=$phoneNomber&nc=$NumeroDeCasa&lo=$longitud";

  // Construye la URL completa
  String deepLink = "$baseUrl?$queryParams";

  return deepLink;
}

SolicitudDeEnvio decodificarDeepLink(String deepLink) {
  SolicitudDeEnvio response = SolicitudDeEnvio(
      id: '', latitud: 0, longitud: 0, NumeroDeCasa: '', monto: 0);
  try {
    // Decodifica el enlace profundo
    String decodedDeepLink = Uri.decodeComponent(deepLink);

    String info = decodedDeepLink.split('?')[1];

    Map<String, String> queryParams = parseQueryString(info);

    int phoneNomber = int.parse(queryParams['pn']!);
    int numeroDeCasa = int.parse(queryParams['nc']!);
    double latitud = double.parse(queryParams['la']!);
    double longitud = double.parse(queryParams['lo']!);
    double monto = double.parse(queryParams['m']!);

    return SolicitudDeEnvio(
        id: phoneNomber.toString(),
        latitud: latitud,
        longitud: longitud,
        NumeroDeCasa: numeroDeCasa.toString(),
        monto: monto);
  } catch (err) {
    showToast('Algo Salio mal Intente copiar otra vez el mensaje');
  }
  return response;
}

Map<String, String> parseQueryString(String queryString) {
  List<String> pairs = queryString.split("&");

  Map<String, String> params = {};

  for (String pair in pairs) {
    List<String> keyValue = pair.split("=");
    if (keyValue.length == 2) {
      String key = keyValue[0];
      String value = keyValue[1];
      params[key] = value;
    }
  }

  return params;
}

void showToast(String mensaje) {
  Fluttertoast.showToast(
    msg: mensaje,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

//---------------------------------------------------------------------
LatLng calculateCenter(LatLng from, LatLng to) {
  double centerLatitude = (from.latitude + to.latitude) / 2;
  double centerLongitude = (from.longitude + to.longitude) / 2;

  return LatLng(centerLatitude, centerLongitude);
}

String formatDuration(durationInMinutes) {
  if (durationInMinutes < 60) {
    // Menos de una hora
    return '$durationInMinutes minutos';
  } else if (durationInMinutes < 1440) {
    // Menos de 24 horas
    int hours = durationInMinutes ~/ 60;
    int minutes = durationInMinutes % 60;
    return '$hours horas ${minutes > 0 ? '$minutes minutos' : ''}';
  } else {
    // 24 horas o más
    int days = durationInMinutes ~/ 1440;
    int hours = (durationInMinutes % 1440) ~/ 60;
    return '$days días ${hours > 0 ? '$hours horas' : ''}';
  }
}

/* Widget CapturarInfo() {
  return Container(
    color: Colors.red,
    height: 96,
    width: 96,
    child: ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.cyan.shade400,
        ), // Cambia a tu color deseado
      ),
      icon: const Icon(
        Icons.check_circle,
      ),
      onPressed: () async {
        // Obtener el texto del portapapeles
        ClipboardData? clipboardText = (await Clipboard.getData('text/plain'));

        // Verificar si se encontró texto en el portapapeles
        if (clipboardText != null && clipboardText.text != null) {
          // Hacer algo con el texto, por ejemplo, guardarlo en una variable
          response = decodificarDeepLink(clipboardText.text!);
          to = LatLng(
            response.latitud,
            response.longitud,
          );
          getRoute();
          _focusNode.unfocus();
          DetallesDelVija = true;
        } else {
          showToast(
              'Por favor si ya recivio el sms copielo antes de continuar.');
        }
      },
      label: const Text('Whatsapp'),
    ),
  );
}
 */