import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/core/Helpers/random_generator.dart';
import 'package:minegociomenu/core/Helpers/random_negocio_generator.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/negocio/domain/negocio.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

enum NegocioFilter {
  all,
  autos,
  belleza,
  construccion,
  decoracion,
  electronica,
  tecnologia,
}

final NegocioStateNotifierProvider =
    StateNotifierProvider<NegocioNotifier, List<Negocio>>((ref) {
  return NegocioNotifier();
});

class NegocioNotifier extends StateNotifier<List<Negocio>> {
  NegocioNotifier() : super(RandomNegocioGenerator.gerNegocioList());

  void addNegocio() {
    state = [
      ...state,
      Negocio(
        id: 'id',
        nombre: RandomGenerator.getRandomName(),
        descripcion: 'descripcion',
        direccion: 'direccion',
        telefono: 'telefono',
        email: 'email@example.com',
        favorito: true,
        categoria: "Autos",
        img1: 'img12',
        img2: 'img2', // Indica si es un negocio favorito
      )
    ];
  }

/*   void toogleNegocioFavorito(bool b) {
    state = state.map((Negocioo) {
      if (b) {
        return Negocioo.copyWith(favorito: true);
      } else
        return Negocioo.copyWith(favorito: false);
    }).toList();
  } */

  void toggleNegocioFavorito(int index, bool isFavorito) {
    state[index] = state[index].copyWith(favorito: isFavorito);
  }
}

final NegocioFilterProvider = StateProvider<NegocioFilter>((ref) {
  return NegocioFilter.all;
});

final filteredNegociosProvider = Provider<List<Negocio>>((ref) {
  final selectedFilter = ref.watch(NegocioFilterProvider);
  final negocios = ref.watch(NegocioStateNotifierProvider);

  List<Negocio> filteredNegocios;

  switch (selectedFilter) {
    case NegocioFilter.all:
      filteredNegocios = negocios;
      break;
    case NegocioFilter.autos:
      filteredNegocios =
          negocios.where((negocio) => negocio.categoria == 'autos').toList();
      break;
    case NegocioFilter.belleza:
      filteredNegocios =
          negocios.where((negocio) => negocio.categoria == 'belleza').toList();
      break;
    case NegocioFilter.construccion:
      filteredNegocios = negocios
          .where((negocio) => negocio.categoria == 'construccion')
          .toList();
      break;
    case NegocioFilter.decoracion:
      filteredNegocios = negocios
          .where((negocio) => negocio.categoria == 'decoracion')
          .toList();
      break;
    case NegocioFilter.electronica:
      filteredNegocios = negocios
          .where((negocio) => negocio.categoria == 'electronica')
          .toList();
      break;
    case NegocioFilter.tecnologia:
      filteredNegocios = negocios
          .where((negocio) => negocio.categoria == 'tecnologia')
          .toList();
      break;
  }

  return filteredNegocios;
});
