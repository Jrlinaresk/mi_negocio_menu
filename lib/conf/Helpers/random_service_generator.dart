import 'dart:math';
import 'package:minegociomenu/disaing/Screens/services/domain/service_model.dart';
import 'package:minegociomenu/utils/example_date.dart';
import 'package:uuid/uuid.dart';

class RandomServiceGenerator {
  static Service getRandomService() {
    final serviceId = const Uuid().v4();
    final name = getRandomNameService();
    const image = 'assets/service.jpg';
    const description =
        'Descripción aleatoria del producto.... Descripción aleatoria del producto.... Descripción aleatoria del producto.... Descripción aleatoria del producto.... Descripción aleatoria del producto.... ';
    var type = obtenerTipoServicioAleatorio();
    var price = obtenerPrecioAleatorio();
    var unitOfMeasure = obtenerUnidadDeMedidaAleatoria();
    var quantity = obtenerCantidadAleatoria();
    var telefono = ranmdonTelefono();
    var provincia = obtenerProvinciaAleatoria();
    const starRate = 3.0;

    return Service(
      serviceId: serviceId,
      name: name,
      image: image,
      description: description,
      type: type,
      price: price,
      unit_of_measure: unitOfMeasure,
      quantity: quantity,
      telefono: telefono,
      provincia: provincia,
      starRate: starRate,
    );
  }

  static List<Service> gerServiceList() {
    late List<Service> result = [];
    late int a = 0;
    while (a++ < 6) {
      result.add(getRandomService());
    }
    return result;
  }

  static final List<String> services = [
    'Autos',
    'Belleza',
    'Construcción',
    'Decoración',
    'Electrónica',
    'Tecnología',
  ];

  final Set<String> usedCategories = <String>{};
  final Random random = Random();

  String getRandomCategory() {
    if (usedCategories.length == services.length) {
      // Se han utilizado todas las categorías, así que se reinicia el conjunto.
      usedCategories.clear();
    }

    String service;

    do {
      final randomIndex = random.nextInt(services.length);
      service = services[randomIndex];
    } while (usedCategories.contains(service));

    usedCategories.add(service);
    return service;
  }

  static final randomCategoryGenerator = RandomServiceGenerator();

  static String getRandomNameService() {
    return randomCategoryGenerator.getRandomCategory();
  }

  static Service getServiceById(String serviceId) {
    final service = gerServiceList().firstWhere(
      (service) =>
          service.serviceId ==
          serviceId, // Devolver null si no se encuentra un producto con el ID
    );
    return service;
  }
//
}
