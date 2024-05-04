import 'dart:developer';

import 'package:bus_app/data/repos/rider_repo/ride_repo.dart';
import 'package:bus_app/data/repos/rider_repo/ride_repo_implemnt.dart';
import 'package:bus_app/manage/ridesmanage/cubit/rides_cubit.dart';
import 'package:bus_app/shared/api_serves.dart';
import 'package:bus_app/shared/shard_widjet/state_widget.dart';
import 'package:bus_app/views/user/oriderRide_screen/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: BlocConsumer<RidesCubit, RidesState>(
          listener: (context, state) {
            if (state is RidesFailure) {
              MySnackBar.showErrorMessage(context, state.errorMassage);
            }
          },
          builder: (context, state) {
            if (state is RidesSuccess) {
              return ListView.builder(
                itemCount: state
                    .allRides.length, // Adjust the number of cards as needed
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: OrderIteam(rideModel: state.allRides[index]),
                    onTap: () {
                      GoRouter.of(context).push("/driverinfo");
                    },
                  );
                },
              );
            } else {
              return myLooding();
            }
          },
        ),
      ),
    );
  }
}
