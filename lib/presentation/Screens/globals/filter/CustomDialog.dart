import 'package:flutter/material.dart';
import 'package:minegociomenu/presentation/Screens/globals/filter/dual_button_list.dart';
import 'package:minegociomenu/presentation/Screens/globals/filter/price_range_slider.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {


    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    List<String> filters = [
      'Nuevos',
      'Ofertas',
      'Descuentos',
      'Otros...',
    ];
    List<String> filters_tipo_de_pago = [
      'Efectivo',
      'Transferencia',
      'CUP',
      'MLC',
      'USD',
    ];
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Text(
                  'Filtrar',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 2),
              Center(
                child: Text('Ayúdenos a entender lo que buscas',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        color: Theme.of(context).primaryColor)),
              ),
              // DualButtonList envuelto en SingleChildScrollView
              const Padding(
                padding: EdgeInsets.only(left: 16.0, bottom: 8.0, top: 32),
                child: Text(
                  'Tipo de pago:',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DualButtonList(filters: filters_tipo_de_pago,),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, bottom: 8.0, top: 32),
                child: Text(
                  'Categorías Disponibles:',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DualButtonList(filters: filters,),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, bottom: 8.0, top: 24.0),
                child: Text(
                  'Rango de Precio:',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Center(child: PriceRangeSlider()),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Aplicar',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
