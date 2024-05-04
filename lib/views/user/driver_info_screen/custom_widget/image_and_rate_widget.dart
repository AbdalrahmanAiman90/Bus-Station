import 'package:bus_app/data/models/driver_model/driver_model.dart';
import 'package:bus_app/shared/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class imageAndRating extends StatelessWidget {
  const imageAndRating(
      {super.key,
      required this.image,
      required this.intialRate,
      required this.driverData});
  final String image;
  final num intialRate;
  final DriverModel driverData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(image),
          radius: 80,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBar.builder(
                initialRating: intialRate.toDouble(), //!
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Color(0xFFE7C76A),
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
                itemSize: 22,
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push('/commintscreen', extra: driverData);
                },
                child: Row(
                  children: [
                    Text(
                      "Commints",
                      style:
                          TextStyle(fontSize: 18, color: AppColors.primeColor),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColors.primeColor,
                      size: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
