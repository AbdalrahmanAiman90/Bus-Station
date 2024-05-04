import 'package:bus_app/data/repos/driver_repo/driver_repo_implemnt.dart';
import 'package:bus_app/data/repos/rider_repo/ride_repo.dart';
import 'package:bus_app/data/repos/rider_repo/ride_repo_implemnt.dart';
import 'package:bus_app/data/repos/user_repo/user_repo_implment.dart';
import 'package:bus_app/shared/api_serves.dart';
import 'package:bus_app/shared/app_router.dart';
import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/const.dart';
import 'package:bus_app/shared/srver_locator.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

Future<void> main() async {
  setup();
  runApp(const MyApp());
  token =
      "jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjM1YzM2ZjAyZmI2OGFjOTQ2YjdlZDkiLCJpYXQiOjE3MTQ4MDgwMjMsImV4cCI6MTcxNTI0MDAyM30.5Z6GuWcpqr_vOXXWszuFq5yX9tV9-0py7ieacxfvA7I";
  DriverRepoImplemnt(ApiServes(creatdio()))
      .fetchOneDriver("6633834b4ed854ead5c90aa1");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.pageColor,
          applyElevationOverlayColor: false,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
