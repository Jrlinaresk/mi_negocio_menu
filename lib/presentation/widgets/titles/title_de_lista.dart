import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Title_List_Content extends StatelessWidget {
  final String text;
  final String linkText;
  final String linkUrl;

  Title_List_Content({
    required this.text,
    required this.linkText,
    required this.linkUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 16.0, left: 16.0, bottom: 0.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
          ),
        ],
      ),
    );
  }
}
