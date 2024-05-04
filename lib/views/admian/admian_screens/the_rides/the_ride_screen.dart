import 'package:bus_app/views/admian/admian_screens/the_rides/ride_card.dart';
import 'package:flutter/material.dart';

class RideScreen extends StatelessWidget {
  const RideScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView.builder(
          itemCount: 5, // Adjust the number of cards as needed
          itemBuilder: (context, index) {
            return RideCard();
          },
        ),
      ),
    );
  }
}
