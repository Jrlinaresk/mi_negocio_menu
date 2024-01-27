import 'package:flutter/material.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_fullscreen_image.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_image.dart';
import 'package:minegociomenu/core/utils/math.dart';

class Sub_Cat_CustomCard extends StatelessWidget {
  final String imageUrl;
  final String text;
  final Color cardColor;
  final double cardSize;
  final double price;
  final String moneda;
  double lastprice;

  Sub_Cat_CustomCard({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.cardColor,
    required this.cardSize,
    required this.price,
    required this.moneda,
    required this.lastprice,
  });

  @override
  Widget build(BuildContext context) {
    if (lastprice == -1) lastprice = price;
    String descuento =
        calculatePercentageChange(lastprice, price); //original lastprice, price
    return Card(
      color: cardColor,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        width: cardSize,
        height: cardSize,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: buildFullscreenImage(imageUrl, true),
            ),
            descuento != "0%"
                ? Positioned(
                    top: 10.0,
                    left: 10.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red.shade500,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(0.0),
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Text(
                          descuento,
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors
                                .white, // Cambia el color del texto si es necesario
                          ),
                        ),
                      ),
                    ))
                : Container(),
            Positioned(
                bottom: 10.0,
                right: 10.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade500,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(0.0),
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      "$price $moneda",
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors
                            .white, // Cambia el color del texto si es necesario
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
