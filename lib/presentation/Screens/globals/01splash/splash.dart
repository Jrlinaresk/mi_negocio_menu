import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:minegociomenu/presentation/Screens/globals/02intro/screen/intro.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_fullscreen_image.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_image.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 3500), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const IntroScreen(); //
      }));
    });
  }
}
