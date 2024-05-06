import 'package:bus_app/data/repos/commint_repo/commint_repo_implment.dart';
import 'package:bus_app/data/repos/driver_repo/driver_repo_implemnt.dart';
import 'package:bus_app/data/repos/notificationRepo/notifacation_repo_impl.dart';
import 'package:bus_app/data/repos/rider_repo/ride_repo.dart';
import 'package:bus_app/data/repos/rider_repo/ride_repo_implemnt.dart';
import 'package:bus_app/data/repos/user_repo/user_repo_implment.dart';
import 'package:bus_app/manage/authmanage/notifacationmanage/cubit/notifaction_cubit_cubit.dart';
import 'package:bus_app/manage/requstmanage/cubit/requst_manager_cubit.dart';
import 'package:bus_app/shared/api_serves.dart';
import 'package:bus_app/shared/app_router.dart';
import 'package:bus_app/shared/app_style.dart';
import 'package:bus_app/shared/const.dart';
import 'package:bus_app/shared/srver_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

Future<void> main() async {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NotifactionCubit(
              NotifactionRepoImplemnt(
                ApiServes(creatdio()),
              ),
            )..fetchAllNotifacation(),
          ),
          BlocProvider(
            create: (context) => RequstManagerCubit()..getAllRequst(),
          ),
        ],
        child: MaterialApp.router(
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.pageColor,
            applyElevationOverlayColor: false,
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
