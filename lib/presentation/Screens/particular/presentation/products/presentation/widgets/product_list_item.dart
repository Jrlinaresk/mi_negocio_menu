import 'package:flutter/material.dart';
import 'package:minegociomenu/core/utils/math.dart';

class ProductListItem extends StatelessWidget {
  String? imageUrl;
  final String title;
  String? subtitle;
  final String date;
  final double rating;
  final List<double> price;
  final int starCount;
  final bool isFavorite;

  ProductListItem({
    required this.title,
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
                        image: DecorationImage(
                          image: NetworkImage(imageUrl!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                : Container(),
            const SizedBox(width: 8.0),
            // Elementos de información
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff3E91D0),
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
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
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.green,
                      ),
                    ),
                    if (price.last == price.first)
                      Text(
                        '\$ ${(price.first)} USD',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.red.shade200,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.red.shade200,
                        ),
                      ),
                  ],
                ),
                Row(
                  children: [
/*                     if (price.first == price.length - 2)
 */
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
                            calculatePercentageChange(price.last, price.first),
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
                      '\$ ${price.last / 2} USD / lb ',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),

/*                 Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 20.0),
                    Text(
                      '(${rating.toStringAsFixed(1)}/5)',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ), */
              ],
            ),
          ],
        ),
        const SizedBox(
          width: 16.0,
        )
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
