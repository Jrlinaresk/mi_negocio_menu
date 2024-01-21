import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BlurredBackground extends StatelessWidget {
  final bool isBlurred; // Variable para controlar si se aplica el desenfoque

  const BlurredBackground({Key? key, required this.isBlurred})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isBlurred
        ? BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(0.8), // Ajusta la opacidad según sea necesario
            ),
          )
        : Container(); // No aplica desenfoque si isBlurred es false
  }
}
