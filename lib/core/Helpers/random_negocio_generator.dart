import 'dart:math';
import 'package:minegociomenu/core/Helpers/random_category_generator.dart';
import 'package:minegociomenu/core/Helpers/random_generator.dart';
import 'package:minegociomenu/presentation/Screens/negocio/domain/negocio.dart';
import 'package:minegociomenu/core/utils/example_date.dart';
import 'package:uuid/uuid.dart';

class RandomNegocioGenerator {
  static final List<String> negocios = [
    'MIPYME Tech Solutions',
    'Cafetería La Esquina',
    'Taller Mecánico Veloz',
    'Tienda de Ropa Elegante',
    'Diseño Gráfico Creativo',
    'Tecnología Innovadora MIPYME',
    'Delicias de la Cocina Casera',
    'Flores y Detalles MIPYME',
    'Servicios Contables ProFiscal',
    'Consultoría Empresarial Estrategia',
  ];

  static final Set<String> usedNegocio = <String>{};
  final Random random = Random();

  static final randomNegocioGenerator = RandomNegocioGenerator();

  static String getRandomNameNegocio() {
    return RandomNegocioGenerator.negocios[randomNegocioGenerator.random
        .nextInt(RandomNegocioGenerator.negocios.length)];
  }

  String getRandomNegocio2() {
    if (usedNegocio.length == negocios.length) {
      // Se han utilizado todos los productos, así que se reinicia el conjunto.
      usedNegocio.clear();
    }

    String negocio;

    do {
      final randomIndex = random.nextInt(negocios.length);
      negocio = negocios[randomIndex];
    } while (usedNegocio.contains(negocio));

    usedNegocio.add(negocio);
    return negocio;
  }

  static List<Negocio> gerNegocioList() {
    List<Negocio> result = [];
    late int a = 0;
    while (a++ < 10) {
      String s = getRandomNameNegocio();
      result.add(getRandomNegocio());
    }
    return result;
  }

  static Negocio getRandomNegocio() {
    String c = RandomCategoryGenerator.getRandomNameCategoria();
    final id = const Uuid().v4();
    final nombre = getRandomNameNegocio();
    final descripcion = 'descripcion';
    final direccion = obtenerDireccionAleatoria();
    final telefono = ranmdonTelefono();
    final email = generarEmailEmpresarialAleatorio();
    final img1 = RandomGenerator.GeTimageRandom(c);
    final img2 = RandomGenerator.GeTimageRandom(c);
    final categoria = c;

    return Negocio(
      id: id,
      nombre: nombre,
      descripcion: 'descripciono',
      direccion: direccion,
      telefono: telefono,
      email: email,
      img1: img1,
      img2: img2,
      favorito: false, // Indica si es un negocio favorito
      categoria: categoria,
    );
  }
}
