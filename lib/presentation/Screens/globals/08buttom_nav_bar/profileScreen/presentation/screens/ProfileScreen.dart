import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:minegociomenu/presentation/Screens/globals/03bienvenido/presentation/new_home.dart';
import 'package:minegociomenu/core/utils/formaulas.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var ancho = calculateImageWidth(context) / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: OverflowBox(
                  maxWidth: double.infinity,
                  child: Transform.translate(
                    offset: const Offset(
                        128.0, -10.0), // Ajusta los valores según sea necesario
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(360),
                      ),
                      elevation: 8.0,
                      child: CircleAvatar(
                        radius: ancho + 12,
                        backgroundColor: Colors.white,
                        child: CustomPaint(
                          painter: DashedCirclePainter(
                            color: Colors.grey.shade600,
                            strokeWidth: 4.0,
                            gap: 4.0,
                          ),
                          child: CircleAvatar(
                            radius: ancho,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: ancho - 8,
                              backgroundImage:
                                  const AssetImage('assets/developed/dev.jpg'),
                              // Image.network(
                              //     'https://nikhilvadoliya.github.io/assets/images/nikhil_1.webp')
                              //     .image,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0, bottom: 32.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 128,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: const Text(
                            // km and hour
                            'JORGE R LINARES',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 32,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Container(
                          child: const Text(
                            // km and hour
                            'ARROYO NARANJO / PARRAGA / #785',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          child: const Text(
                            // km and hour
                            '51979128',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 32,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 48.0, left: 48.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mis redes sociales",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SocialButton(
                              icon: Icon(Bootstrap.twitter),
                              color: Colors.white),
                          SizedBox(
                            width: 4.0,
                          ),
                          SocialButton(
                              icon: Icon(Bootstrap.facebook),
                              color: Colors.white),
                          SizedBox(
                            width: 4.0,
                          ),
                          SocialButton(
                              icon: Icon(Bootstrap.linkedin),
                              color: Colors.white),
                          SizedBox(
                            width: 4.0,
                          ),
                          SocialButton(
                              icon: Icon(Bootstrap.instagram),
                              color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 48.0, right: 48.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SocialButton2(
                        icon: Icon(Bootstrap.share), color: Colors.black),
                  ),
                ),
              ),
              const Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.only(top: 128.0, left: 96.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SocialButton2(
                        icon: Icon(Icons.edit_note), color: Colors.black),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 48.0, bottom: 64),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RotatedBox(
                    quarterTurns:
                        3, // Rotar 90 grados en sentido contrario a las agujas del reloj
                    child: Text(
                      'ID NO. 112235566743',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 28,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton2 extends StatelessWidget {
  final Icon icon;
  final Color color;

  const SocialButton2({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: IconButton(
        icon: icon,
        color: color,
        onPressed: () {
          // Agrega aquí el comportamiento cuando se presiona el botón.
        },
      ),
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  DashedCirclePainter({
    required this.color,
    required this.strokeWidth,
    required this.gap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    final double radius = size.width / 2;
    final double circumference = 2 * 3.141592653589793 * radius;
    final int lineCount = (circumference / gap).round();

    final double deltaAngle = 2 * 3.141592653589793 / lineCount;

    for (int i = 0; i < lineCount; i += 6) {
      final double startAngle = i * deltaAngle;
      final double endAngle = (i + 1) * deltaAngle;
      final double startX = radius + radius * cos(startAngle);
      final double startY = radius + radius * sin(startAngle);
      final double endX = radius + radius * cos(endAngle);
      final double endY = radius + radius * sin(endAngle);

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
