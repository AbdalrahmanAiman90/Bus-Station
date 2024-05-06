import 'package:bus_app/data/models/requst_model/getall_requst/getall_requsts.dart';
import 'package:bus_app/manage/authmanage/notifacationmanage/cubit/notifaction_cubit_cubit.dart';
import 'package:bus_app/manage/requstmanage/cubit/requst_manager_cubit.dart';
import 'package:bus_app/manage/ridesmanage/cubit/rides_cubit.dart';
import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/shard_widjet/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequstCard extends StatelessWidget {
  RequstCard({required this.requstData});
  GetAllRqustModel requstData;
  @override
  Widget build(BuildContext context) {
    final double widthSreen = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0), // Add padding around each card
      child: Card(
        elevation: 0, // Adjust elevation as needed
        color: Colors.white, // Set card color to white
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10), // Adjust border radius as needed
        ),
        child: Container(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        requstData.ride!.name!,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        requstData.station ?? "Hawally 66",
                        style: TextStyle(color: AppColors.primeColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      onPressed: () async {
                        await BlocProvider.of<RequstManagerCubit>(context)
                            .accept(idreqist: requstData.idRequst!);
                        await BlocProvider.of<RequstManagerCubit>(context)
                            .getAllRequst();
                      },
                      backgroundColor: AppColors.buttonCooler,
                      hight: 50,
                      width: widthSreen * .4,
                      text: "Accept",
                    ),
                    CustomButton(
                      onPressed: () async {
                        await BlocProvider.of<RequstManagerCubit>(context)
                            .reject(idreqist: requstData.idRequst!);
                        await BlocProvider.of<RequstManagerCubit>(context)
                            .getAllRequst();
                      },
                      backgroundColor: AppColors.rejectColor,
                      hight: 50,
                      width: widthSreen * .4,
                      text: "Reject",
                    ),
                  ],
                ),
              ],
            ),
          ), // Adjust height as needed
          // Leave the container empty
        ),
      ),
    );
  }
}
