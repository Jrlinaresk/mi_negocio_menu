import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;
import 'package:latlong2/latlong.dart';
import 'package:minegociomenu/disaing/Screens/Maps/mapom/providers/location_provider_lite.dart';
import 'package:minegociomenu/models/ubicacion_tools/domain/ubicacion.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class mSearchBar extends ConsumerStatefulWidget {
  final String mSearchBarHintText;
  final Duration? mSearchBarDebounceDuration;
  final void Function(Exception e)? onError;
  final Future<void> Function() getRoute;

  const mSearchBar({
    super.key,
    this.mSearchBarHintText = 'Donde quiere ir?',
    this.mSearchBarDebounceDuration,
    this.onError,
    required this.getRoute,
  });

  @override
  _mSearchBarState createState() => _mSearchBarState();
}

class _mSearchBarState extends ConsumerState<mSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  bool isEmpty = true;
  final FocusNode _focusNode = FocusNode();
  List<Ubicacion> _options = <Ubicacion>[];
  late List<Ubicacion> posiblesCoincidencias;
  List posiblesCoincidenciasAdrress = [];
  late Ubicacion upicket;
  Timer? _debounce;
  late void Function(Exception e) onError;
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_updateIsEmpty);
  }

  void _updateIsEmpty() {
    setState(() {
      isEmpty = _searchController.text.isEmpty;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildmSearchBar(context);
  }

  Widget _buildmSearchBar(BuildContext context) {
    final locaLitetionNotifier =
        ref.read(LocationLiteStateNotifierProvider.notifier);
    OutlineInputBorder inputBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    );
    OutlineInputBorder inputFocusBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue.shade400, width: 2.0),
    );

    return Positioned(
      top: 0,
      left: 8,
      right: 8,
      child: Container(
        margin: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Focus(
              onFocusChange: (hasFocus) {
                setState(() {
                  this.hasFocus = hasFocus;
                });
              },
              child: TextFormField(
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.grey.shade900),
                controller: _searchController,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  hintText: widget.mSearchBarHintText,
                  hintTextDirection: TextDirection.ltr,
                  border: inputBorder,
                  focusedBorder: inputFocusBorder,
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.location_on,
                      color: hasFocus ? Colors.blue : Colors.grey,
                    ),
                  ),
                  suffixIconColor: hasFocus ? Colors.blue : Colors.grey,
                  suffixIcon: IconButton(
                    onPressed: () async {
                      _searchController.clear();
                      _options.clear();
                      await widget.getRoute();
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.close,
                      color: !isEmpty ? Colors.red : Colors.grey.shade100,
                    ),
                  ),
                ),
                onChanged: (String value) {
                  if (_debounce?.isActive ?? false) {
                    _debounce?.cancel();
                  }
                  setState(() {});
                  _debounce = Timer(
                    widget.mSearchBarDebounceDuration ??
                        const Duration(milliseconds: 500),
                    () async {
                      var client = http.Client();
                      try {
                        String url =
                            'https://nominatim.openstreetmap.org/search?q=$value&format=json&polygon_geojson=1&addressdetails=1&accept-language=es&countrycodes=Cu';
                        var response = await client.get(Uri.parse(url));

                        var addressInfo;

                        if (response.statusCode == 200) {
                          var decodedResponse =
                              jsonDecode(utf8.decode(response.bodyBytes))
                                  as List<dynamic>;

                          for (var element in decodedResponse) {
                            addressInfo = element['address'];
                            posiblesCoincidenciasAdrress.add(addressInfo);
                          }
                          //
                          var generalInfo = decodedResponse;

                          for (var e in generalInfo) {
                            _options.add(Ubicacion(
                              id: 0,
                              longitud: e['lon'],
                              latitud: e['lat'],
                              display_name: e['display_name'],
                              city: e['address']['city_district'],
                              road: 'Sin necesidad',
                              country: e['address']['country'],
                              county: e['address']['county'],
                              suburb: e['address'][
                                  'name'], // el key en otras llamadas es suburb pero el valor es es mismo
                              postcode: 'Sin determinar',
                              favorito: false,
                              types: [e['addresstype']],
                            ));
                          }
                          int a = 0;

/*                           PosiblesCoincidencias[0] = Ubicacion(
                              id: 0,
                              longitud: _options.first.longitude.toString(),
                              latitud: _options.first.latitude.toString(),
                              city: _options.first.displayname,
                              road: 'road',
                              country: 'country',
                              county: 'county',
                              suburb: 'suburb',
                              postcode: 'postcode',
                              favorito: false,
                              types: []);
                           */
                          //upicket = Ubicacion.fromJson(data);
                          // Actualizar el estado con las nuevas ubicaciones
                          locaLitetionNotifier.updateUbicacionesLite(_options);

                          int aa = 0;
                        } else {
                          throw Exception(
                              'Error al obtener información de ubicación');
                        }

                        setState(() {});
                      } on Exception catch (e) {
                        onError(e);
                      } finally {
                        client.close();
                      }
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            StatefulBuilder(
              builder: ((context, setState) {
                return _buildListView();
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _options.length > 5 ? 5 : _options.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            _options[index].display_name!,
            style: TextStyle(color: Colors.grey.shade800),
          ),
          subtitle: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Latitud: ',
                    style:
                        TextStyle(color: Colors.grey.shade500, fontSize: 12.0),
                  ),
                  Text(
                    _options[index].latitud,
                    style:
                        TextStyle(color: Colors.grey.shade500, fontSize: 12.0),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Longitud: ',
                    style:
                        TextStyle(color: Colors.grey.shade500, fontSize: 12.0),
                  ),
                  Text(
                    _options[index].longitud,
                    style:
                        TextStyle(color: Colors.grey.shade500, fontSize: 12.0),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              )
            ],
          ),
          onTap: () {
/*             upicket = decodedResponse
                .map((e) => Ubicacion(
                    id: 0, // int.parse(_uuid.v4())
                    longitud: e['lon'],
                    latitud: e['lat'],
                    city: e['address']['city'],
                    road: e['address']['road'],
                    country: e['address']['country'],
                    county: e['address']['county'],
                    suburb: e['address']['suburb'],
                    postcode: e['address']['postcode'],
                    favorito: false,
                    types: []))
                .toList()[0]; */
            _searchController.text = '';
            _searchController.text = _options[index].display_name!;
            LatLng center = LatLng(double.parse(_options[index].latitud),
                double.parse(_options[index].longitud));
/*             _animatedMapMove(center.toLatLng(), 18.0);
            onLocationChanged(center); */
            _focusNode.unfocus();
            _options.clear();
            setState(() {});
          },
        );
      },
    );
  }
}
