import 'package:flutter/material.dart';
import 'package:minegociomenu/core/utils/math.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_fullscreen_image.dart';

class ProductListItem extends StatelessWidget {
  String? imageUrl;
  String? title;
  String? subtitle;
  final String date;
  final double rating;
  final List<double> price;
  final int starCount;
  final bool isFavorite;

  ProductListItem({
    this.title,
    required this.subtitle,
    required this.date,
    required this.rating,
    required this.starCount,
    required this.isFavorite,
    required this.price,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Elemento de imagen
        imageUrl != null
            ? Card(
          elevation: 0,
          child: Container(
            height: 128.0,
            width: 96.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: buildFullscreenImage(imageUrl!, false),
            ),
          ),
        )
            : Container(),
        const SizedBox(width: 8.0),
        // Elementos de información
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '(${rating.toStringAsFixed(1)}/5)',
                    style: TextStyle(fontSize: 12.0, color: Colors.grey.shade500),
                  ),
                ),
              ],
            ),
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  title!,
                  style:  TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue.shade900,
                  ),
                ),
              ),
            if (subtitle != null)
              Text(
                "Marca: ${subtitle!}",
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '\$ ${price.last} USD ',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: price.first != -1 ? Colors.red : Theme.of(context).primaryColor,
                  ),
                ),
                if (price.first != -1)
                  Text(
                    '\$ ${(price.first)} USD',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.grey,
                    ),
                  ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (price.first == price.length - 2 || price.first != -1)
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade300,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          calculatePercentageChange(
                              price.last, price.first),
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                    ],
                  ),
                Text(
                  '\$ ${price.last / 2} USD/lb',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
        /*         // Icono de favorito
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              // Implementa la lógica de agregar/remover de favoritos aquí
            },
          ), */
      ],
    );
  }
}
