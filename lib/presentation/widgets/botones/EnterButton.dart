import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EnterButton extends StatelessWidget {
  final String buttonText;
  final String route;

  const EnterButton({
    Key? key,
    required this.buttonText,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32.0),
        width: 335.0,
        height: 64.0,
        child: ElevatedButton(
          onPressed: () {
            context.push(route);
          },
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.grey.shade100,
            elevation: 8.0,
            backgroundColor: const Color(0xFF2c2c2c), //2c2c2c
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
              ),
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );
  }
}
