import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget _registerButton(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 0.0),
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              '¿Olvidaste tu contraseña?',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey),
            ),
          ),
        ),
        // Container(
        //   margin: const EdgeInsets.only(left: 0.0),
        //   child:
        //   Text('¿No tienes una cuenta?',
        //   style: TextStyle(
        //   color: Theme.of(context).hoverColor,
        //   fontWeight: FontWeight.w500,
        //   fontSize: 10.0.sp)),
        // ),
        // Container(
        //   alignment: Alignment.bottomRight,
        //   margin: const EdgeInsets.only(right: 30),
        //   child: TextButton(
        //     onPressed: () {
        //       Navigator.pushReplacementNamed(context, 'register');
        //     },
        //     child:
        //       Text('Regístrate',
        //       style: TextStyle(
        //       color: Theme.of(context).hoverColor,
        //       fontWeight: FontWeight.w500,
        //       fontSize: 8.0.sp))
        //   ),
        // )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _registerButton(context);
  }
}
