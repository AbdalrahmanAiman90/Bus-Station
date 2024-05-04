import 'dart:developer';

import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/shard_widjet/custom_button.dart';
import 'package:bus_app/views/registerpage/custom_widget/custom_passord_field.dart';
import 'package:bus_app/views/registerpage/custom_widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                      PasswordTextField(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      CustomButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            log("message");
                            GoRouter.of(context).pushReplacement('/user');
                          }
                        },
                        hight: 50,
                        width: double.infinity,
                        backgroundColor: AppColors.buttonCooler,
                        text: "Sign up",
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
                              GoRouter.of(context).pushReplacement("/login");
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
