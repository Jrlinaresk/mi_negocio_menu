import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle style;
  final Color textColor; // Nuevo parámetro para el color del texto principal

  const ReadMoreText({super.key, 
    required this.text,
    required this.maxLines,
    required this.style,
    required this.textColor, // Agrega el parámetro aquí
  });

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final textSpan = TextSpan(
      text: expanded ? widget.text : widget.text.substring(0, widget.maxLines),
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w200, fontSize: 18.0),
      children: <TextSpan>[
        if (!expanded)
          TextSpan(
            text: '  ...Leer más',
            style: const TextStyle(
                color: Colors.blue, // Color del texto "Leer más"
                fontWeight: FontWeight.w600),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  expanded = true;
                });
              },
          ),
      ],
    );

    return RichText(
      text: textSpan,
      maxLines: widget.maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
