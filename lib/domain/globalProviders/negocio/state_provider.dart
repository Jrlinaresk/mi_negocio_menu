import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/presentation/Screens/negocio/domain/negocio.dart';

final lastView = StateProvider<Negocio>((ref) {
  return Negocio(
      id: '',
      nombre: '',
      descripcion: '',
      direccion: '',
      telefono: '',
      email: '',
      img1: '',
      img2: '',
      categoria: '');
});
