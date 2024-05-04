import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/const.dart';
import 'package:bus_app/shared/shard_widjet/custom_appbar.dart';
import 'package:bus_app/views/loginpage/login_body.dart';
import 'package:bus_app/views/registerpage/custom_widget/register_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.role});
  final String role;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pageColor,
        automaticallyImplyLeading: false,
        toolbarHeight: 110,
        elevation: 0, // Set elevation to 0 to remove the shadow
        actions: const [
          AppBarLogo(
            logo: logo2,
          ),
        ],
      ),
      body: LoginBody(
        role: role,
      ),
    );
  }
}
