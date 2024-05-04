import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/shard_widjet/custom_button.dart';
import 'package:flutter/material.dart';

Widget TowButton() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      children: [
        CustomButton(
            onPressed: () {},
            hight: 50,
            width: double.infinity,
            backgroundColor: AppColors.buttonCooler,
            text: "Location"),
        SizedBox(
          height: 18,
        ),
        CustomButton(
            onPressed: () {},
            hight: 50,
            width: double.infinity,
            backgroundColor: AppColors.buttonCooler,
            text: "Bus Arrived ")
      ],
    ),
  );
}
