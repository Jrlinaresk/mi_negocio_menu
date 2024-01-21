import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:minegociomenu/presentation/Screens/globals/02intro/screen/intro.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/coffeback.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(top: 600),
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 70.0,
        ),
      ),
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
