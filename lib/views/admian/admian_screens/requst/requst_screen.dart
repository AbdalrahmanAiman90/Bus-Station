import 'package:bus_app/manage/requstmanage/cubit/requst_manager_cubit.dart';
import 'package:bus_app/shared/shard_widjet/state_widget.dart';
import 'package:bus_app/views/Admian/admian_screens/requst/requst_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

class RequstScreen extends StatelessWidget {
  const RequstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<RequstManagerCubit>(context);
    return Scaffold(
      body: BlocConsumer<RequstManagerCubit, RequstManagerState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount:
                cubit.allRequst.length, // Adjust the number of cards as needed
            itemBuilder: (context, index) {
              return RequstCard(
                requstData: cubit.allRequst[index],
              );
            },
          );
        },
        listener: (BuildContext context, RequstManagerState state) {
          if (state is RequstManagerGetAllRequstLooding) {
            return context.loaderOverlay.show(
              widgetBuilder: (progress) {
                return myLooding();
              },
            );
          } else {
            return context.loaderOverlay.hide();
          }
        },
      ),
    );
  }
}
