import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minegociomenu/core/config.dart';
import 'package:minegociomenu/presentation/Screens/Login/presentation/Screen/login.dart';
import 'package:minegociomenu/presentation/Screens/Login/presentation/widgets/RegisterButton.dart';
import 'package:minegociomenu/presentation/Screens/Login/presentation/widgets/SocialLoginRow.dart';
import 'package:minegociomenu/presentation/Screens/Login/presentation/widgets/mTextFormField.dart';
import 'package:minegociomenu/presentation/widgets/ProgressIndicator.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/logo.dart';
import 'package:minegociomenu/domain/provider/auth_service.dart';
import 'package:minegociomenu/core/utils/app_preferences.dart';
import 'package:minegociomenu/core/utils/ui/tools.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loginResult = false;
  bool showUsertext = true;
  late Size size;
  Orientation orientation = Orientation.portrait;
  late double spacing = orientation == Orientation.portrait ? 20 : 0;
  bool logingOneTime = true,
      saving = false,
      keyboardActivated = false,
      showPass = false;

  late TextEditingController tecEmail;
  late TextEditingController tecPass;
  String _email = ' ';
  String _password = ' ';
  bool _rememberPassword = false;

  @override
  void initState() {
    super.initState();
    tecEmail = TextEditingController();
    tecPass = TextEditingController();
  }

  @override
  void dispose() {
    tecEmail.dispose();
    tecPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    if (logingOneTime && !saving && AppPreferences.lastLogin != '') {
      logingOneTime = false;
      Map data = jsonDecode(AppPreferences.lastLogin);
      Login.changeEmail(data['email']);
      Login.changePassword(data['pass']);
      tecEmail.text = Login.email;
      tecPass.text = Login.password;
      _handleLogin();
    }

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
                  bottom: size.height * 0.01,
                  right: 20,
                  child: const Text(
                    Config.versionApp,
                    style: TextStyle(color: Color.fromRGBO(243, 130, 54, 1)),
                  )),

              _form(),
              Container(
                alignment: Alignment.bottomCenter,
                // color: Colors.amberAccent,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: _BottomPosition(),
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

  Widget _form() {
    return OrientationBuilder(builder: (context, o) {
      if (!keyboardActivated) orientation = o;
      double spacing = orientation == Orientation.portrait ? 8 : 0;
      return Padding(
        padding: const EdgeInsets.only(
            top: 256.0, left: 8.0, right: 8.0, bottom: 8.0),
        child: Container(
          //color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  _createCredenciales(),
                  SizedBox(
                    height: spacing,
                  ),
                  _createRadioButton(),
                  SizedBox(
                    height: spacing,
                  ),
                  _bottomloging(),
                  const SizedBox(
                    height: 4.0,
                  ),
                  const RegisterButton()
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
      margin:
          const EdgeInsets.only(top: 24.0, left: 48.0, right: 48.0, bottom: 0),
      // height: 8.0.h,
      width: double.infinity,
      child: Column(
        children: [
          _createTextField(
              login.emailStream, Login.changeEmail, true, tecEmail), //user
          Column(
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
              activeColor: Colors.grey.shade800,
              value: _rememberPassword,
              toggleable: true,
              onChanged: (dynamic value) {
                _rememberPassword = !_rememberPassword;
                setState(() {});
              }),
          const Text('Recordar mi cuenta',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0))
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
                    controller: tec,
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
          child: const Column(
            children: [
              SocialLoginRow(),
              SizedBox(
                height: 16,
              ),
/*               Text('¿No tienes una cuenta?',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0)), */
              SizedBox(
                height: 2,
              ),
            ],
          ),
        );
      }),
    );
  }

  void _handleLogin() async {
    showToast("Inicio de sesión exitoso!");
    context.push('/dasboardscreen');
/*     AuthService authService = AuthService("http://62.72.6.126/api");
    // Datos de ejemplo (puedes obtener estos datos del usuario)
    String username = _email;
    String password = _password;

    loginResult = await authService.login(username, password);

    if (loginResult) {
      // Éxito en el inicio de sesión
      showToast("Inicio de sesión exitoso!");
      context.push('/dasboardscreen');
    } else {
      // Error en el inicio de sesión
      showToast("Error en el inicio de sesión");
      // Puedes mostrar un mensaje de error o manejarlo de otra manera
    } */
  }

  Widget _bottomloging() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32.0),
      width: 335.0,
      height: 64.0,
      child: ElevatedButton(
        onPressed: () {
          _email = tecEmail.text;
          _password = tecPass.text;
          if (_email != '' && _password != '') {
            _handleLogin();
          }
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade100,
          elevation: 8.0,
          backgroundColor: const Color(0xFF2c2c2c),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
            ),
          ),
        ),
        child: const Text(
          'Ingresar',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
