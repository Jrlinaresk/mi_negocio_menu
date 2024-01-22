import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/domain/models/categoria/categoria.dart';

final clastView = StateNotifierProvider<LastViewNotifier, Categoria>((ref) {
  return LastViewNotifier();
});

class LastViewNotifier extends StateNotifier<Categoria> {
  LastViewNotifier() : super(Categoria(id: 0, nombre: ''));

  void updateLastView(Categoria newCategoria) {
    state = newCategoria;
  }

  void setLastView(Categoria categoria) {
    state = categoria;
  }
}
