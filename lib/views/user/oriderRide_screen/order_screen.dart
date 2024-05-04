import 'dart:developer';

import 'package:bus_app/data/repos/rider_repo/ride_repo.dart';
import 'package:bus_app/data/repos/rider_repo/ride_repo_implemnt.dart';
import 'package:bus_app/manage/ridesmanage/cubit/rides_cubit.dart';
import 'package:bus_app/shared/api_serves.dart';
import 'package:bus_app/shared/shard_widjet/state_widget.dart';
import 'package:bus_app/views/user/custom_widget/drower_user.dart';
import 'package:bus_app/views/user/oriderRide_screen/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
              context.loaderOverlay.hide();
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
                      GoRouter.of(context).push("/driverinfo",
                          extra: state.allRides[index].driver);
                    },
                  );
                },
              );
            } else if (state is RidesLooding) {
              return myLooding();
            } else {
              return Center(
                child: Text(
                  "Not Found Data",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
