import 'package:bus_app/data/models/riders_model/rider_model.dart';
import 'package:bus_app/data/models/user_model/user_model.dart';
import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/shard_widjet/custom_button.dart';
import 'package:bus_app/views/admian/admian_screens/the_rides/custom_wedget/custom_drob.dart';
import 'package:bus_app/views/user/oriderRide_screen/dropdowen_station_user.dart';
import 'package:flutter/material.dart';

class OrderIteam extends StatelessWidget {
  const OrderIteam({Key? key, required this.rideModel});
  final RideModel rideModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * .25,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  width: MediaQuery.of(context).size.width * .4,
                  height: 170,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(rideModel.image.toString())),
                  ),
                ),
              ),
              SizedBox(
                //todo responsiv
                width: MediaQuery.of(context).size.width * .04,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 140),
                    child: Image.asset(
                      "assets/images/exclution.png",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    rideModel.name.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 0,
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
                        .4, // Adjust width constraint as needed
                    height: 40, // Adjust height constraint as needed
                    child: CustomDownUser(),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  CustomButton(
                      onPressed: () {},
                      hight: 40,
                      width: MediaQuery.of(context).size.width * .4,
                      backgroundColor: AppColors.buttonCooler,
                      text: "Request")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
