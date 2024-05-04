import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/const.dart';
import 'package:bus_app/shared/shard_widjet/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bus_app/shared/shard_widjet/custom_button.dart';
import 'package:go_router/go_router.dart';

class FirstOnbording extends StatelessWidget {
  const FirstOnbording({Key? key}) : super(key: key);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SvgPicture.asset(
                      'assets/images/onbording1.svg',
                      width: MediaQuery.of(context).size.width * 0.8,
                      // Adjust width as needed, here it's 70% of the screen width
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                "Skip the wait",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 25),
              const Text(
                "Get on board with the easiest\n way to ride the bus",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    hight: 50,
                    width: MediaQuery.of(context).size.width * 0.4,
                    // Adjust width as needed, here it's 40% of the screen width
                    text: "Driver",
                    backgroundColor: AppColors.buttonCooler,

                    onPressed: () {
                      context.go('/login', extra: "admian");
                    },
                  ),
                  CustomButton(
                    hight: 50,
                    width: MediaQuery.of(context).size.width * 0.4,
                    // Adjust width as needed, here it's 40% of the screen width
                    backgroundColor: AppColors.buttonCooler,

                    text: "Client",
                    onPressed: () {
                      GoRouter.of(context).pushReplacement("/secondonbording");
                    },
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
