import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyText extends StatefulWidget {
  MyText(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.icon});
  TextEditingController controller;
  String hintText;
  Icon icon;
  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  bool? isObscure;

  String? Function(String?)? validator;
  FocusNode _focusNode = FocusNode();
  bool _isIconVisible = true;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isIconVisible = !_focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure ?? false,
      controller: widget.controller,
      focusNode: _focusNode,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 18),
        prefixIcon: _isIconVisible ? widget.icon : null,
        filled: true,
        fillColor: Colors.white, // Set background color to white
        hintText: _isIconVisible ? widget.hintText : "",

        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.white), // Set border color to white
          borderRadius: BorderRadius.circular(15),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.white), // Set border color to white
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.white), // Set border color to white
          borderRadius: BorderRadius.circular(16),
        ),

        // Default icon
      ),
      validator: validator ??
          (value) {
            if (value!.isEmpty) {
              return "Please enter ${widget.hintText}";
            } else {
              return null;
            }
          },
    );
    ;
  }
}
