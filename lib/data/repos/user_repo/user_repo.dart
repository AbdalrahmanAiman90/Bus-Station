import 'package:bus_app/data/models/user_model/user_model.dart';
import 'package:bus_app/error/falur.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepo {
  Future<Either<Failure, UserModel>> fetchLogin(
      {required String name, required String password});
  Future<Either<Failure, UserModel>> fetchRegister(
      {required String name,
      required String email,
      required String phone,
      required String password});
}
