import 'package:flutter/material.dart';

Widget buildImage(String source, bool isNetworkImage,
    [double width = 350,
    bool repainNeed = false,
    Color repaint = Colors.white]) {
  return isNetworkImage
      ? ColorFiltered(
          colorFilter: repainNeed
              ? ColorFilter.mode(repaint, BlendMode.clear)
              : ColorFilter.mode(repaint, BlendMode.srcATop),
          child: Image(
            fit: BoxFit.contain,
            width: width,
            height: width,
            alignment: Alignment.center,
            image: NetworkImage(source),
          ),
        )
      : repainNeed
          ? ColorFiltered(
              colorFilter: ColorFilter.mode(repaint, BlendMode.srcATop),
              child: Image(
                fit: BoxFit.contain,
                width: width,
                height: width,
                alignment: Alignment.center,
                image: AssetImage('assets/$source'),
              ),
            )
          : Image(
              fit: BoxFit.contain,
              width: width,
              height: width,
              alignment: Alignment.center,
              image: AssetImage('assets/$source'),
            );
}
