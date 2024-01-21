import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:minegociomenu/disaing/Screens/negocio/domain/negocio.dart';
import 'package:minegociomenu/domain/globalProviders/negocio/state_provider.dart';
import 'package:minegociomenu/domain/globalProviders/negocio_state_notifier_provider.dart';

class NegocioItem extends ConsumerStatefulWidget {
  final Negocio negocio;
  final int index;

  const NegocioItem({super.key, required this.negocio, required this.index});

  @override
  _NegocioItemState createState() => _NegocioItemState();
}

class _NegocioItemState extends ConsumerState<NegocioItem> {
  bool isFavorito = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext cont) {
    isFavorito = widget.negocio.favorito!;
    final nfilter = ref.watch(NegocioFilterProvider);
    var a = NegocioFilter.all;
    final nlist = ref.watch(NegocioStateNotifierProvider);

    return Expanded(
        child: InkWell(
            onTap: () {
              UpdateNegocioLastView(ref, widget.negocio);
              context.push(
                '/negociodetallesscreen',
              );
            },
            child: Container(child: _mCard(cont, "as") // _Listnegocios(nlist),
                )));
  }

  Widget _Listnegocios(nlist) {
    return ListView.builder(
      itemCount: nlist.length, // Cantidad de elementos en la lista
      itemBuilder: (BuildContext context, int index) {
        // Construir cada elemento de la lista
        return NegocioItem(negocio: nlist[index], index: index);
      },
    );
    ;
  }

  Widget _mCard(BuildContext cont, negocioAsync) {
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
                              icon: Image.asset(widget.negocio.img1),
                              tooltip: 'Click',
                              onPressed: () {
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
/*                                 if (negocioAsync != null)
                                  ...List.from(negocioAsync)
                                      .map((text) => Text(text))
                                      .toList(), */
                              ],
                            ),
                            Row(
                              children: [
/*                                 if (negocioAsync != null)
                                  ...List.from(negocioAsync)
                                      .map((text) => Text(text))
                                      .toList(), */
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
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
/*                         if (negocioAsync != null)
                          ...List.from(negocioAsync)
                              .map((text) => Text(text))
                              .toList(), */
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

  void UpdateNegocioLastView(WidgetRef ref, Negocio n) {
    ref.read(lastView.notifier).update((state) => n);
  }
}
