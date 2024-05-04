import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  TextEditingController password;
  PasswordTextField({required this.password});
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
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
      controller: widget.password,
      obscureText: _obscureText,
      focusNode: _focusNode,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffixIcon: _isIconVisible
            ? null
            : IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Color.fromARGB(140, 33, 33, 33)),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),

        contentPadding:
            EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 18),
        prefixIcon: _isIconVisible ? Icon(Icons.lock_outline) : null,
        filled: true,
        fillColor: Colors.white, // Set background color to white
        hintText: _isIconVisible ? "password" : "",

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
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter Password";
        } else if (value.length < 8) {
          return "the password must more than 8 ";
        } else {
          return null;
        }
      },
    );
  }
}
