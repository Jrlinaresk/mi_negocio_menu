import 'dart:math';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:minegociomenu/core/Helpers/random_generator.dart';

String ranmdonTelefono() {
  return '+53${10000000 + Random().nextInt(10000000)}';
}

String obtenerProvinciaAleatoria() {
  final provincias = [
    'Pinar del Río',
    'Artemisa',
    'La Habana',
    'Mayabeque',
    'Matanzas',
    'Cienfuegos',
    'Villa Clara',
    'Sancti Spíritus',
    'Ciego de Ávila',
    'Camagüey',
    'Las Tunas',
    'Holguín',
    'Granma',
    'Santiago de Cuba',
    'Guantánamo',
  ];

  final random = Random();
  final indiceAleatorio = random.nextInt(provincias.length);
  return provincias[indiceAleatorio];
}

String obtenerUnidadDeMedidaAleatoria() {
  final unidadesDeMedida = [
    'kg',
    'g',
    'litros',
    'metros',
    'unidades',
    'docenas'
  ];
  final random = Random();
  final indiceAleatorio = random.nextInt(unidadesDeMedida.length);
  return unidadesDeMedida[indiceAleatorio];
}

String entregaACasaAleatoria() {
  final random = Random();
  final tieneEntregaACasa = random.nextBool();
  return tieneEntregaACasa ? 'Tiene entrega a casa' : 'No tiene entrega a casa';
}

String obtenerCantidadAleatoria() {
  final random = Random();
  final cantidadAleatoria =
      (random.nextInt(100) + 1).toString(); // Números aleatorios del 1 al 100
  return cantidadAleatoria;
}

String obtenerPrecioAleatorio() {
  final random = Random();
  final precioAleatorio = 10 + random.nextDouble() * 490;

  final formatter = NumberFormat.simpleCurrency(locale: 'en_US');
  final precioFormateado = formatter.format(precioAleatorio);

  return precioFormateado;
}

String FormatearDinero(int s) {
  final formatter = NumberFormat.simpleCurrency(locale: 'en_US');
  final precioFormateado = formatter.format(s);
  return precioFormateado;
}

List<String> obtenerTipoServicioAleatorio() {
  final tiposDeServicio = [
    'Autos',
    'Belleza',
    'Construcción',
    'Decoración',
    'Electrónica',
    'Tecnología'
  ];
  final random = Random();
  final cantidadTipos = random.nextInt(3) + 1; // Entre 1 y 3 tipos aleatorios
  final tiposAleatorios = List<String>.generate(cantidadTipos, (index) {
    final indiceAleatorio = random.nextInt(tiposDeServicio.length);
    return tiposDeServicio[indiceAleatorio];
  });
  return tiposAleatorios;
}

String obtenerDireccionAleatoria() {
  final provinciasCuba = [
    'Pinar del Río',
    'Artemisa',
    'La Habana',
    'Mayabeque',
    'Matanzas',
    'Cienfuegos',
    'Villa Clara',
    'Sancti Spíritus',
    'Ciego de Ávila',
    'Camagüey',
    'Las Tunas',
    'Holguín',
    'Granma',
    'Santiago de Cuba',
    'Guantánamo',
  ];

  final random = Random();
  final provinciaAleatoria =
      provinciasCuba[random.nextInt(provinciasCuba.length)];
  final numeroCalleAleatorio = random.nextInt(1000) + 1; // Entre 1 y 1000
  final nombreCalleAleatorio =
      'Calle ' + String.fromCharCode(random.nextInt(26) + 65); // A-Z

  final direccionAleatoria =
      '$numeroCalleAleatorio, $nombreCalleAleatorio, $provinciaAleatoria, Cuba';
  return direccionAleatoria;
}

