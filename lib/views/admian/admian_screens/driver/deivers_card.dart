import 'package:bus_app/shared/app_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DriversCard extends StatelessWidget {
  const DriversCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10), // Adjust border radius as needed
        ),
        child: Container(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 55,
                      height: 54,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/Intersect.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Ahmed Mohamed",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Spacer(),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      GoRouter.of(context).push("/driverinfo");
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColors.primeColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
