import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/domain/models/categoria/categoria.dart';

final clastView = StateProvider<Categoria>((ref) {
  return Categoria(id: 1, nombre: 'a', icono: '', NegocioID: 0);
});
