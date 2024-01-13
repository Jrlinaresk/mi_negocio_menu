import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/domain/entity/dto_categoria.dart';

final lastView = StateProvider<Categoria>((ref) {
  return Categoria();
});
