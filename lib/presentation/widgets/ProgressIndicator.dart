import 'package:flutter/material.dart';

class mProgressIndicator extends StatelessWidget {
  const mProgressIndicator({super.key});

  @override
  Widget _progressIndicator(Size size) {
    return Container(
      height: size.height * 0.1,
      width: size.width * 0.15,
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.043, vertical: size.height * 0.03),
      decoration: const BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: const Center(
          child: CircularProgressIndicator(
            color: Colors.amber,
          )),
    );
  } //#1

  @override
  Widget build(BuildContext context) {
    late Size size;
    size = MediaQuery.of(context).size;
    return _progressIndicator(size);
  }

}