import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String text;
  final double padding;
  final double fontSize;
  const InfoWidget({
    required this.text,
    required this.padding,
    required this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}