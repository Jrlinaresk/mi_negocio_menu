import 'package:flutter/material.dart';
import 'package:minegociomenu/core/config/config.dart';
import 'package:minegociomenu/presentation/Screens/globals/04Login/presentation/Screen/login.dart';
import 'package:minegociomenu/presentation/Screens/globals/04Login/presentation/widgets/SocialLoginRow.dart';
import 'package:minegociomenu/presentation/Screens/globals/04Login/presentation/widgets/mTextFormField.dart';
import 'package:minegociomenu/presentation/widgets/texto/CustomUnderlinedText.dart';
import 'package:minegociomenu/presentation/widgets/botones/EnterButton.dart';
import 'package:minegociomenu/presentation/widgets/ProgressIndicator.dart';

import 'package:minegociomenu/presentation/widgets/imagenes/logo.dart';

import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  bool showUsertext = true;
  late Size size;
  Orientation orientation = Orientation.portrait;
  late double spacing = orientation == Orientation.portrait ? 20 : 0;
  bool logingOneTime = true,
      saving = false,
      keyboardActivated = false,
      showPass = false;

  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPass = TextEditingController();
  late TextEditingController _controller;
  final String _email = ' ';
  final String _password = ' ';
  bool _rememberPassword = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // size = MediaQuery.of(context).size;
    //
    // if (logingOneTime && !saving && pref.lastLogin != '') {
    //   logingOneTime = false;
    //   Map data = jsonDecode(pref.lastLogin);
    //   Login.changeEmail(data['email']);
    //   Login.changePassword(data['pass']);
    //   tecEmail.text = Login.email;
    //   tecPass.text = Login.password;
    //   _signIn();
    // }
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: saving,
        progressIndicator: const mProgressIndicator(),
        child: SingleChildScrollView(
          //SingleChildScrollView
          child: Stack(
            children: [
              const Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: LogoWidget(),
                ),
              ),
              //App version
              Positioned(
                  top: size.height * 0.05,
                  right: 20,
                  child: const Text(
                    Config.versionApp,
                    style: TextStyle(color: Color(0xFF2c2c2c)),
                  )),

              _form(),
              const Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SocialMediaButtons(),
                ),
              ),

              Container(
                alignment: Alignment.bottomCenter,
                // color: Colors.amberAccent,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Container(),
              )
            ],
          ),
        ),
      ),

      // Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: <Widget>[
      //       Positioned.fill(
      //         child: Align(
      //           alignment: Alignment.center,
      //           child: _logo(),
      //         ),),
      //       //App version
      //       Positioned(
      //           bottom: size.height * 0.01,
      //           right: 20,
      //           child: const Text(
      //             Config.versionApp,
      //             style: TextStyle(color: Color.fromRGBO(243, 130, 54, 1)),
      //           )),
      //       _form(),
      //
      //     ],
      //   ),
      // ),
    );
  }

  Widget _textBienvenido() {
    return Column(
      children: [
        const Text('Bienvenido',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        Container(
            margin: const EdgeInsets.only(top: 8.0, right: 0.0, bottom: 0),
            color: const Color(0xff000000),
            child: const SizedBox(
              height: 2.0,
              width: 48.0,
            ))
      ],
    );
  } //#2

  Widget _form() {
    return OrientationBuilder(builder: (context, o) {
      if (!keyboardActivated) orientation = o;
      double spacing = orientation == Orientation.portrait ? 8 : 0;
      return Padding(
        padding: const EdgeInsets.only(
            top: 270.0, left: 8.0, right: 8.0, bottom: 8.0),
        child: Container(
          //color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 64.0, right: 64.0),
                          child: Center(
                            child: Text(
                              "by: Digital Export",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 48.0,
                        ),
                        EnterButton(
                          buttonText: 'Registro',
                          route: '/registerscreen',
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 64.0, right: 64.0),
                          child: Center(
                            child: Text(
                              "Registrese un nuevo cliente",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: spacing + 8.0,
                  ),
                  Container(
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        EnterButton(
                          buttonText: 'Administrador',
                          route: '/login',
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 64.0, right: 64.0),
                          child: Center(
                            child: Text(
                              "Reportes y estadisticas",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
/*                   Container(
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        EnterButton(
                          buttonText: 'Seguir',
                          route: '/dasboardscreen',
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 64.0, right: 64.0),
                          child: Center(
                            child: Text(
                              "Continua sin registro",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                   */
                  SizedBox(
                    height: spacing + 8.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  //#B
  Widget _createCredenciales() {
    final login = Login();
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 48.0, right: 48.0, bottom: 0),
      // height: 8.0.h,
      width: double.infinity,
      child: Column(
        children: [
          showUsertext
              ? _createTextField(
                  login.emailStream, Login.changeEmail, true, tecEmail) //user
              : Column(
                  children: [
                    _createTextField(login.passwordStream, Login.changePassword,
                        false, tecPass), //pass
                  ],
                ), //User
        ],
      ),
    );
  }

  Widget _createRadioButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 45),
      width: double.infinity,
      child: Row(
        children: [
          Radio(
              splashRadius: 0.0,
              groupValue: true,
              activeColor: Colors.black,
              value: _rememberPassword,
              toggleable: true,
              onChanged: (dynamic value) {
                _rememberPassword = !_rememberPassword;
                setState(() {});
              }),
          const Text('Recordar mi cuenta',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0))
        ],
      ),
    );
  }

  Widget _createTextField(stream, onChanged, usr, tec) {
    return StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: CustomTextFormField(
                    controller: _controller,
                    usr: usr,
                    showPass: showPass,
                    onChanged: onChanged),
              ),
            ],
          );
        });
  }

  Widget _BottomPosition() {
    return SizedBox(
      height: 266.0,
      child: OrientationBuilder(builder: (context, o) {
        if (!keyboardActivated) orientation = o;
        double spacing = orientation == Orientation.portrait ? 8 : 0;
        return Padding(
          padding: EdgeInsets.only(
              top: size.height / 8, left: 8.0, right: 8.0, bottom: 8.0),
          child: Column(
            children: [
              const SocialLoginRow(),
              const SizedBox(
                height: 16,
              ),
              CustomUnderlinedText(
                  text: "¿No tienes una cuenta?",
                  onTap: () {
                    context.push('/registerscreen');
                  })
            ],
          ),
        );
      }),
    );
  }

  Widget _ButtonLoggin(String texto, String push) {
    return FittedBox(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32.0),
          width: 335.0,
          height: 64.0,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                showUsertext = !showUsertext;
                if (showUsertext == true) {
                  //parche hasta q este la validacion de loggin
                  context.push(push);
                }
              });
            },
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.grey.shade100,
              elevation: 8.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(0.0),
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(0.0),
                ),
              ),
            ),
            child: Text(
              texto,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
          )),
    );
  }
}

//

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96.0,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 64.0, right: 64.0),
            child: Center(
              child: Text(
                "Siguenos en nuestras redes sociales",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            padding:
                const EdgeInsets.only(bottom: 8.0, left: 48.0, right: 48.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SocialButton(
                    icon: Icon(Bootstrap.twitter), color: Colors.white),
                SocialButton(
                    icon: Icon(Bootstrap.facebook), color: Colors.white),
                SocialButton(
                    icon: Icon(Bootstrap.linkedin), color: Colors.white),
                SocialButton(
                    icon: Icon(Bootstrap.instagram), color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final Icon icon;
  final Color color;

  const SocialButton({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xFF2c2c2c),
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
