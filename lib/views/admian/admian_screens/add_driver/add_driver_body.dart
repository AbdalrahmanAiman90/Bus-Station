import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/shard_widjet/custom_button.dart';
import 'package:bus_app/views/registerpage/custom_widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddDriverBody extends StatelessWidget {
  AddDriverBody({super.key});
  final TextEditingController driverName = TextEditingController();
  final TextEditingController price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 165,
              width: 164,
              color: Colors.white,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: AppColors.primeColor,
                    size: 80,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            MyText(
              hintText: "Driver Name",
              controller: driverName,
              icon: Icon(Icons.person_outline_outlined),
            ),
            SizedBox(
              height: 20,
            ),
            MyText(
              hintText: "Price",
              controller: price,
              icon: Icon(Icons.monetization_on_outlined),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .27,
            ),
            CustomButton(
                onPressed: () {},
                hight: 50,
                width: double.infinity,
                backgroundColor: AppColors.buttonCooler,
                text: "Add a ride"),
          ],
        ),
      ),
    );
  }
}
