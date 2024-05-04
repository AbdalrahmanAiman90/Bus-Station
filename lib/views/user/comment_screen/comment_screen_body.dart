import 'dart:developer';

import 'package:bus_app/data/models/driver_model/driver_model.dart';
import 'package:bus_app/manage/drivermanage/cubit/driver_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/views/user/comment_screen/custom_widget/app_bar_commint_screen.dart';
import 'package:bus_app/views/user/comment_screen/custom_widget/commint_iteam_.dart';
import 'package:bus_app/views/user/comment_screen/custom_widget/textfield_commint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommintScreenBody extends StatelessWidget {
  CommintScreenBody({Key? key, required this.comments});
  List<Review> comments;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          child: ListView(
            children: [
              const commentScreenBar(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: comments.length == 0 ? 1 : comments.length,
                itemBuilder: (context, index) {
                  return comments.length == 0
                      ? Center(
                          child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .3),
                            child: const Text(
                              "No Comment yet",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                        ))
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: commentIteam(comments[index].title.toString()),
                        );
                },
              ),
            ],
          ),
        ),
        CommentTextField(),
      ],
    );
  }
}
