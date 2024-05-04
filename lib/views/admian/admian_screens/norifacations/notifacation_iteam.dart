import 'package:flutter/material.dart';

class NotifacationIteam extends StatelessWidget {
  const NotifacationIteam({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Card(
          elevation: 0,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 16, right: 15, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "You arrived to Alaa esam at station khitan 34",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "20:15",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 158, 158, 158)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
