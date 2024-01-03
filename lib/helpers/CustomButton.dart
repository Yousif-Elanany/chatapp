import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  CustomButon({this.onPRESS, required this.text});
  VoidCallback? onPRESS;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPRESS,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
