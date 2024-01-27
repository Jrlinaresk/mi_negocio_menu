import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/core/config/api_config.dart';
import 'package:minegociomenu/domain/data/remote/servicio/servicio_x_categoria/servicio_x_categoria.dart';
import 'package:minegociomenu/domain/globalProviders/01categoria/categoria.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:minegociomenu/domain/models/negocios/negocios.dart';

class NegocioNotifier extends Notifier<Negocio> {
  final AsyncValue<Negocio> negocios;
  final String baseUrl;
  final String authToken;
  final LastViewNotifier lastViewNotifier;

  NegocioNotifier(
    this.negocios,
    this.baseUrl,
    this.authToken,
    this.lastViewNotifier,
  ) : super();

  @override
  Negocio build() {
    return negocios.when(
      data: (data) => data,
      loading: () => Negocio(
          nombre: 'nombre',
          ImagenUrl: [],
          LogoUrl: 'LogoUrl',
          WhatsAppLink: 'WhatsAppLink',
          Provincia: 'Provincia',
          DiasLaborables: 'DiasLaborables',
          HorarioLaborable: 'HorarioLaborable',
          estado: 'estado'),
      error: (error, stack) => Negocio(
          nombre: 'nombre',
          ImagenUrl: [],
          LogoUrl: 'LogoUrl',
          WhatsAppLink: 'WhatsAppLink',
          Provincia: 'Provincia',
          DiasLaborables: 'DiasLaborables',
          HorarioLaborable: 'HorarioLaborable',
          estado: 'estado'),
    );
  }

  Future<void> actualizarDatosPeriodicamente() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 30));
    }
  }
}

final negociosProvider = StreamProvider.autoDispose<Negocio>((ref) {
  return _getNegociosStream();
});

Stream<Negocio> _getNegociosStream() async* {
  final categoriaId = 3;

  var apiurlfull =
      '${ApiConfig.apiUrl}${ApiConfig.negociosEndpoint}/$categoriaId';
  while (true) {
    try {
      final response = await http.get(
        Uri.parse(apiurlfull),
      );
      if (response.statusCode == 200) {
        final String responseBody = response.body;
        if (responseBody.isNotEmpty) {
          try {
            final dynamic data = jsonDecode(responseBody);
            final Negocio negocios = Negocio.fromJson(data);
            yield negocios;
          } catch (e) {}
        } else {}
      } else {
        throw Exception('Error al obtener las categorías');
      }
    } catch (e) {
    } finally {
      yield* const Stream.empty();
    }
    await Future.delayed(const Duration(seconds: 120));
  }
}
