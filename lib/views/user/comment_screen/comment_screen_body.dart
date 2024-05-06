import 'dart:developer';

import 'package:bus_app/data/models/driver_model/driver_model.dart';
import 'package:bus_app/manage/drivermanage/cubit/driver_cubit.dart';
import 'package:bus_app/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/views/user/comment_screen/custom_widget/app_bar_commint_screen.dart';
import 'package:bus_app/views/user/comment_screen/custom_widget/commint_iteam_.dart';
import 'package:bus_app/views/user/comment_screen/custom_widget/textfield_commint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommintScreenBody extends StatelessWidget {
  CommintScreenBody({Key? key, required this.driveDate});
  DriverModel driveDate;
  @override
  Widget build(BuildContext context) {
    List<String> commentList = commentService.getComments(driveDate.id!) ?? [];
    // log("{{{{{{{{}}}}}}}}");
    // log(cubit.commintuserenter.length.toString());
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
                  itemCount: commentList.isEmpty ? 1 : commentList.length,
                  itemBuilder: (context, index) {
                    return commentList.isEmpty
                        ? Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.3,
                              ),
                              child: const Text(
                                "No Comment yet",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: commentIteam(commentList[index].toString()),
                          );
                  }),
            ],
          ),
        ),
        isAdmin ?? false ? Text("") : CommentTextField(id: driveDate.id!),
      ],
    );
  }
}
