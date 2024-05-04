import 'package:flutter/material.dart';

Widget myDrawer({
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
              "Add a ride",
              style: TextStyle(fontSize: 18),
            ),
            leading: Image.asset(
              "assets/images/delivery.png",
              height: 25,
              width: 25,
            ),
            onTap: () => onItemTapped(0, "Add a rides"),
          ),
          ListTile(
            title: const Text(
              "Rides",
              style: TextStyle(fontSize: 18),
            ),
            leading: Image.asset(
              "assets/images/home.png",
              height: 25,
              width: 25,
            ),
            onTap: () => onItemTapped(1, "The Riders"),
          ),
          ListTile(
            title: const Text(
              "requests",
              style: TextStyle(fontSize: 18),
            ),
            leading: Image.asset(
              "assets/images/Vector.png",
              height: 25,
              width: 25,
            ),
            onTap: () => onItemTapped(2, "Requests"),
          ),
          ListTile(
            title: const Text(
              "drivers",
              style: TextStyle(fontSize: 18),
            ),
            leading: Image.asset(
              "assets/images/person.png",
              height: 25,
              width: 25,
            ),
            onTap: () => onItemTapped(3, "Drivers "),
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
            onTap: () => onItemTapped(4, "Notifacation"),
          ),
        ],
      ),
    ),
  );
}
