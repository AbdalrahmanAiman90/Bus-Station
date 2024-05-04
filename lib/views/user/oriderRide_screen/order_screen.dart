import 'dart:developer';

import 'package:bus_app/views/user/oriderRide_screen/order_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView.builder(
          itemCount: 5, // Adjust the number of cards as needed
          itemBuilder: (context, index) {
            return GestureDetector(
              child: OrderIteam(),
              onTap: () {
                GoRouter.of(context).push("/driverinfo");
              },
            );
          },
        ),
      ),
    );
  }
}
