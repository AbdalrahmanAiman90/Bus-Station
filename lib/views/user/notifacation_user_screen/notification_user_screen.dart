import 'package:bus_app/views/admian/admian_screens/norifacations/notifacation_iteam.dart';
import 'package:flutter/material.dart';

class NotifacationUserScreen extends StatelessWidget {
  const NotifacationUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 5, // Adjust the number of cards as needed
        itemBuilder: (context, index) {
          return NotifacationIteam();
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
