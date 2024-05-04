import 'package:flutter/material.dart';

class commentScreenBar extends StatelessWidget {
  const commentScreenBar({super.key});

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
          const Text(
            "Commints",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
