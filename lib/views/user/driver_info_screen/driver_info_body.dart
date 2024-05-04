import 'package:bus_app/views/user/driver_info_screen/custom_widget/app_bar_info_screen.dart';
import 'package:bus_app/views/user/driver_info_screen/custom_widget/image_and_rate_widget.dart';
import 'package:bus_app/views/user/driver_info_screen/custom_widget/two_button.dart';
import 'package:flutter/material.dart';

class DriverInfoBody extends StatelessWidget {
  const DriverInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBarInfoScreen(),
          imageAndRating(),
          SizedBox(height: MediaQuery.of(context).size.height * .33),
          TowButton()
        ],
      ),
    );
  }
}
