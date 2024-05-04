import 'package:bus_app/data/repos/rider_repo/ride_repo_implemnt.dart';
import 'package:bus_app/data/repos/user_repo/user_repo_implment.dart';
import 'package:bus_app/shared/api_serves.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<UserRepoImplment>(
    UserRepoImplment(
      ApiServes(creatdio()),
    ),
  );
  getIt.registerSingleton<RideRepoImplemntion>(
    RideRepoImplemntion(
      ApiServes(creatdio()),
    ),
  );
}
