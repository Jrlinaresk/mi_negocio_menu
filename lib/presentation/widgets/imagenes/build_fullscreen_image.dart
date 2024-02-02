import 'package:flutter/material.dart';

Widget buildFullscreenImage(
  String source,
  bool isNetworkImage,
) {
  return isNetworkImage
      ? Image.network(
          source,
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              );
            }
          },
        )
      : Image(
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          image: source.contains("assets/")
              ? AssetImage(source)
              : AssetImage('assets/$source'),
        );
}
