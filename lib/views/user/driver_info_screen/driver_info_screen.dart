import 'dart:developer';

import 'package:bus_app/data/models/driver_model/driver_model.dart';
import 'package:bus_app/manage/drivermanage/cubit/driver_cubit.dart';
import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/shard_widjet/custom_button.dart';
import 'package:bus_app/shared/shard_widjet/state_widget.dart';
import 'package:bus_app/views/user/driver_info_screen/driver_info_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DriverInfoScreen extends StatefulWidget {
  const DriverInfoScreen({super.key, required this.driverid});
  final String driverid;
  @override
  State<DriverInfoScreen> createState() => _DriverInfoScreenState();
}

class _DriverInfoScreenState extends State<DriverInfoScreen> {
  @override
  initState() {
    BlocProvider.of<DriverCubit>(context)
        .fetchOneDriverData(id: widget.driverid);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<DriverCubit, DriverState>(
          builder: (context, state) {
            return state is DriverSuccess
                ? DriverInfoBody(
                    driverData: state.driverModel,
                  )
                : myLooding();
          },
        ),
      ),
    );
  }
}
