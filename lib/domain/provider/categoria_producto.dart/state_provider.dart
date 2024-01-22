import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/domain/models/categoria/categoria.dart';

final clastView = StateProvider<Categoria>((ref) {
  return Categoria(id: 0, nombre: 'a', icono: Icons.account_circle_outlined);
});
