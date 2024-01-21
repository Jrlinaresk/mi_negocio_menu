import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:minegociomenu/domain/data/remote/servicio/servicio_x_categoria/servicio_x_categoria.dart';
import 'package:minegociomenu/domain/models/servicios/servicio_categoria.dart';
import 'package:minegociomenu/domain/provider/servicios/state_provider.dart';
import 'package:minegociomenu/core/utils/ui/tools.dart';

class CategoriaSericeItem extends ConsumerWidget {
  final ServiceCategoria service;

  const CategoriaSericeItem({super.key, required this.service});

  @override
  Widget build(BuildContext cont, WidgetRef ref) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
          child: InkWell(
            onTap: () {
              UpdateServiceLastView(ref, service);
              showToast("Balon de gas clikeado");
              /* cont.push('/servicecategoryscreen'); */
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
/*                                         child: Column(
                                          children: [
                                            if (service.background != null)
                                              Image.asset(
                                                GeTimageRandom(service.nombre!),
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
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Balon de gas",
                                        /* service.nombre!, */
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.0,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      //Text('Teléfono: '),
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
                      //       Text('name: ${service.name}'),
                      //       Text('description: ${service.description}'),
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

  static GeTimageRandom(String nombr) {
    if (nombr == 'Alimentos') {
      var imagenesAlimentos = [
        'assets/icons/alimentos/alimentos-01.png',
        'assets/icons/alimentos/alimentos-02.png',
        'assets/icons/alimentos/alimentos-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Autos') {
      var imagenesAlimentos = [
        'assets/icons/autos/autos-01.png',
        'assets/icons/autos/autos-02.png',
        'assets/icons/autos/autos-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Belleza') {
      var imagenesAlimentos = [
        'assets/icons/belleza/belleza-01.png',
        'assets/icons/belleza/belleza-02.png',
        'assets/icons/belleza/belleza-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Construcción') {
      var imagenesAlimentos = [
        'assets/icons/construccion/construccion-01.png',
        'assets/icons/construccion/construccion-02.png',
        'assets/icons/construccion/construccion-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Decoración') {
      var imagenesAlimentos = [
        'assets/icons/decoracion/serv-decoracion-01.png',
        'assets/icons/decoracion/serv-decoracion-02.png',
        'assets/icons/decoracion/serv-decoracion-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Electrónica') {
      var imagenesAlimentos = [
        'assets/icons/electro/electro-01.png',
        'assets/icons/electro/electro-02.png',
        'assets/icons/electro/electro-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Envases') {
      var imagenesAlimentos = [
        'assets/icons/envases/envases-01.png',
        'assets/icons/envases/envases-02.png',
        'assets/icons/envases/envases-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Juguetes') {
      var imagenesAlimentos = [
        'assets/icons/juguetes/juguetes-01.png',
        'assets/icons/juguetes/juguetes-02.png',
        'assets/icons/juguetes/juguetes-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Muebles') {
      var imagenesAlimentos = [
        'assets/icons/muebles/muebles-01.png',
        'assets/icons/muebles/muebles-02.png',
        'assets/icons/muebles/muebles-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Ropa') {
      var imagenesAlimentos = [
        'assets/icons/ropa/ropa-01.png',
        'assets/icons/ropa/ropa-02.png',
        'assets/icons/ropa/ropa-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Tecnología') {
      var imagenesAlimentos = [
        'assets/icons/tecnologia/tecnologia-01.png',
        'assets/icons/tecnologia/tecnologia-02.png',
        'assets/icons/tecnologia/tecnologia-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    //servicios
    if (nombr == 'Decoración para el hogar') {
      var imagenesAlimentos = [
        'assets/icons/tecnologia/tecnologia-01.png',
        'assets/icons/tecnologia/tecnologia-02.png',
        'assets/icons/tecnologia/tecnologia-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Limpieza/ Doméstico') {
      var imagenesAlimentos = [
        'assets/icons/tecnologia/tecnologia-01.png',
        'assets/icons/tecnologia/tecnologia-02.png',
        'assets/icons/tecnologia/tecnologia-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Marketing/ diseño e impresión') {
      var imagenesAlimentos = [
        'assets/icons/tecnologia/tecnologia-01.png',
        'assets/icons/tecnologia/tecnologia-02.png',
        'assets/icons/tecnologia/tecnologia-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Alquileres') {
      var imagenesAlimentos = [
        'assets/icons/tecnologia/tecnologia-01.png',
        'assets/icons/tecnologia/tecnologia-02.png',
        'assets/icons/tecnologia/tecnologia-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Artesanía') {
      var imagenesAlimentos = [
        'assets/icons/tecnologia/tecnologia-01.png',
        'assets/icons/tecnologia/tecnologia-02.png',
        'assets/icons/tecnologia/tecnologia-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Servicios informáticos') {
      var imagenesAlimentos = [
        'assets/icons/tecnologia/tecnologia-01.png',
        'assets/icons/tecnologia/tecnologia-02.png',
        'assets/icons/tecnologia/tecnologia-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Reparación Electrónica') {
      var imagenesAlimentos = [
        'assets/icons/tecnologia/tecnologia-01.png',
        'assets/icons/tecnologia/tecnologia-02.png',
        'assets/icons/tecnologia/tecnologia-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Peluquería/ Barbería/ Belleza') {
      var imagenesAlimentos = [
        'assets/icons/tecnologia/tecnologia-01.png',
        'assets/icons/tecnologia/tecnologia-02.png',
        'assets/icons/tecnologia/tecnologia-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Restaurantes/ comida para llevar') {
      var imagenesAlimentos = [
        'assets/icons/tecnologia/tecnologia-01.png',
        'assets/icons/tecnologia/tecnologia-02.png',
        'assets/icons/tecnologia/tecnologia-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
  }

  static RandomImage(List<String> imagenes) {
    final random = Random();
    final index = random.nextInt(imagenes.length);
    return imagenes[index];
  }
}

void UpdateServiceLastView(WidgetRef ref, ServiceCategoria s) {
  //primero cambiar el valor del numero del servicio
  ref.read(servicioIdProvider.notifier).update((state) => s.id!);
  ref.read(lastView.notifier).update((state) => s);
}
