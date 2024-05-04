import 'package:flutter/material.dart';

Widget myDrowerUser({
  required Function(int index, String tittel) onItemTapped,
  required double widthScreen,
}) {
  return Drawer(
    width: widthScreen * .535,
    shape: const RoundedRectangleBorder(
      borderRadius:
          BorderRadius.zero, // Set to zero to remove the circular border
    ),
    backgroundColor: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Ahmed Mohmed",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          ListTile(
            title: const Text(
              "Drivers",
              style: TextStyle(fontSize: 18),
            ),
            leading: Image.asset(
              "assets/images/person.png",
              height: 25,
              width: 25,
            ),
            onTap: () => onItemTapped(0, "Order A Ride"),
          ),
          ListTile(
            title: const Text(
              "Notifacation",
              style: TextStyle(fontSize: 18),
            ),
            leading: Image.asset(
              "assets/images/iconamoon_notification-bold.png",
              height: 25,
              width: 25,
            ),
            onTap: () => onItemTapped(1, "Notifications"),
          ),
        ],
      ),
    ),
  );
}
