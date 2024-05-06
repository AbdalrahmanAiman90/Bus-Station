import 'package:bus_app/data/models/driver_model/driver_model.dart';
import 'package:bus_app/data/models/riders_model/rider_model.dart';
import 'package:bus_app/manage/requstmanage/cubit/requst_manager_cubit.dart';
import 'package:bus_app/shared/const.dart';
import 'package:bus_app/views/user/driver_info_screen/custom_widget/app_bar_info_screen.dart';
import 'package:bus_app/views/user/driver_info_screen/custom_widget/image_and_rate_widget.dart';
import 'package:bus_app/views/user/driver_info_screen/custom_widget/two_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DriverInfoBody extends StatelessWidget {
  const DriverInfoBody({
    Key? key,
    required this.driverData,
  }) : super(key: key);
  final DriverModel driverData;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<RequstManagerCubit>(context);
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBarInfoScreen(nameDriver: driverData.name!),
          imageAndRating(
            image: driverData.profileImg!,
            intialRate: driverData.rate ?? .5,
            driverData: driverData,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .33),
          isAdmin ?? false ? Text("") : TwoButton()
        ],
      ),
    );
  }
}
