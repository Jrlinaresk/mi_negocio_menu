import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/disaing/Screens/products/domain/product_model.dart';

final lastView = StateProvider<Product>((ref) {
  return Product(
    id: 0, // ID debe establecerse adecuadamente si no es cero
    productId: '',
    name: '',
    modelo: 'ds345',
    price: '',
    garantia: '',
    disponibilidad: 0,
    description: '',
    mayorista: 0,
    nota: 'randomNota',
    unidadMedidaId: 1,
    estadoId: 1,
    formaDePagoId: 1,
    empresaId: 1,
    createdAt: '',
    updatedAt: '',
    monedaId: '1',
    image1: 'assets/productos/product-01.jpg',
    image2: 'assets/productos/product-02.jpg',
    mensajeria: 0,
    favorito: false,
    types: [],
  );
});
