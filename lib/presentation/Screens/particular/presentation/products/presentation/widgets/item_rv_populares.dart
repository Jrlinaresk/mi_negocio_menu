import 'package:flutter/material.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/homeScreen/menu_detail.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/product_list_item.dart';
import 'package:minegociomenu/domain/models/producto/coffee.dart';

class ItemRvPopulares extends StatelessWidget {
  String? imageUrl;
  final String title;
  final String subtitle;
  final String date;
  final double rating;
  final List<double> price;
  final int starCount;
  final bool isFavorite;
  //temp
  final Coffee coffee;

  ItemRvPopulares({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.rating,
    required this.starCount,
    required this.isFavorite,
    required this.price,
    required this.coffee,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ProductListItem(
        imageUrl: imageUrl,
        title: title,
        subtitle: subtitle,
        date: date,
        rating: rating,
        starCount: starCount,
        isFavorite: isFavorite,
        price: price,
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MenuDetail(
              coffee:
                  coffee); // Asegúrate de tener una variable llamada "coffee"
        }));
      },
    );
  }
}
