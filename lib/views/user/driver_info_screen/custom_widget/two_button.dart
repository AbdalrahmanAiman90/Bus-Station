import 'package:bus_app/data/models/riders_model/rider_model.dart';
import 'package:bus_app/manage/requstmanage/cubit/requst_manager_cubit.dart';
import 'package:bus_app/shared/shard_widjet/state_widget.dart';
import 'package:bus_app/views/user/driver_info_screen/custom_widget/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bus_app/manage/authmanage/notifacationmanage/cubit/notifaction_cubit_cubit.dart';
import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/shard_widjet/custom_button.dart';

class TwoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          CustomButton(
            onPressed: () {},
            hight: 50,
            width: double.infinity,
            backgroundColor: AppColors.buttonCooler,
            text: "Location",
          ),
          SizedBox(height: 18),
          CustomButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Payment()),
              );
            },
            hight: 50,
            width: double.infinity,
            backgroundColor: AppColors.buttonCooler,
            text: "Bus Arrived",
          ),
        ],
      ),
    );
  }
}
