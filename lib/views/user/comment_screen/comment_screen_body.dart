import 'package:bus_app/views/user/comment_screen/custom_widget/textfield_commint.dart';
import 'package:flutter/material.dart';
import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/views/user/comment_screen/custom_widget/app_bar_commint_screen.dart';
import 'package:bus_app/views/user/comment_screen/custom_widget/commint_iteam_.dart';

class CommintScreenBody extends StatefulWidget {
  const CommintScreenBody({Key? key});

  @override
  _CommintScreenBodyState createState() => _CommintScreenBodyState();
}

class _CommintScreenBodyState extends State<CommintScreenBody> {
  late FocusNode _focusNode;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      isFocused = _focusNode.hasFocus;
    });
  }

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
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: commentIteam("hallo"),
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
