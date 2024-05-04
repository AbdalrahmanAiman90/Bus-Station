import 'package:bus_app/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use Future.delayed to wait for 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      // After 5 seconds, navigate to the home page

      GoRouter.of(context).pushReplacement("/firstonbording");
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: SvgPicture.asset(
            logo1,
          ),
        ),
      ),
    );
  }
}
