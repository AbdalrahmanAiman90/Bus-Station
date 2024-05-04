import 'package:bus_app/shared/app_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.onPressed,
      required this.hight,
      required this.width,
      required this.backgroundColor,
      this.textColor,
      required this.text});
  final Function()? onPressed;
  final double hight;
  final double width;
  final String text;
  final Color? backgroundColor;
  Color? textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: backgroundColor,
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}
