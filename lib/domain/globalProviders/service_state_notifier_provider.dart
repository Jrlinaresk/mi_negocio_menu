import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/conf/Helpers/random_service_generator.dart';
import 'package:minegociomenu/disaing/Screens/services/domain/service_model.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final ServiceStateNotifierProvider =
    StateNotifierProvider<ServiceNotifier, List<Service>>((ref) {
  return ServiceNotifier();
});

class ServiceNotifier extends StateNotifier<List<Service>> {
  ServiceNotifier() : super(RandomServiceGenerator.gerServiceList());

  void addService() {
    state = [
      ...state,
      Service(
        serviceId: 'serviceId',
        name: 'name',
        image: 'image',
        description: 'description',
        type: ['Tipo 1', 'Tipo 2', 'Tipo 3'],
        price: 'price',
        unit_of_measure: 'unit_of_measure',
        quantity: 'quantity',
        telefono: 'telefono',
        provincia: 'provincia',
        starRate: 4.5, // Cambia la calificación según sea necesario
      ),
    ];
  }

/*   void toogleServiceFavorito(bool b) {
    state = state.map((Service) {
      if (b) {
        return Service.copyWith(favorito: true);
      } else
        return Service.copyWith(favorito: false);
    }).toList();
  } */

  void toggleServiceFavorito(int index, bool isFavorito) {
    state[index] = state[index].copyWith(favorito: isFavorito);
  }
}
