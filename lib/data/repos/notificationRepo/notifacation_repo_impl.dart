import 'package:bus_app/data/models/notifacation_model/notification_model.dart';
import 'package:bus_app/data/repos/notificationRepo/notifacationrepo.dart';
import 'package:bus_app/error/falur.dart';
import 'package:bus_app/shared/api_serves.dart';
import 'package:bus_app/shared/const.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NotifactionRepoImplemnt extends NotifacationRepo {
  final ApiServes apiServes;
  NotifactionRepoImplemnt(this.apiServes);
  @override
  Future<Either<Failure, List<NotifactionModel>>> fetchNotifaction() async {
    try {
      String endpoint = "notice/getall";

      Map<String, dynamic> headerRequst = {
        'Cookie': token,
      };
      var data =
          await apiServes.get(endPoint: endpoint, headerRequst: headerRequst);
      List<NotifactionModel> allNotification = [];
      for (var i in data["data"]) {
        allNotification.add(NotifactionModel.fromJson(i));
      }
      return right(allNotification);
    } on Exception catch (e) {
      if (e is DioException) {
        // log(e.toString());
        return left(ServerFailuar.fromDioError(e)); //! return
      } else {
        // log(e.toString());
        return left(ServerFailuar(e.toString())); //! return
      }
    }
  }
}

