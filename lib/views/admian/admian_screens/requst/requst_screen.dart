import 'package:bus_app/views/Admian/admian_screens/requst/requst_card.dart';
import 'package:flutter/material.dart';

class RequstScreen extends StatelessWidget {
  const RequstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5, // Adjust the number of cards as needed
        itemBuilder: (context, index) {
          return RequstCard();
        },
      ),
    );
  }
}
