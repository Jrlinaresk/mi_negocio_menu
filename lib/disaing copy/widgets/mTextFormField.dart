import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool usr;
  final bool showPass;
  final ValueChanged<String> onChanged;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.usr,
    required this.showPass,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 1,
      obscureText: !usr && !showPass,
      keyboardType:
          usr ? TextInputType.emailAddress : TextInputType.visiblePassword,
      style: const TextStyle(color: Colors.black),
      cursorColor: Color(0xFF2c2c2c),
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF2c2c2c)),
        ),
        hintText: usr
            ? 'Introduzca su dirección de correo electrónico'
            : "Introduzca su contraseña",
        labelText: usr ? 'Correo Electrónico' : 'Contraseña',
        labelStyle: const TextStyle(color: Color(0xFF2c2c2c), fontSize: 16.0),
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 16.0),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: Icon(
            usr ? Icons.email_outlined : Icons.lock_open,
            color: Color(0xFF2c2c2c),
            size: 18.0,
          ),
        ),
        contentPadding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        suffixIcon: !usr
            ? GestureDetector(
                onTap: () {
                  // Toggle showPass state
                  onChanged('');
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 0.0),
                  child: Icon(
                    showPass ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black87,
                    size: 20.0,
                  ),
                ),
              )
            : null,
      ),
      onChanged: onChanged,
    );
  }
}
