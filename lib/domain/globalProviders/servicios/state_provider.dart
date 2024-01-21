import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/disaing/Screens/services/domain/service_model.dart';

final lastView = StateProvider<Service>((ref) {
  return Service(
      serviceId: 'serviceId',
      name: 'name',
      image: 'image',
      description: 'description',
      type: [],
      price: '56',
      unit_of_measure: 'unit_of_measure',
      quantity: 'quantity',
      telefono: 'telefono',
      provincia: 'provincia');
});
