import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/conf/config.dart';
import 'package:minegociomenu/disaing/widgets/logo.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  final String _versionApp = Config.versionApp;

  @override
  void initState() {
    super.initState();
/*     ref.read(locationProvider.notifier).getLocation(); */

    // Simular una carga de datos o proceso que dura 5 segundos.
    Future.delayed(const Duration(seconds: 5), () {
      // Navegar a la siguiente pantalla después de 5 segundos.
      Navigator.of(context).pushReplacementNamed('/inicio');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(0xFF2c2c2c), // Cambia el color de fondo según tu diseño.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWidget(),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              color: Colors
                  .white, // Cambia el color del indicador según tu diseño.
            ),
            const SizedBox(height: 20),
            const Text(
              'Cargando...',
              style: TextStyle(
                color:
                    Colors.white, // Cambia el color del texto según tu diseño.
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _versionApp,
              style: const TextStyle(
                color:
                    Colors.white, // Cambia el color del texto según tu diseño.
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
