import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/domain/models/servicio_categoria.dart';

final lastView = StateProvider<ServiceCategoria>((ref) {
  return ServiceCategoria();
});
