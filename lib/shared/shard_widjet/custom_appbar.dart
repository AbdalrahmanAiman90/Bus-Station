import 'package:bus_app/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarLogo extends StatelessWidget {
  final String logo;
  const AppBarLogo({Key? key, required this.logo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5, top: 10),
      child: SvgPicture.asset(
        logo,
        width: 100, // Adjust the width of the logo as needed
        height: 130, // Adjust the height of the logo as needed
      ),
    );
  }
}
