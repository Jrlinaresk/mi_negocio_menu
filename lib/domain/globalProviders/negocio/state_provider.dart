import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/core/Helpers/random_generator.dart';
import 'package:minegociomenu/domain/models/negocios/negocios.dart';

final lastView = StateProvider<Negocio>((ref) {
  return Negocio(
    nombre: RandomGenerator.getRandomName(),
    descripcion: 'descripcion',
    direccion: 'direccion',
    email: 'email@example.com',
    categoria: "Autos",
    ImagenUrl: [],
    LogoUrl: '',
    WhatsAppLink: '',
    Provincia: '',
    DiasLaborables: '',
    HorarioLaborable: '', estado: '', // Indica si es un negocio favorito
  );
});
