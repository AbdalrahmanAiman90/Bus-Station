import 'package:flutter/material.dart';

class AppBarInfoScreen extends StatelessWidget {
  const AppBarInfoScreen({super.key, required this.nameDriver});
  final String nameDriver;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Row(
        children: [
          Align(
            alignment: FractionalOffset.centerLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .15,
          ),
          Text(
            nameDriver,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
