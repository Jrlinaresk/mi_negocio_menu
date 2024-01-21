import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:minegociomenu/core/Helpers/random_generator.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/negocio/domain/negocio.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/services/domain/service_model.dart';
import 'package:minegociomenu/domain/globalProviders/negocio_state_notifier_provider.dart';
import 'package:minegociomenu/domain/globalProviders/servicios/state_provider.dart';

class ServiceItem extends ConsumerStatefulWidget {
  final Service service;
  final int index;

  const ServiceItem({super.key, required this.service, required this.index});

  @override
  _ServiceItemState createState() => _ServiceItemState();
}

class _ServiceItemState extends ConsumerState<ServiceItem> {
  bool isFavorito = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext cont) {
    isFavorito = widget.service.favorito;
    final Servicelastview = ref.watch(lastView);
    final nfilter = ref.watch(NegocioFilterProvider);
    final nlist = ref.watch(NegocioStateNotifierProvider);
    var a = NegocioFilter.all;

    return Expanded(
        child: InkWell(
            onTap: () {
              UpdateServiceLastView(ref, widget.service);
              context.push(
                '/negociodetallesscreen',
              );
            },
            child: Container(
                child: _mCard(
                    cont, nlist, Servicelastview) // _Listnegocios(nlist),
                )));
  }

  Widget _mCard(
      BuildContext cont, List<Negocio> serviceAsync, Service servicelastview) {
    return Card(
      color: Colors.white,
      // Personaliza la apariencia de cada elemento aquí
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8.0),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Image.asset(
                                RandomGenerator.GeTimageRandom(
                                    servicelastview.name!),
                                height: 32,
                              ),
                              tooltip: 'Click',
                              onPressed: () {
                                UpdateServiceLastView(ref, widget.service);
                                context.push(
                                  '/negociodetallesscreen',
                                );
                                ScaffoldMessenger.of(cont).showSnackBar(
                                    const SnackBar(
                                        content: Text('This is a snackbar')));
                              },
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(serviceAsync[widget.index].nombre)
                              ],
                            ),
                            Row(
                              children: [
                                Text(serviceAsync[widget.index].categoria)
                              ],
                            ),
                            // Agrega más información y personalización aquí según tus necesidades
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }

  void UpdateServiceLastView(WidgetRef ref, Service s) {
    ref.read(lastView.notifier).update((state) => s);
  }
}
