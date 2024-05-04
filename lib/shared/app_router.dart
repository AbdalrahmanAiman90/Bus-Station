import 'package:bus_app/views/Admian/admian_layout.dart';
import 'package:bus_app/views/loginpage/login_screen.dart';
import 'package:bus_app/views/onbording_screen/onbordingfirst.dart';
import 'package:bus_app/views/onbording_screen/onbordingsecond.dart';
import 'package:bus_app/views/registerpage/register_screen.dart';
import 'package:bus_app/views/splachscreen.dart';
import 'package:bus_app/views/user/comment_screen/commint_screen.dart';
import 'package:bus_app/views/user/driver_info_screen/driver_info_screen.dart';
import 'package:bus_app/views/user/user_layout.dart';
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
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) {
          final role = state.extra as String;
          return LoginScreen(role: role);
        },
      ),
      GoRoute(
        path: '/admian',
        builder: (context, state) => AdmianLayout(),
      ),
      GoRoute(
        path: '/user',
        builder: (context, state) => UserLayout(),
      ),
      GoRoute(
        path: '/driverinfo',
        builder: (context, state) => DriverInfoScreen(),
      ),
      GoRoute(
        path: '/commintscreen',
        builder: (context, state) => CommintScreen(),
      ),
    ],
  );
}
