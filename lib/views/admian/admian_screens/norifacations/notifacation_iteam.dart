import 'package:bus_app/data/models/notifacation_model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotifacationIteam extends StatelessWidget {
  const NotifacationIteam({super.key, required this.noteData});
  final NotifactionModel noteData;
  @override
  Widget build(BuildContext context) {
    String dateString = noteData.createdAt!;
    DateTime dateTime = DateTime.parse(dateString);

    // Format the DateTime to extract hour and minute
    DateFormat timeFormat = DateFormat('HH:mm');
    String formattedTime = timeFormat.format(dateTime);
    return Padding(
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
                  noteData.notification!,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      formattedTime,
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
