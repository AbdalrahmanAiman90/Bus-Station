import 'dart:developer';

import 'package:bus_app/data/models/riders_model/rider_model.dart';
import 'package:bus_app/data/models/user_model/user_model.dart';
import 'package:bus_app/manage/requstmanage/cubit/requst_manager_cubit.dart';
import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/shard_widjet/custom_button.dart';
import 'package:bus_app/shared/shard_widjet/state_widget.dart';
import 'package:bus_app/views/admian/admian_screens/the_rides/custom_wedget/custom_drob.dart';
import 'package:bus_app/views/user/oriderRide_screen/dropdowen_station_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderIteam extends StatelessWidget {
  OrderIteam({Key? key, required this.rideModel, required this.isSelected});
  final RideModel rideModel;
  String? station;
  bool isSelected;
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
                  BlocConsumer<RequstManagerCubit, RequstManagerState>(
                    builder: (context, state) {
                      return CustomButton(
                          onPressed: () {
                            BlocProvider.of<RequstManagerCubit>(context)
                                .createRideRequst(
                              idRide: rideModel.idRide!,
                            );
                          },
                          hight: 40,
                          width: MediaQuery.of(context).size.width * .4,
                          backgroundColor: isSelected &&
                                  BlocProvider.of<RequstManagerCubit>(context)
                                          .stutsRequst ==
                                      "Pending"
                              ? AppColors.primeColor
                              : AppColors.buttonCooler,
                          text: BlocProvider.of<RequstManagerCubit>(context)
                                          .stutsRequst ==
                                      "Pending" &&
                                  isSelected
                              ? "wating..."
                              : "Request");
                    },
                    listener: (BuildContext context, RequstManagerState state) {
                      if (state is RequstManagerCreatRequstSuccess) {
                        MySnackBar.showSuccsesMessage(context,
                            "wait for accept from Driver to ${BlocProvider.of<RequstManagerCubit>(context).station}");
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
