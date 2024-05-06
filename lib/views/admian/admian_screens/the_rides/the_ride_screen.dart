import 'package:bus_app/manage/ridesmanage/cubit/rides_cubit.dart';
import 'package:bus_app/shared/shard_widjet/state_widget.dart';
import 'package:bus_app/views/admian/admian_screens/the_rides/ride_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

class RideScreen extends StatelessWidget {
  const RideScreen({Key? key});

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
                  return RideCard(
                    rideModel: state.allRides[index],
                  );
                },
              );
            } else if (state is RidesLooding) {
              return myLooding();
            } else {
              return Center(child: Text("$state"));
            }
          },
        ),
      ),
    );
  }
}
