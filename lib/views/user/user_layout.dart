import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/const.dart';
import 'package:bus_app/shared/shard_widjet/custom_appbar.dart';
import 'package:bus_app/views/user/comment_screen/commint_screen.dart';
import 'package:bus_app/views/user/custom_widget/drower_user.dart';
import 'package:bus_app/views/user/notifacation_user_screen/notification_user_screen.dart';
import 'package:bus_app/views/user/oriderRide_screen/order_screen.dart';
import 'package:flutter/material.dart';

class UserLayout extends StatefulWidget {
  const UserLayout({super.key, required this.userName});
  final String userName;
  @override
  State<UserLayout> createState() => _UserLayoutState();
}

class _UserLayoutState extends State<UserLayout> {
  int _selectedDrawerIndex = 0;
  String tittelAppBar = "Order A Ride";
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return OrderScreen();

      case 1:
        return NotifacationUserScreen();

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
        drawer: myDrowerUser(
            onItemTapped: _onSelectItem,
            name: widget.userName,
            widthScreen: MediaQuery.of(context).size.width),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
      ),
    );
  }
}
