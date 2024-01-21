import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:minegociomenu/presentation/Screens/homeScreen/presentation/screen/new_home.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_fullscreen_image.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_image.dart';
import 'package:minegociomenu/core/utils/ui/tools.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: OnBoardingPage());
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeNew()),
    );
  }

  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecorationWithColor(Color bgColor) {
      return PageDecoration(
        titleTextStyle:
            const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300),
        bodyTextStyle: const TextStyle(fontSize: 16.0),
        bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        imagePadding: EdgeInsets.zero,
        pageColor: bgColor,
      );
    }

    DotsDecorator dotsDecoratorWithColor(Color dotColor, Color activeDotColor) {
      return DotsDecorator(
        size: const Size(10.0, 10.0),
        color: dotColor,
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        activeColor: activeDotColor,
      );
    }

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      key: introKey,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
/*       globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: buildImage('logo.png', 100),
          ),
        ),
      ), */
/*       globalFooter: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            child: const Text(
              '¡Vamos de inmediato!',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () => _onIntroEnd(context),
          ),
        ),
      ), */
      pages: [
        //deliciosa oferta
        PageViewModel(
          title: "Exelentes Ofertas",
          body:
              "Ofertas irresistibles en café de alta calidad. ¡Ahorra sin dejar de disfrutar!",
          image: Padding(
            padding: const EdgeInsets.only(top: 132.0),
            child: buildImage('logo.png', false),
          ),
          decoration: pageDecorationWithColor(Colors.white),
        ),
        //entrega a domicilio
        PageViewModel(
          title: "Entrega a Domicilio",
          body:
              "Tu café favorito, ahora en tu puerta. ¡Haz tu pedido y disfruta en casa!",
          image: Padding(
            padding: const EdgeInsets.only(top: 132.0),
            child: buildImage('tack_order.png', false),
          ),
          decoration: pageDecorationWithColor(Colors.white),
        ),
        //pago en linea
        PageViewModel(
          title: "Sistema de Pago Online",
          body:
              "Agiliza tus transacciones con nuestro sistema de pago en línea. Rapidez y seguridad al alcance de un clic.",
          image: Padding(
            padding: const EdgeInsets.only(top: 132.0),
            child: buildImage('payment_online.png', false),
          ),
          decoration: pageDecorationWithColor(Colors.white),
        ),
      ],

      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('omitir', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Listo', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: dotsDecoratorWithColor(Color.fromARGB(255, 197, 197, 197),
          const Color(0xffFFD54B)), // Cambia el color de los indicadores
      dotsContainerDecorator: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
