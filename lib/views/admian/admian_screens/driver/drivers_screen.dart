import 'package:bus_app/views/Admian/admian_screens/driver/deivers_card.dart';
import 'package:flutter/material.dart';

class DriversScreen extends StatelessWidget {
  const DriversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 5, // Adjust the number of cards as needed
        itemBuilder: (context, index) {
          return DriversCard();
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
