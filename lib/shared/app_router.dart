import 'package:bus_app/data/models/driver_model/driver_model.dart';
import 'package:bus_app/data/repos/driver_repo/driver_repo_implemnt.dart';
import 'package:bus_app/data/repos/rider_repo/ride_repo_implemnt.dart';
import 'package:bus_app/data/repos/user_repo/user_repo_implment.dart';
import 'package:bus_app/manage/authmanage/cubit/authration_cubit.dart';
import 'package:bus_app/manage/drivermanage/cubit/driver_cubit.dart';
import 'package:bus_app/manage/ridesmanage/cubit/rides_cubit.dart';
import 'package:bus_app/shared/api_serves.dart';
import 'package:bus_app/shared/srver_locator.dart';
import 'package:bus_app/views/Admian/admian_layout.dart';
import 'package:bus_app/views/loginpage/login_screen.dart';
import 'package:bus_app/views/onbording_screen/onbordingfirst.dart';
import 'package:bus_app/views/onbording_screen/onbordingsecond.dart';
import 'package:bus_app/views/registerpage/register_screen.dart';
import 'package:bus_app/views/splachscreen.dart';
import 'package:bus_app/views/user/comment_screen/commint_screen.dart';
import 'package:bus_app/views/user/driver_info_screen/driver_info_screen.dart';
import 'package:bus_app/views/user/user_layout.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        path: '/firstonbording',
        builder: (context, state) => FirstOnbording(),
      ),
      GoRoute(
        path: '/secondonbording',
        builder: (context, state) => SecondOnbording(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => BlocProvider(
          create: (context) => AuthrationCubit(getIt.get<UserRepoImplment>()),
          child: RegisterScreen(),
        ),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) {
          final role = state.extra as String;
          return BlocProvider(
            create: (context) => AuthrationCubit(getIt.get<UserRepoImplment>()),
            child: LoginScreen(role: role),
          );
        },
      ),
      GoRoute(
        path: '/admian',
        builder: (context, state) => AdmianLayout(),
      ),
      GoRoute(
        path: '/user',
        builder: (context, state) => BlocProvider(
          create: (context) =>
              RidesCubit(getIt.get<RideRepoImplemntion>())..fetchAllRides(),
          child: UserLayout(),
        ),
      ),
      GoRoute(
        path: '/driverinfo',
        builder: (context, state) => BlocProvider(
          create: (context) =>
              DriverCubit(DriverRepoImplemnt(ApiServes(creatdio()))),
          child: DriverInfoScreen(driverid: state.extra as String),
        ),
      ),
      GoRoute(
        path: '/commintscreen',
        builder: (context, state) => BlocProvider(
          create: (context) =>
              DriverCubit(DriverRepoImplemnt(ApiServes(creatdio()))),
          child: CommintScreen(
            driverData: state.extra as DriverModel,
          ),
        ),
      ),
    ],
  );
}
