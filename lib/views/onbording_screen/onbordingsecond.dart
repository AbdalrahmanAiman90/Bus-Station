import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bus_app/shared/shard_widjet/custom_button.dart';
import 'package:bus_app/shared/shard_widjet/custom_appbar.dart';
import 'package:go_router/go_router.dart'; // Import the custom app bar widget

class SecondOnbording extends StatelessWidget {
  const SecondOnbording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 130,
        elevation: 0, // Set elevation to 0 to remove the shadow
        actions: const [
          AppBarLogo(
            logo: logo1,
          ),
        ],
      ), // Use custom app bar
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              SvgPicture.asset(
                'assets/images/bus.svg',
                width: MediaQuery.of(context).size.width *
                    0.9, // Adjust width as needed
              ),
              const SizedBox(height: 130),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomButton(
                  onPressed: () {
                    GoRouter.of(context).pushReplacement("/register");
                  },
                  hight: 50,
                  width: double.infinity,
                  backgroundColor: AppColors.buttonCooler,
                  text: "Sign up",
                ),
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account ?"),
                  TextButton(
                    onPressed: () {
                      context.go('/login', extra: "user");
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
