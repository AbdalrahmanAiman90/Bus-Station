import 'dart:developer';

import 'package:bus_app/manage/authmanage/cubit/authration_cubit.dart';
import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/const.dart';
import 'package:bus_app/shared/shard_widjet/custom_button.dart';
import 'package:bus_app/shared/shard_widjet/state_widget.dart';
import 'package:bus_app/views/registerpage/custom_widget/custom_passord_field.dart';
import 'package:bus_app/views/registerpage/custom_widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key, this.role = "user"});
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? role;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 80,
              ),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    MyText(
                      hintText: "User Name",
                      controller: userName,
                      icon: Icon(Icons.person_outline_outlined),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    PasswordTextField(
                      password: password,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              BlocConsumer<AuthrationCubit, AuthrationState>(
                listener: (context, state) {
                  if (state is AuthorizationSuccess) {
                    context.loaderOverlay.hide();
                    if (role == "admian") {
                      if (state.userData.data!.result!.name == "admin") {
                        isAdmin = true;
                        GoRouter.of(context).pushReplacement("/admian");
                      } else {
                        isAdmin = false;

                        MySnackBar.showErrorMessage(context, "You Not Admin");
                      }
                    } else {
                      if (state.userData.data!.result!.name != "admin") {
                        GoRouter.of(context).pushReplacement("/user",
                            extra: state.userData.data!.result!.name);
                      } else {
                        MySnackBar.showErrorMessage(context, "You Not user");
                      }
                    }
                    // role == "admian"
                    //     ? GoRouter.of(context).pushReplacement("/admian")
                    //     : GoRouter.of(context).pushReplacement("/user");
                  } else if (state is AuthorizationFailure) {
                    context.loaderOverlay.hide();
                    return MySnackBar.showErrorMessage(
                        context, state.errorMassage);
                  } else {
                    context.loaderOverlay.show(
                      widgetBuilder: (progress) {
                        return myLooding();
                      },
                    );
                  }
                },
                builder: (context, state) {
                  log(password.text);
                  return CustomButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        await BlocProvider.of<AuthrationCubit>(context)
                            .authorizationLogin(
                                name: userName.text, password: password.text);
                      }
                    },
                    backgroundColor: AppColors.buttonCooler,
                    hight: 50,
                    width: double.infinity,
                    text: "Login",
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              role == "admian"
                  ? Text(" ")
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don’t have an acount ? "),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).pushReplacement("/register");
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
