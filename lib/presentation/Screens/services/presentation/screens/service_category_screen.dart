import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/presentation/Screens/services/presentation/widgets/ServiceItem.dart';
import 'package:minegociomenu/domain/data/db/favoritos_database.dart';
import 'package:minegociomenu/domain/globalProviders/service_state_notifier_provider.dart';
import 'package:minegociomenu/domain/provider/servicios/state_provider.dart';

class ServiceCategoryScreen extends ConsumerWidget {
  final FavoritosDatabase favoritosDatabase = FavoritosDatabase();

  ServiceCategoryScreen({super.key}) {
    favoritosDatabase.initializeDatabase();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastview = ref.watch(lastView);
    return Center(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(lastview.nombre!),
          ),
          body: ServiceList(favoritosDatabase: favoritosDatabase)),
    );
  }
}

class ServiceList extends ConsumerWidget {
  final FavoritosDatabase favoritosDatabase;
  const ServiceList({super.key, required this.favoritosDatabase});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plist = ref.watch(ServiceStateNotifierProvider);
    return ListView.builder(
      itemCount: plist.length, // Cantidad de elementos en la lista
      itemBuilder: (BuildContext context, int index) {
        // Construir cada elemento de la lista
        return ServiceItem(service: plist[index], index: index);
      },
    );
  }
}
