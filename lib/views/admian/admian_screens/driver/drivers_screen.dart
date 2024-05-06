import 'package:bus_app/shared/shard_widjet/state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bus_app/manage/drivermanage/cubit/driver_cubit.dart';
import 'package:bus_app/views/Admian/admian_screens/driver/deivers_card.dart';

class DriversScreen extends StatelessWidget {
  const DriversScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DriverCubit, DriverState>(
        builder: (context, state) {
          if (state is AllDriverSuccess) {
            return ListView.separated(
              itemCount: state
                  .driverModel.length, // Adjust the number of cards as needed
              itemBuilder: (context, index) {
                return DriversCard(
                  driverData: state.driverModel[index],
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
            );
          } else {
            return myLooding();
          }
        },
      ),
    );
  }
}
