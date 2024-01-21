import 'package:flutter/material.dart';
import 'package:minegociomenu/disaing/widgets/imagenes/build_fullscreen_image.dart';

Widget PromoWidget(
  String source,
  bool isNetworkImage,
  bool ofert,
) {
  return Container(
    color: Colors.transparent,
    height: 196,
    width: double.infinity,
    child: Stack(
      children: [
        // Imagen de fondo
        Padding(
          padding: const EdgeInsets.only(),
          child: buildFullscreenImage(
            source,
            isNetworkImage,
          ),
        ),

        //docoracion
        ofert
            ? Container(
                height: 196, // ajusta la altura según tus necesidades
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(255, 52, 52, 52),
                      Colors.transparent,
                    ],
                    stops: [
                      0.25,
                      0.5
                    ], // proporción de negro (40%) y transparente (60%)
                  ),
                ),
              )
            : Container(),

        ofert
            ? const Padding(
                padding: EdgeInsets.only(top: 48.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 24.0,
                      ),
                      child: Text("Super Oferta",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w100,
                              color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 24.0,
                      ),
                      child: Text("50%",
                          style: TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24.0, top: 80.0),
                      child: Text("Este fin de semana",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w100,
                              color: Colors.white)),
                    ),
                  ],
                ),
              )
            : Container(),
      ],
    ),
  );
}