String generarEmailEmpresarialAleatorio() {
  final empresas = [
    'autocar',
    'tegnopremier',
    'azcuba',
    'bella',
    'juguetescubanos',
  ];

  final nombres = [
    '',
    'mipyme',
    'tcp',
    'jose',
    'anita',
  ];

  final random = Random();
  final nombreAleatorio = nombres[random.nextInt(nombres.length)];
  final empresaAleatoria = empresas[random.nextInt(empresas.length)];
  final dominio = 'gmail.com'; // Puedes cambiarlo al dominio de tu elección

  final emailEmpresarialAleatorio =
      '$nombreAleatorio@$empresaAleatoria.$dominio';
  return emailEmpresarialAleatorio;
}

List<String> obtenerCategoriasAleatorias() {
  final categoriasDisponibles = [
    'Alimentos',
    'Autos',
    'Belleza',
    'Construcción',
    'Decoración',
    'Electrónica',
    'Envases',
    'Juguetes',
    'Muebles',
    'Ropa',
    'Tecnología',
  ];

  final random = Random();
  final cantidadCategorias =
      random.nextInt(1) + 1; // Entre 1 y 1 categorías aleatorias
  final categoriasAleatorias =
      List<String>.generate(cantidadCategorias, (index) {
    final indiceAleatorio = random.nextInt(categoriasDisponibles.length);
    return categoriasDisponibles[indiceAleatorio];
  });

  return categoriasAleatorias;
}

String generarNombreProductoAleatorio(List<String> categorias) {
  final nombresPorCategoria = {
    'Alimentos': ['Manzanas', 'Arroz', 'Leche', 'Pan', 'Aceite'],
    'Autos': [
      'Coche',
      'Motocicleta',
      'Neumáticos',
      'Aceite de motor',
      'Frenos'
    ],
    'Belleza': ['Perfume', 'Maquillaje', 'Champú', 'Cremas', 'Afeitadora'],
    'Construcción': [
      'Ladrillos',
      'Cemento',
      'Herramientas',
      'Pintura',
      'Madera'
    ],
    'Decoración': ['Cuadros', 'Lámparas', 'Muebles', 'Alfombras', 'Cortinas'],
    'Electrónica': ['Teléfono', 'Portátil', 'Televisor', 'Tablet', 'Cámara'],
    'Envases': ['Botellas', 'Cajas', 'Bolsas', 'Frascos', 'Bidones'],
    'Juguetes': [
      'Muñecas',
      'Coches de juguete',
      'Rompecabezas',
      'Pelotas',
      'Juegos de mesa'
    ],
    'Muebles': ['Sofá', 'Silla', 'Mesa', 'Armario', 'Cama'],
    'Ropa': ['Camiseta', 'Pantalones', 'Vestido', 'Zapatos', 'Abrigo'],
    'Tecnología': [
      'Auriculares',
      'Altavoces',
      'Reloj inteligente',
      'Router',
      'Cargador'
    ],
  };

  final random = Random();
  final nombresAleatorios = <String>[];

  for (final categoria in categorias) {
    final nombresCategoria = nombresPorCategoria[categoria];
    if (nombresCategoria != null && nombresCategoria.isNotEmpty) {
      final nombreAleatorio =
          nombresCategoria[random.nextInt(nombresCategoria.length)];
      nombresAleatorios.add(nombreAleatorio);
    } else {
      nombresAleatorios
          .add('Nombre de producto no disponible para la categoría $categoria');
    }
  }

  return nombresAleatorios
      .first; // Devuelve una lista de nombres separados por comas
}

var FechaActual = RandomGenerator.getFormattedDateTime();

String getAssetPath(String index) {
  switch (index) {
    case "Granos":
      return 'categorias/ic_granos.png';
    case 'Carnes':
      return 'categorias/ic_carnes.png';
    case "Bebidas":
      return 'categorias/ic_bebidas.png';
    case "Dulces":
      return 'categorias/ic_dulces.png';
    case "Panaderia":
      return 'categorias/ic_panaderia.png';
    case "Lacteos":
      return 'categorias/ic_lacteos.png';
    case "Enlatados":
      return 'categorias/ic_enlatados.png';
    case "Combos":
      return 'categorias/ic_combos.png';
    default:
      return 'categorias/ic_combos.png';
  }
}
