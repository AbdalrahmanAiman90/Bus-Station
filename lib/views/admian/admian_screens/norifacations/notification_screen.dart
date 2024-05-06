import 'package:bus_app/manage/authmanage/notifacationmanage/cubit/notifaction_cubit_cubit.dart';
import 'package:bus_app/shared/shard_widjet/state_widget.dart';
import 'package:bus_app/views/admian/admian_screens/norifacations/notifacation_iteam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotifacationAdmianScreen extends StatelessWidget {
  const NotifacationAdmianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NotifactionCubit, NotifactionCubitState>(
        builder: (context, state) {
          if (state is SuccsNotifactionCubit) {
            return ListView.separated(
              itemCount: state.allNotifacation.isEmpty
                  ? 1
                  : state.allNotifacation
                      .length, // Adjust the number of cards as needed
              itemBuilder: (context, index) {
                return state.allNotifacation.isNotEmpty
                    ? NotifacationIteam(
                        noteData: state.allNotifacation[index],
                      )
                    : const Center(
                        child: Text(
                        "Not Notafication Yet",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w100),
                      ));
              },
              separatorBuilder: (context, index) => const SizedBox(
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
