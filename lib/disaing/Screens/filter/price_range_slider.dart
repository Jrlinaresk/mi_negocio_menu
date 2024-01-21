import 'package:flutter/material.dart';
import 'package:minegociomenu/disaing/Screens/filter/dual_button_list.dart';

class PriceRangeSlider extends StatefulWidget {
  @override
  _PriceRangeSliderState createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  double _minValue = 0;
  double _maxValue = 10000;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$0',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w100,
                      color: Theme.of(context).primaryColor)),
              Text('\$5k',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w100,
                      color: Theme.of(context).primaryColor)),
              Text('\$10k',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w100,
                      color: Theme.of(context)
                          .primaryColor)), // Puedes ajustar el rango máximo aquí
            ],
          ),
        ),
        RangeSlider(
          values: RangeValues(_minValue as double, _maxValue as double),
          onChanged: (RangeValues values) {
            setState(() {
              _minValue = values.start;
              _maxValue = values.end;
            });
          },
          min: 0,
          max: 10000,
          divisions: 250, // Puedes ajustar esto según tus necesidades
          labels:
              RangeLabels('\$${_minValue.toInt()}', '\$${_maxValue.toInt()}'),
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Colors.grey[300],
          onChangeEnd: (RangeValues values) {
            // Puedes agregar lógica adicional al finalizar el cambio
          },
        ),
        Text('Desde: \$${_minValue.toInt()} hasta \$${_maxValue.toInt()}',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w200,
                color: Theme.of(context).primaryColor)),
        const SizedBox(
          height: 16.0,
        ),
      ],
    );
  }
}
