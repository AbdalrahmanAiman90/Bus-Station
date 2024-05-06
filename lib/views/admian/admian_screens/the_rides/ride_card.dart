import 'package:bus_app/data/models/riders_model/rider_model.dart';
import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/views/admian/admian_screens/the_rides/custom_wedget/custom_drob.dart';
import 'package:flutter/material.dart';

class RideCard extends StatelessWidget {
  const RideCard({Key? key, required this.rideModel});
  final RideModel rideModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 146,
                height: 170,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(rideModel.image.toString()),
                  ),
                ),
              ),
              SizedBox(
                //todo responsiv
                width: MediaQuery.of(context).size.width * .06,
              ),
              Column(
                children: [
                  Text(
                    rideModel.name.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${rideModel.price} LE",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primeColor),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    //todo responsiv
                    width: MediaQuery.of(context).size.width *
                        .36, // Adjust width constraint as needed
                    height: 40, // Adjust height constraint as needed
                    child: CustomDown(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
