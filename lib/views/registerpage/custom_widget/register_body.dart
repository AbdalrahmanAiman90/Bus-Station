import 'dart:developer';

import 'package:bus_app/manage/authmanage/cubit/authration_cubit.dart';
import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/shard_widjet/custom_button.dart';
import 'package:bus_app/shared/shard_widjet/state_widget.dart';
import 'package:bus_app/views/registerpage/custom_widget/custom_passord_field.dart';
import 'package:bus_app/views/registerpage/custom_widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({super.key});
  TextEditingController userName = TextEditingController();
  TextEditingController emial = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Create An Acount",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      MyText(
                        controller: userName,
                        hintText: "User Name",
                        icon: Icon(
                          Icons.person_outline_outlined,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      MyText(
                        controller: emial,
                        hintText: "Emial",
                        icon: Icon(
                          Icons.email_outlined,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      MyText(
                        validator: (value) {
                          if (value!.length != 11) {
                            return "pleas enter 11 number";
                          } else {
                            return null;
                          }
                        },
                        controller: phone,
                        hintText: "Phone Number",
                        icon: Icon(
                          Icons.phone_outlined,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      PasswordTextField(
                        password: password,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      BlocConsumer<AuthrationCubit, AuthrationState>(
                        listener: (context, state) {
                          if (state is AuthorizationSuccess) {
                            context.loaderOverlay.hide();
                            GoRouter.of(context).pushReplacement('/user');
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
                          return CustomButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                BlocProvider.of<AuthrationCubit>(context)
                                    .authorizationRegister(
                                        name: userName.text,
                                        password: password.text,
                                        phone: phone.text,
                                        emial: emial.text);
                              }
                            },
                            hight: 50,
                            width: double.infinity,
                            backgroundColor: AppColors.buttonCooler,
                            text: "Sign up",
                          );
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account ?"),
                          TextButton(
                            onPressed: () {
                              try {
                                context.go("/login", extra: "user");
                              } on Exception catch (e) {
                                log(e.toString());
                              }
                            },
                            child: const Text(
                              "Login",
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
            ],
          ),
        ),
      ),
    );
  }
}
