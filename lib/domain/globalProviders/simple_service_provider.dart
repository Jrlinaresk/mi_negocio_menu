import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/core/Helpers/random_service_generator.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/services/domain/service_model.dart';

final simpleServiceProvider = Provider<Service>((ref) {
  return RandomServiceGenerator.getRandomService();
});

final simpleServiceListProvider = Provider<List<Service>>((ref) {
  return RandomServiceGenerator.gerServiceList();
});

final serviceIdProvider = StateProvider<String>((ref) {
  return "0";
});

final serviceProvider =
    FutureProvider.family<Service, String>((ref, serviceId) async {
  final p = RandomServiceGenerator.getServiceById(serviceId);
  return p;
});
