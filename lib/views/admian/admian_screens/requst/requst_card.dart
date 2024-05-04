import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/shard_widjet/custom_button.dart';
import 'package:flutter/material.dart';

class RequstCard extends StatelessWidget {
  const RequstCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double widthSreen = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0), // Add padding around each card
      child: Card(
        elevation: 0, // Adjust elevation as needed
        color: Colors.white, // Set card color to white
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10), // Adjust border radius as needed
        ),
        child: Container(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ahmed Mohmed",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Alexandria",
                        style: TextStyle(color: AppColors.primeColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      onPressed: () {},
                      backgroundColor: AppColors.buttonCooler,
                      hight: 50,
                      width: widthSreen * .4,
                      text: "Accept",
                    ),
                    CustomButton(
                      onPressed: () {},
                      backgroundColor: AppColors.rejectColor,
                      hight: 50,
                      width: widthSreen * .4,
                      text: "Reject",
                    ),
                  ],
                ),
              ],
            ),
          ), // Adjust height as needed
          // Leave the container empty
        ),
      ),
    );
  }
}
