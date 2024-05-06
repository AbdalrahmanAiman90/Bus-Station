import 'dart:developer';

import 'package:bus_app/data/models/driver_model/driver_model.dart';
import 'package:bus_app/manage/drivermanage/cubit/driver_cubit.dart';
import 'package:bus_app/shared/shard_widjet/state_widget.dart';
import 'package:bus_app/views/user/comment_screen/comment_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommintScreen extends StatelessWidget {
  const CommintScreen({super.key, required this.driverCommint});
  final DriverModel driverCommint;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<DriverCubit, DriverState>(
          builder: (context, state) {
            return CommintScreenBody(
              driveDate: driverCommint,
            );
          },
        ),
      ),
    );
  }
}
