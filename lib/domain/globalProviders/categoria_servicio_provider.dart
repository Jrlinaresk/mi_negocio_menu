import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/conf/Helpers/random_service_generator.dart';
import 'package:minegociomenu/disaing/Screens/services/domain/service_model.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final CategoriaServicioStateNotifierProvider =
    StateNotifierProvider<CategoriaNotifier, List<Service>>((ref) {
  return CategoriaNotifier();
});

class CategoriaNotifier extends StateNotifier<List<Service>> {
  CategoriaNotifier() : super(RandomServiceGenerator.gerServiceList());

  void addServicio() {
    state = [
      ...state,
      Service(
        serviceId: "id",
        name: "name",
        image: "image",
        description: "description",
        type: ["type"],
        price: "price",
        unit_of_measure: "unit_of_measure",
        quantity: "quantity",
        telefono: "telefono",
        provincia: "provincia",
        starRate: 3,
      )
    ];
  }
}
