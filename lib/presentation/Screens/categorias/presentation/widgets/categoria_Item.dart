import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:minegociomenu/domain/entity/dto_categoria.dart';
import 'package:minegociomenu/domain/provider/categoria_producto.dart/state_provider.dart';
import 'package:minegociomenu/domain/provider/producto_x_categoria.dart';
import 'package:minegociomenu/core/utils/ui/tools.dart';

class CategoriaItem extends ConsumerWidget {
  final Categoria categoria;

  const CategoriaItem({super.key, required this.categoria});

  @override
  Widget build(BuildContext cont, WidgetRef ref) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
          child: InkWell(
            onTap: () {
              UpdateCategoriaLastView(ref, categoria);
              showToast("Cliente clikeado");
              /* cont.push('/productcategoryscreen'); */
            },
            child: Card(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: SizedBox(
/*                                         child: Column(
                                          children: [
                                            if (categoria.background != null)
                                              Image.asset(
                                                GeTimageRandom(
                                                    categoria.nombre!),
                                                fit: BoxFit
                                                    .cover, // Ajusta la imagen al tamaño especificado
                                                height: 64,
                                              )
                                            else
                                              Image.asset(
                                                "assets/identidad/icono.jpg",
                                                fit: BoxFit
                                                    .cover, // Ajusta la imagen al tamaño especificado
                                                height: 64,
                                              ),
                                          ],
                                        ), */
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Ejemplo"
/*                                           NombreDeCategoriaFormateado(
                                              categoria.alias!),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.0) */
                                          ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("10-09-2024"
/*                                         categoria.descripcion!,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12.0) */
                                          ),
                                    ],
                                  ),
                                  // Agrega más información y personalización aquí según tus necesidades
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Container(
                              child: const Icon(Icons.keyboard_arrow_right),
                            ),
                          )
                        ],
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 8.0),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text('name: ${categoria.name}'),
                      //       Text('description: ${categoria.description}'),
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(height: 8.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String NombreDeCategoriaFormateado(String nombreCompleto) {
  // Dividir el nombre completo en palabras
  List<String> palabras = nombreCompleto.split(' ');

  // Tomar la primera palabra y eliminar caracteres especiales al final
  String primeraPalabra = palabras.isNotEmpty
      ? palabras.first.replaceAll(RegExp(r'[^\w\s]'), '')
      : '';
  return primeraPalabra;
}

void UpdateCategoriaLastView(WidgetRef ref, Categoria s) {
  //primero cambiar el valor del numero de la categoria
  ref.read(categoriaIdProvider.notifier).update((state) => s.id!);
  ref.read(lastView.notifier).update((state) => s);
}
