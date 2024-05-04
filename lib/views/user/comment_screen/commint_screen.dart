import 'package:bus_app/views/user/comment_screen/comment_screen_body.dart';
import 'package:flutter/material.dart';

class CommintScreen extends StatelessWidget {
  const CommintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CommintScreenBody(),
      ),
    );
  }
}
