import 'package:flutter/material.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/item_rv_populares.dart';
import 'package:minegociomenu/domain/models/coffee.dart';

class List_productos_Widget extends StatelessWidget {
  final int itemCount;
  final List<Coffee> coffeeList;
  final Axis orientation;

  List_productos_Widget({
    required this.itemCount,
    required this.coffeeList,
    required this.orientation,
  });

  @override
  Widget build(BuildContext context) {
    Widget listWidget;
    Widget mcontent;

    if (orientation == Axis.vertical) {
      mcontent =
          // Vertical: Usa una Column
          listWidget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: coffeeList.take(itemCount).map((Coffee coffee) {
          return ItemRvPopulares(
            imageUrl: 'https://medias.treew.com/imgproducts/thumbs/159462.jpg',
            title: 'Nombre del producto',
            subtitle: 'Marca',
            date: '7USD',
            rating: 3.5,
            starCount: 0,
            isFavorite: false,
            price: const [17, 12],
            coffee: coffee,
          );
        }).toList(),
      );
    } else {
      // Horizontal: Usa una Row
      listWidget = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: coffeeList.take(itemCount).map((Coffee coffee) {
          return ItemRvPopulares(
            imageUrl: 'https://medias.treew.com/imgproducts/thumbs/159462.jpg',
            title: 'Nombre del producto',
            subtitle: 'Marca',
            date: '7USD',
            rating: 3.5,
            starCount: 0,
            isFavorite: false,
            price: const [17, 12],
            coffee: coffee,
          );
        }).toList(),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(
        top: 0.0,
        left: 16.0,
        bottom: 16.0,
        right: 16.0,
      ),
      child: SingleChildScrollView(
        scrollDirection: orientation,
        child: listWidget,
      ),
    );
  }
}
