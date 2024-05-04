import 'package:bus_app/shared/app_style.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MySnackBar {
  static void showErrorMessage(BuildContext context, String errorMessage) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: errorMessage,
      ),
    );
  }

  static void showSuccsesMessage(BuildContext context, String correctMessage) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: correctMessage,
      ),
    );
  }
}

myLooding() {
  return Center(
    child: CircularProgressIndicator(
      color: AppColors.primeColor,
    ),
  );
}
