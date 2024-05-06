import 'package:bus_app/manage/drivermanage/cubit/driver_cubit.dart';
import 'package:bus_app/shared/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentTextField extends StatefulWidget {
  const CommentTextField({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<CommentTextField> createState() => _CommentTextFieldState();
}

class _CommentTextFieldState extends State<CommentTextField> {
  late FocusNode _focusNode;
  bool isFocused = false;
  TextEditingController commintText = TextEditingController();

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
    return Positioned(
      bottom: isFocused ? 0 : 25,
      left: 0,
      right: 0,
      child: Padding(
        padding: isFocused
            ? EdgeInsets.symmetric(horizontal: 0)
            : EdgeInsets.symmetric(horizontal: 18),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: BlocBuilder<DriverCubit, DriverState>(
                    builder: (context, state) {
                      return TextField(
                        controller: commintText,
                        focusNode: _focusNode,
                        decoration: InputDecoration(
                          hintText: state is CommintLooding
                              ? "Sending..."
                              : 'Write your comment',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(201, 158, 158, 158),
                          ),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(150),
                            borderSide: BorderSide(color: Color(0xFF397162)),
                          ),
                          contentPadding: isFocused
                              ? EdgeInsets.symmetric(horizontal: 10)
                              : EdgeInsets.symmetric(horizontal: 80),
                          // Center align the text
                          alignLabelWithHint: true,
                        ),
                      );
                    },
                  ),
                ),
              ),
              if (isFocused)
                IconButton(
                  icon: BlocBuilder<DriverCubit, DriverState>(
                    builder: (context, state) {
                      return state is CommintLooding
                          ? CircularProgressIndicator(
                              color: AppColors.primeColor)
                          : Icon(
                              Icons.send,
                              color: AppColors.primeColor,
                            );
                    },
                  ),
                  onPressed: () async {
                    // Set a short delay to allow the circular progress indicator to be displayed
                    Future.delayed(Duration(milliseconds: 1200), () {
                      // Unfocus the text field after the delay
                      FocusScope.of(context).unfocus();
                    });

                    // Set the state to indicate that the comment is being sent
                    BlocProvider.of<DriverCubit>(context)
                        .sendCoomint(widget.id, commintText.text);
                    commintText.clear();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
