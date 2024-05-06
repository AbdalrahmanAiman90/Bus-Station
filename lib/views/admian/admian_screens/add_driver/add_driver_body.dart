import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bus_app/data/repos/rider_repo/ride_repo_implemnt.dart';
import 'package:bus_app/manage/creatRide/cubit/create_ride_cubit.dart';
import 'package:bus_app/manage/drivermanage/cubit/driver_cubit.dart';
import 'package:bus_app/manage/ridesmanage/cubit/rides_cubit.dart';
import 'package:bus_app/shared/api_serves.dart';
import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/shard_widjet/custom_button.dart';
import 'package:bus_app/shared/shard_widjet/state_widget.dart';
import 'package:bus_app/views/registerpage/custom_widget/custom_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:permission_handler/permission_handler.dart';

class AddDriverBody extends StatefulWidget {
  AddDriverBody({super.key});

  @override
  State<AddDriverBody> createState() => _AddDriverBodyState();
}

class _AddDriverBodyState extends State<AddDriverBody> {
  final TextEditingController driverName = TextEditingController();

  final TextEditingController price = TextEditingController();

  File? file;
  var imageUrl;

  bool isloading = false;
  void initState() {
    super.initState();
  }

  XFile? imageGallary;
  getImage() async {
    const url = "https://api.cloudinary.com/v1_1/dxakf32bv/upload";
    final ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      isloading = true;
    });
    Dio dio = Dio();
    FormData formData = new FormData.fromMap({
      "file": await MultipartFile.fromFile(
        image!.path,
      ),
      "upload_preset": "jmhvydni",
      "cloud_name": "dxakf32bv",
    });
    try {
      Response response = await dio.post(url, data: formData);

      var data = jsonDecode(response.toString());
      log("======");
      log(data['secure_url']);
      log("======");

      setState(() {
        isloading = false;
        imageUrl = data['secure_url'];
      });
    } catch (e) {
      print(e);
    }
    if (image != null) {
      file = File(image!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: BlocConsumer<CreateRideCubit, CreateRideState>(
        listener: (context, state) {
          if (state is CreatRidesLooding) {
            context.loaderOverlay.show(
              widgetBuilder: (progress) {
                return myLooding();
              },
            );
          } else if (state is CreatRidesFailure) {
            context.loaderOverlay.hide();
            MySnackBar.showErrorMessage(context, state.errorMassage);
          } else if (state is CreatRidesSuccess) {
            context.loaderOverlay.hide();
            MySnackBar.showSuccsesMessage(context, "Add Ride Succses");
            BlocProvider.of<RidesCubit>(context).fetchAllRides();
          }
        },
        builder: (context, state) {
          return Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 165,
                  width: 164,
                  color: Colors.white,
                  child: imageUrl == null
                      ? IconButton(
                          onPressed: () {
                            getImage();
                          },
                          icon: Icon(
                            Icons.add,
                            color: AppColors.primeColor,
                            size: 80,
                          ))
                      : Image.file(
                          file!,
                          height: 165,
                          width: 164,
                        ),
                ),
                SizedBox(
                  height: 20,
                ),
                MyText(
                  hintText: "Driver Name",
                  controller: driverName,
                  icon: Icon(Icons.person_outline_outlined),
                ),
                SizedBox(
                  height: 20,
                ),
                MyText(
                  hintText: "Price",
                  controller: price,
                  icon: Icon(Icons.monetization_on_outlined),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .27,
                ),
                CustomButton(
                    onPressed: () async {
                      if (file != null &&
                          price.text.isNotEmpty &&
                          driverName.text.isNotEmpty) {
                        BlocProvider.of<CreateRideCubit>(context)
                            .addRide(driverName.text, price.text, imageUrl!);
                      } else {
                        MySnackBar.showErrorMessage(
                            context, "should Enter All Data");
                      }
                    },
                    hight: 50,
                    width: double.infinity,
                    backgroundColor: AppColors.buttonCooler,
                    text: "Add a ride"),
              ],
            ),
          );
        },
      ),
    );
  }
}
