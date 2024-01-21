import 'package:flutter/material.dart';

double calculateImageWidth(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double imageWidth = screenWidth;
  return imageWidth - 32;
}

double calculateImageHeight(BuildContext context) {
  double imageHeight = calculateImageWidth(context) * 1.2; // 1.2 veces el ancho
  return imageHeight - 64;
}
