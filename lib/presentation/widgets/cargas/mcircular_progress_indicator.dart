import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../imagenes/build_image.dart';

class CustomLoadingIndicator extends StatelessWidget {
  String? message;

  CustomLoadingIndicator({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Theme.of(context).primaryColor,
        ),
        Positioned(
          bottom: 0.0,
          right: 32.0,
          child: buildImage("full_logo.png", false, 196),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 0,
          ),
          child: SpinKitFadingCircle(
            color: Colors.white,
            size: 70.0,
          ),
        ),
        message != null ? Text(message!) : const Text(''),
      ],
    );
  }
}
