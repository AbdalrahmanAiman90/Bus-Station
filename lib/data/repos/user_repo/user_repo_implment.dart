import 'dart:developer';

import 'package:bus_app/data/models/user_model/user_model.dart';
import 'package:bus_app/data/repos/user_repo/user_repo.dart';
import 'package:bus_app/error/falur.dart';
import 'package:bus_app/shared/api_serves.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UserRepoImplment extends UserRepo {
  final ApiServes apiServes;
  UserRepoImplment(this.apiServes);
  @override
  Future<Either<Failure, UserModel>> fetchLogin(
      {required String name, required String password}) async {
    try {
      String endpoint = "auth/login";

      Map<String, dynamic> body = {
        "name": name,
        "password": password,
      };

      var data = await apiServes.post(endpoint: endpoint, bodyRequst: body);
      UserModel userData = UserModel.fromJson(data);
      log(userData.token!);
      return right(userData);
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

  @override
  Future<Either<Failure, UserModel>> fetchRegister(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    try {
      String endpoint = "auth/signup";

      Map<String, dynamic> body = {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
      };

      var data = await apiServes.post(endpoint: endpoint, bodyRequst: body);
      UserModel userData = UserModel.fromJson(data);
      log(userData.token!);
      return right(userData);
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
