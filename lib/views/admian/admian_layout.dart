import 'dart:developer';

import 'package:bus_app/views/Admian/admian_screens/driver/drivers_screen.dart';
import 'package:bus_app/views/Admian/admian_screens/requst/requst_screen.dart';
import 'package:bus_app/views/admian/admian_screens/add_driver/add_driver_screen.dart';
import 'package:bus_app/views/admian/admian_screens/norifacations/notification_screen.dart';
import 'package:bus_app/views/admian/admian_screens/the_rides/the_ride_screen.dart';
import 'package:flutter/material.dart';
import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/const.dart';
import 'package:bus_app/shared/shard_widjet/custom_appbar.dart';
import 'package:bus_app/views/Admian/custom_widget_admian/custom_drawer.dart';

class AdmianLayout extends StatefulWidget {
  const AdmianLayout({Key? key});

  @override
  State<AdmianLayout> createState() => _AdmianScreenState();
}

class _AdmianScreenState extends State<AdmianLayout> {
  int _selectedDrawerIndex = 0;
  String tittelAppBar = "Add Rids";
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return AddDriverScreen();

      case 1:
        return RideScreen();
      case 2:
        return Center(
          child: RequstScreen(),
        );
      case 3:
        return DriversScreen();
      case 4:
        return const NotifacationAdmianScreen();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index, String tittel) {
    setState(() {
      _selectedDrawerIndex = index;
      tittelAppBar = tittel;
    });
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.pageColor,
          centerTitle: true,
          iconTheme: const IconThemeData(size: 28, color: Colors.black),
          title: Text(
            tittelAppBar,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          toolbarHeight: 110,
          elevation: 0, // Set elevation to 0 to remove the shadow
          actions: const [
            AppBarLogo(
              logo: logo2,
            ),
          ],
        ),
        drawer: myDrawer(
            onItemTapped: _onSelectItem,
            widthScreen: MediaQuery.of(context).size.width),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
      ),
    );
  }
}
