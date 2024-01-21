import 'package:flutter/material.dart';
import 'package:minegociomenu/disaing/widgets/listas/item_rv_populares.dart';
import 'package:minegociomenu/models/coffee.dart';

class Listwidget extends StatelessWidget {
  final int itemCount;
  final List<Widget> widgets;
  final Axis orientation;

  const Listwidget({
    super.key,
    required this.itemCount,
    required this.widgets,
    required this.orientation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 16.0,
      ),
      child: ListView.builder(
        primary: true,
        scrollDirection: orientation,
        itemCount: itemCount < widgets.length ? itemCount : widgets.length,
        itemBuilder: (context, index) {
          return widgets[index];
        },
      ),
    );
  }
}
